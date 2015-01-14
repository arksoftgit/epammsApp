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
public class SortOrderServlet extends HttpServlet {

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
   private static final Logger logger = Logger.getLogger(SortOrderServlet.class );
   private static ObjectEngine oe = null;
   private static KZOEP1AA m_KZOEP1AA = null;

   /*
    * @see HttpServlet#HttpServlet()
    */
   public SortOrderServlet() {
      super();

      oe = com.quinsoft.epamms.ZeidonObjectEngineConfiguration.getObjectEngine();
   }

   @Override
   public void init( ServletConfig config ) throws ServletException {
      this.context = config.getServletContext();
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
      logger.debug( "Order task: " + taskId );
      Task epamms = oe.getTaskById( taskId );
   // Application zeidonTools = epamms.getApplication( "Zeidon_Tools" );
   // Task zeidonSystem = oe.getSystemTask();
      String action = request.getParameter( "action" );
      logger.debug( "Post sort order action: " + action );
      String viewName = request.getParameter( "viewName" );
      String entityName = request.getParameter( "entityName" );
      View v = epamms.getViewByName( viewName );
      JSONObject jsonPost = getPostData( request );
      String strJson = jsonPost.toJSONString();
      logger.debug( "Order JSON view name: " + viewName + "  entity name: " + entityName );
      logger.debug( "Order JSON: " + strJson );
      if ( action.compareTo( "reorder" ) == 0 ) {
         String nextJsp = request.getParameter( "nextJsp" );
         if ( v != null ) {
            try {
               View v2 = v.newView( );
               v2.copyCursors( v );
               JSONArray ja = (JSONArray)jsonPost.get( "array" );
               int n = ja.size();
               int[] a = new int[n];
               int k;
               for ( k = 0; k < n; k++ ) {
                  a[k] = (Integer.parseInt(ja.get(k).toString())) - 1; // change from subsript to zero-based index
               }
               orderByNewIndex( a, v2, entityName );
               v2.drop();
            } catch (ZeidonException ze) {
               // I think this means we are at the top
               logger.debug( "reorder error: " + ze.getMessage() );
            }
         }
         response.setContentType( "text/json" );
         response.getWriter().write( new Gson().toJson( "{ \"nextJsp\" : \"" + nextJsp + "\" }" ) );
      // RequestDispatcher dispatcher = context.getRequestDispatcher( "/" + nextJsp );
      // dispatcher.forward( request, response );
      // String strURL = response.encodeRedirectURL( nextJsp );
      // response.sendRedirect( strURL );
      } else {
         //nothing to show
         response.setStatus( HttpServletResponse.SC_NO_CONTENT );
      }
   }

   private void displayEntity( View v, String entityName1, String attrName1, String entityName2, String attrName2, String entityName3, String attrName3, String msg ) {
      EntityCursor ec1 = v.getCursor( entityName1 );
      CursorResult cr = ec1.setFirst();
      EntityCursor ec2;
      EntityCursor ec3;
      logger.debug( msg );
      while ( cr == CursorResult.SET ) {
         ec2 = v.getCursor( entityName2 );
         ec3 = v.getCursor( entityName3 );
         String attr1 = ec1.getStringFromAttribute( "ID" ).toString() + "  " + ec1.getStringFromAttribute( attrName1 ).toString();
         String attr2 = (ec2.isNull()) ? "null" : ec2.getStringFromAttribute( attrName2 ).toString();
         String attr3 = (ec3.isNull()) ? "null" : ec3.getStringFromAttribute( attrName3 ).toString();
         logger.debug( entityName1 + "." + attrName1 +": " + attr1 + "   " +
                       entityName2 + "." + attrName2 +": " + attr2 + "   " +
                       entityName3 + "." + attrName3 +": " + attr3 );
         cr = ec1.setNext();
      }
   }

   private boolean orderByNewIndex( int [] arrIdx, View vOrig, String entityName ) {
      vOrig.logObjectInstance();
      logger.debug( "Order array: " + arrIdx.toString() );
      View v = vOrig.newView( );
      v.copyCursors( vOrig );
      displayEntity( v, "PrimaryRegistrant", "dRegistrantNameID",
                        "Organization", "LoginName",
                        "Organization", "Description", "Before orderByNewIndex" );
      EntityCursor ecOrig = vOrig.getCursor( entityName );
      if ( ecOrig.isNull() == false ) {
         int swaps = 0;
         int n = arrIdx.length;
         int[] arrShift = new int[n];
         int shiftMax = 0;
         int shifts;
         int k, j;

         ecOrig.setFirst();
         View vWork = vOrig.newView();
         vWork.copyCursors( vOrig );
         EntityCursor ecWork = vWork.getCursor( entityName );
         for ( k = 0; k < n - 1; k++ ) {
            // find the number of times we have shifted the current index because of a move
            shifts = 0;
            for ( j = 0; j < shiftMax; j++ ) {
               if ( k < arrShift[j] ) {
                  shifts++;
               }
            }
            if ( arrIdx[k] + shifts > k ) {
               if ( arrIdx[k] + shifts >= 0 && arrIdx[k] + shifts < n ) {
                  if ( arrIdx[k] + shifts > k + 1 ) {
                     arrShift[shiftMax++] = arrIdx[k];
                  }
                  ecWork.setFirst();
                  for ( j = 0; j < arrIdx[k] + shifts; j++ ) {
                     ecWork.setNext();
                  }
                  if ( k == 0 ) {
                     ecOrig.moveSubobject( CursorPosition.PREV, ecWork, CursorPosition.NONE );
                  } else {
                     ecOrig.moveSubobject( CursorPosition.NEXT, ecWork, CursorPosition.NEXT );
                  }
                  swaps++;
                  displayEntity( v, "PrimaryRegistrant", "dRegistrantNameID",
                                    "Organization", "LoginName",
                                    "Organization", "Description", "After swap (" + swaps + ")" );
               } else {
                  break; // error???
               }
            }
         }
         displayEntity( v, "PrimaryRegistrant", "dRegistrantNameID",
                           "Organization", "LoginName",
                           "Organization", "Description", "After orderByNewIndex Swaps: " + swaps );
         vOrig.logObjectInstance();
         return true;
      } else {
         return false;
      }
   }
}

