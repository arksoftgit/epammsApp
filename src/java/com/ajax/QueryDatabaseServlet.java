package com.ajax;

import com.google.gson.Gson;
import com.quinsoft.zeidon.Application;
import com.quinsoft.zeidon.CursorPosition;
import com.quinsoft.zeidon.CursorResult;
import com.quinsoft.zeidon.EntityCursor;
import com.quinsoft.zeidon.EntityInstance;
import com.quinsoft.zeidon.Level;
import com.quinsoft.zeidon.ObjectEngine;
import com.quinsoft.zeidon.Task;
import com.quinsoft.zeidon.View;
import com.quinsoft.zeidon.WriteOiFlags;
import com.quinsoft.zeidon.ZeidonException;
import com.quinsoft.zeidon.utils.JsonUtils;

import com.quinsoft.zeidon.zeidonoperations.KZOEP1AA;
import java.net.URLDecoder;
import java.io.ByteArrayOutputStream;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.Set;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * @author dks
 */
//@WebServlet("/labeldesigner")
public class QueryDatabaseServlet extends HttpServlet {

   private class jsonRegisteredViewArray extends JSONObject {
      jsonRegisteredViewObject objRV;
   };
   private class jsonRegisteredViewObject extends JSONObject {
      String ZKey;
      String Name;
      boolean processed;
   };
   private ServletContext context;

   private static final long serialVersionUID = 1L;
   private static final Logger logger = Logger.getLogger(QueryDatabaseServlet.class );
   private static ObjectEngine oe = null;
   private static KZOEP1AA m_KZOEP1AA = null;

   /*
    * @see HttpServlet#HttpServlet()
    */
   public QueryDatabaseServlet() {
      super();

      oe = com.quinsoft.epamms.ZeidonObjectEngineConfiguration.getObjectEngine();
   }

   @Override
   public void init( ServletConfig config ) throws ServletException {
      this.context = config.getServletContext();
   }

   private String convertTableToJSON( View mMasLC ) {
      int k;
      String s;
      String attr;
      EntityCursor ec = mMasLC.cursor( "M_MetaTable" );
      String jsonTable = "{ \"Table\" : \"" + ec.getAttribute( "Name" ).getString() +
                                                      "\", \"Description\" : \"" + ec.getAttribute( "Description" ).getString() +
                                                      "\", \"Columns\" : \"" + ec.getAttribute( "Columns" ).getString() + "\" }";
      int cols = ec.getAttribute( "Columns" ).getInteger();
      String jsonColumns = " [";
      for ( k = 1; k <= cols; k++ ) {
         attr = "Title" + k;
         s = ec.getAttribute( attr ).getString();
         if ( s != null && s.isEmpty() == false ) {
            jsonColumns += " { \"Column\" : \"" + s + "\" }, ";
         }
      }
      if ( jsonColumns.endsWith( ", ") ) {
         jsonColumns = jsonColumns.substring( 0, jsonColumns.length() - 2 );
      }
      jsonColumns += " ]";

      jsonTable += jsonColumns;
      return jsonTable;
   }

   private JSONObject getPostData( HttpServletRequest request ) {
      JSONObject json = null;
      String decoded = "";
      try {
         InputStream is = request.getInputStream();
         ByteArrayOutputStream os = new ByteArrayOutputStream();
         byte[] buf = new byte[32];
         int rc = 0;
         while( rc >= 0 ) {
             rc = is.read( buf );
             if ( rc >= 0 )
                os.write( buf, 0, rc );
         }
         String s = new String( os.toByteArray(), "UTF-8" );
         decoded = URLDecoder.decode( s, "UTF-8" );
         logger.debug( ">>>>>>>>>>>>> DECODED Post Data: " + decoded );
         logger.debug( "=================================" );
         JSONParser jsonParser = new JSONParser();
         json = (JSONObject)jsonParser.parse( decoded );
      } catch( IOException io ) {
         logger.debug( "Error getting Post data: " + io.getMessage() );
         logger.debug( "*********************************" );
      } catch( ParseException pe ) {
         logger.debug( "Unable to parse decoded JSON: " + decoded );
         logger.debug( "Parse Error: " + pe.getMessage() );
         logger.debug( "*********************************" );
      }
      return json;
   }

   /**
    * @see HttpServlet#doGet( HttpServletRequest request, HttpServletResponse response )
    */
   protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
   // handleRequest( request, response );
   }

   /*
    * @see HttpServlet#doPost( HttpServletRequest request, HttpServletResponse response )Handles the HTTP <code>POST</code> method.
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   
   @Override
   public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

      String taskId = (String) request.getSession().getAttribute( "ZeidonTaskId" );
      logger.debug( "QueryDataBase task: " + taskId );
      Task epamms = oe.getTaskById( taskId );
      String action = request.getParameter( "action" );
      logger.debug( "Post query db action: " + action );
      String viewName = request.getParameter( "viewName" );
      String entityName = request.getParameter( "entityName" );
      View v = epamms.getViewByName( viewName );
      JSONObject jsonPost = getPostData( request );
      String strJson = jsonPost.toJSONString();
      logger.debug( "Query JSON view name: " + viewName + "  entity name: " + entityName );
      logger.debug( "Query JSON: " + strJson );
      String jsonTable = "";
      if ( action.equals( "getMetaTable" ) ) {
         try {
            if ( v != null ) {
               displayEntity( v, "M_MetaTable", "Name", "Description", "Columns", "Try Table Conversion" );
               jsonTable = convertTableToJSON( v );
            // logger.debug( "Convert Table to Json: " + jsonTable );
            } else {
               jsonTable = "{}";
            }
         } catch( ZeidonException ze ) {
            logger.error( "Error processing Json Table: " + ze.getMessage() );
            jsonTable = "{}";
         } finally {
            response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
            response.getWriter().write( new Gson().toJson( jsonTable ) );
         }

      } else {
         //nothing to show
      // response.setStatus( HttpServletResponse.SC_NO_CONTENT );
         logger.debug( "Null view ... skipped processing Json Table: " + jsonTable );
         response.setContentType( "text/json" );
      // response.getWriter().write( jsonLabel );
         response.getWriter().write( new Gson().toJson( "{}" ) );
      }
   }

   private void displayEntity( View v, String entityName, String attrName1, String attrName2, String attrName3, String msg ) {
      EntityCursor ec = v.getCursor( entityName );
      CursorResult cr = ec.setFirst();
      logger.debug( msg );
      while ( cr == CursorResult.SET ) {
         String attr1 = ec.getAttribute( "ID" ).toString() + "  " + ec.getAttribute( attrName1 ).toString();
         String attr2 = ec.getAttribute( attrName2 ).toString();
         String attr3 = ec.getAttribute( attrName3 ).toString();
         logger.debug( entityName + "." + attrName1 +": " + attr1 + "   " +
                       attrName2 +": " + attr2 + "   " + attrName3 +": " + attr3 );
         cr = ec.setNext();
      }
   }
}

