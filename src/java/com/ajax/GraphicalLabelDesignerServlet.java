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
public class GraphicalLabelDesignerServlet extends HttpServlet {

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
   private static final Logger logger = Logger.getLogger( GraphicalLabelDesignerServlet.class );
   private static ObjectEngine oe = null;
   private static Integer i = 0;
   private static KZOEP1AA m_KZOEP1AA = null;

   /*
    * @see HttpServlet#HttpServlet()
    */
   public GraphicalLabelDesignerServlet() {
      super();

      oe = com.quinsoft.epamms.ZeidonObjectEngineConfiguration.getObjectEngine();
   }

   @Override
   public void init( ServletConfig config ) throws ServletException {
      this.context = config.getServletContext();
   }

   private JSONObject findRegisteredView( JSONArray rv, String ZKey ) {
      JSONObject json;
      Iterator iterator = rv.iterator();
      while ( iterator.hasNext() ) {
         json = (JSONObject) iterator.next();
         if ( ZKey.compareTo( (String) json.get( "ZKey" ) ) == 0 ) {
             return json;
         }
      }
      return null;
   }

   private StringBuffer getSkeletalLodEntities( StringBuffer xod ) {
      int lth = xod.length();
      StringBuffer oea = new StringBuffer( lth );
   // oea.setLength( 0 ); // clear the string buffer
      int k = 0;
      int j;
      int pos = 0;
      char ch;
      while ( k < lth ) {
         switch ( xod.charAt( k ) ) {
            case ' ':
            case '\t':
            case '\n':
            case '\r':
               k++;
               while ( Character.isWhitespace( xod.charAt( k ) ) )
                  k++;

               oea.append( ' ' );
               break;
            case '{':
               oea.append( '{' );
               k++;
               break;
            case '}':
               pos = oea.length() - 1;
               while ( pos > 0 && Character.isWhitespace( oea.charAt( pos ) ) )
                  pos--;
               if ( pos >= 0 && oea.charAt( pos ) == ',' ) {
                  oea.setCharAt( pos, ' ' );
                  oea.setLength( pos );
               }
               oea.append( '}' );
               k++;
               break;
            case '[':
               oea.append( '[' );
               k++;
               break;
            case ']':
               oea.append( ']' );
               k++;
               break;
            case '"':
               k++;
               j = k;
               while ( xod.charAt( k ) != '"' )
                  k++;
               String s1 = xod.substring( j, k );
               k++;
               while ( xod.charAt( k ) != ':' ) {
                  if ( xod.charAt( k ) == '{' || xod.charAt( k ) == '[' )
                     break;
                  k++;
               }
               if ( xod.charAt( k ) == '{' || xod.charAt( k ) == '[' ) {
                  // we found an open brace or bracket prior to the ":"
                  oea.append( '"' );
                  oea.append( s1 );
                  oea.append( "\" " );
                  break;
               }
               k++;

               // we are past the colon ... want to do something special if we encounter an open brace or bracket.
               while ( Character.isWhitespace( xod.charAt( k ) ) )
                  k++;
               if ( xod.charAt( k ) == '{' || xod.charAt( k ) == '[' ) {
                  // we found an open brace or bracket after the ":"
                  if ( s1.compareTo( "ATTRIB" ) == 0 ) {
                     // skip everything about an attribute
                     ch = xod.charAt( k ) == '{' ? '}' : ']';
                     k++;
                     while ( xod.charAt( k ) != ch )
                        k++;
                     k++;
                     while ( Character.isWhitespace( xod.charAt( k ) ) == false )
                        k++;
                     if ( xod.charAt( k ) == ',' )  // the final ATTRIB does not end with a comma
                        k++;
                  } else if ( s1.compareTo( ".meta" ) == 0 || s1.compareTo( ".oimeta" ) == 0 ) { // skip these guys
                     while ( xod.charAt( k ) != '}' )
                        k++;
                     while ( xod.charAt( k ) != ',' )
                        k++;
                     k++;
                  } else {
                     if ( s1.compareTo( "OBJECT" ) == 0 ) {
                        s1 = "Object";
                     } else if ( s1.compareTo( "ENTITY" ) == 0 ) {
                        s1 = "Root";
                     } else if ( s1.compareTo( "CHILDENTITY" ) == 0 ) {
                        s1 = "Entity";
                     }

                     oea.append( '"' );
                     oea.append( s1 );
                     oea.append( "\" : " );
                  }
                  break;
               }
               if ( xod.charAt( k ) == '"' ) {
                  k++;
                  j = k;
                  while ( xod.charAt( k ) != '"' ) {
                     k++;
                  }
               } else {
                  j = k;
                  k++;
                  while ( Character.isWhitespace( xod.charAt( k ) ) == false )
                     k++;
               }
               String s2 = xod.substring( j, k );
               if ( s1.compareTo( "NAME" ) == 0 ||
                    s1.compareTo( "RECURSIVE" ) == 0 ||
                    s1.compareTo( "DERIVED" ) == 0 ||
                    s1.compareTo( "version" ) == 0 ) {
                  oea.append( '"' );
                  oea.append( s1.charAt( 0 ) );
                  oea.append( s1.substring( 1 ).toLowerCase() );
                  oea.append( "\" : " );
                  if ( xod.charAt( k ) == '"' )
                     oea.append( '"' );
                  oea.append( s2 );
                  if ( xod.charAt( k ) == '"' )
                     oea.append( '"' );
                  k++;
               } else {
               /*                       
               if ( s1.compareTo( "ZKey" ) == 0 ||
                    s1.compareTo( "KEY" ) == 0 ||
                    s1.compareTo( "OPER_LIBNM" ) == 0 ||
                    s1.compareTo( "ER_DATE" ) == 0 ||
                    s1.compareTo( "MAX_LTH" ) == 0 ||
                    s1.compareTo( "ERENT_TOK" ) == 0 ||
                    s1.compareTo( "PERSIST" ) == 0 ||
                    s1.compareTo( "FULLPERSIST" ) == 0 ||
                    s1.compareTo( "CREATE" ) == 0 ||
                    s1.compareTo( "DELETE" ) == 0 ||
                    s1.compareTo( "PDELETE" ) == 0 ||
                    s1.compareTo( "UPDATE" ) == 0 ||
                    s1.compareTo( "INCLSRC" ) == 0 ||
                    s1.compareTo( "INCLUDE" ) == 0 ||
                    s1.compareTo( "EXCLUDE" ) == 0 ||
                    s1.compareTo( "ERATT_TOK" ) == 0 ||
                    s1.compareTo( "APDM_TOK" ) == 0 ||
                    s1.compareTo( "DOMAIN" ) == 0 ||
                    s1.compareTo( "TYPE" ) == 0 ||
                    s1.compareTo( "LTH" ) == 0 ||
                    s1.compareTo( "REQUIRED" ) == 0 ||
                    s1.compareTo( "XVAATT_TOK" ) == 0 ||
                    s1.compareTo( "SEQ_AD" ) == 0 ||
                    s1.compareTo( "ERREL_TOK" ) == 0 ||
                    s1.compareTo( "ERREL_LINK" ) == 0 ||
                    s1.compareTo( "CARDMIN" ) == 0 ||
                    s1.compareTo( "CARDMAX" ) == 0 ||
                    s1.compareTo( "DECIMAL" ) == 0 ||
                    s1.compareTo( "DUPENTIN" ) == 0 ||
                    s1.compareTo( "HANG_FK" ) == 0 ) {
               */                  
                  // skip these
                  k++;
                  while ( xod.charAt( k ) != ',' && xod.charAt( k ) != '}' )
                     k++;
                  if ( xod.charAt( k ) == ',' ) { // we skipped the value, so skip the comma (but not the brace)
                     k++;
                     while ( Character.isWhitespace( xod.charAt( k ) ) )
                        k++;
                  }
               }
               break;
            case ':':
               oea.append( ':' );
               k++;
               break;
            case ',':
               oea.append( ',' );
               k++;
               break;
            default:
               oea.append( xod.charAt( k ) );
               k++;
         }
      }
      return oea;
   }

   private String convertLLD_ToJSON( View vLLD ) {
      String jsonLabel = null;
   // StringWriter sw = null;
   // BufferedWriter writer = null;
      try {
      /*
         sw = new StringWriter();
         writer = new BufferedWriter( sw );
         vLLD.writeOiAsJson( writer, WriteOiFlags.INCREMENTAL );
         StringBuffer sb = sw.getBuffer();
      */

         StringBuilder sb = new StringBuilder( vLLD.serializeOi().asJson().withIncremental().toStringWriter().toString() );

      // logger.debug( "LLD Json Label from OI: " + sb.toString() );
         int posSPLD = sb.indexOf( "SubregPhysicalLabelDef" );
         int posLBracket = sb.indexOf( "[", posSPLD );
         posLBracket = sb.indexOf( "[", posLBracket + 1 ); // get to second "left bracket"
         int lastComma = -1;
         int comma = -1;
         while ( (comma = sb.indexOf( ",", comma + 1 )) < posLBracket ) {
            if ( comma > lastComma ) {
               lastComma = comma;
            }
         }
         while ( posLBracket > 0 ) {  // now search backwards for comma
            posLBracket--;
            if ( sb.charAt( posLBracket ) == ',' )
               break;
         }

         int posLLD = sb.indexOf( "SPLD_LLD" );
         while ( posLLD > 0 && sb.charAt( posLLD ) != ',' )
             posLLD--;

         sb.delete( posLBracket, posLLD );
         posLLD = sb.indexOf( "SPLD_LLD" );
         posLBracket = sb.indexOf( "[", posLLD );
         
         int bracketCnt = 1;
         int pos = posLBracket + 1;
         char ch;
         while ( pos < sb.length() && bracketCnt > 0 ) {
            if ( sb.charAt( pos ) == '"' || sb.charAt( pos ) == '\'' ) { // ignore quoted strings
               ch = sb.charAt( pos++ );
               while ( pos < sb.length() ) {
                  if ( sb.charAt( pos ) == ch )
                     break;  // out of inner loop
                  pos++;
               }
            }
            else
            if ( sb.charAt( pos ) == '[' )
               bracketCnt++;
            else
            if ( sb.charAt( pos ) == ']' )
               bracketCnt--;

            pos++;
         }

         // Remove everything after SPLD_LLD and its children, and then add back termination for
         // OIs, SubregPhysicalLabelDef, and the opening brace.
         jsonLabel = sb.substring( 0, pos ) + " } ] } ] }";
      // logger.debug( "Reduced Json Label from OI: " + jsonLabel );
         
      } catch( ZeidonException ze ) {
         logger.debug( "Error loading Json Label: " + ze.getMessage() );
         jsonLabel = "{ \"Error\" : \"" + ze.getMessage() + "\" }";
      } finally {
      /*
         if ( sw != null ) {
            try {
               sw.close();
            } catch( IOException oi ) {
               logger.debug( "Unable to close StringWriter in convertLLD_ToJSON" );
            }
         }
         if ( writer != null ) {
            try {
               writer.close();
            } catch( IOException oi ) {
               logger.debug( "Unable to close BufferedWriter in convertLLD_ToJSON" );
            }
         }
      */
      }
      return jsonLabel;
   }

   private void processJsonArray( View vLLD, JSONArray jsonArray, String entity, int depth ) {
      String indent = StringUtils.repeat( " ", (depth + 2) * 3 );
      Iterator it = jsonArray.iterator();
      while ( it.hasNext() ) {
         Object obj = it.next();
      // logger.debug( "Array type: " + obj.getClass().getName() );
         if ( obj instanceof JSONObject ) {
            JSONObject jo = (JSONObject)obj;
            if ( depth >= -1 ) {
               EntityCursor ec = vLLD.getCursor( entity );
            // if ( ec.isNull() == false ) {  // the ec may be null ==> no entities, but we may want to create one!
                  String ID = (String)jo.get( "ID" );
                  boolean recurse = false;
                  EntityInstance ei = null;
                  try {
                     String Delete = (String)jo.get( "_Delete" );
                     if ( ID == null || ID.isEmpty() ) {
                        if ( Delete == null || Delete.charAt( 0 ) != 'Y' ) {
                           ei = ec.createEntity( CursorPosition.NEXT );
                        }
                     } else {
                     // if ( ID.compareTo( "626" ) == 0 ) {
                     //    logger.debug( "Processing Entity: " + entity + "  ID: " + ID + "  Depth: " + depth );
                     // } else {
                     //    logger.debug( "Processing Entity: " + entity + "  ID: " + ID + "  Depth: " + depth );
                     // }
                        CursorResult cr = ec.setFirst( "ID", ID );
                        if ( cr == CursorResult.UNCHANGED ) {
                           logger.debug( "Entity NOT FOUND: " + entity + "  ID: " + ID + "  Depth: " + depth );
                           ei = ec.createEntity( CursorPosition.NEXT );
                           ei.getAttribute( "Tag" ).setValue( "Busted" + ID );
                           vLLD.logObjectInstance();
                           throw new ZeidonException( "Entity NOT Found: " + ID + "  Look for Busted" ); 
                        } else if ( cr == CursorResult.SET ) {
                           ei = ec.getEntityInstance();
                           if ( Delete != null && Delete.charAt( 0 ) == 'Y' ) {
                              ei.deleteEntity();
                              ei = null;
                              logger.debug( "Entity DELETED: " + entity + "  ID: " + ID + "  Depth: " + depth );
                           }
                        }
                        if ( entity.compareTo( "LLD_SubBlock" ) == 0 ) {
                           EntityCursor cursor = vLLD.getCursor( entity );
                           if ( cursor.isNull() == false ) {
                              cursor.setToSubobject();
                           // logger.debug( "SetToSubobject Entity: " + entity + "  Depth: " + depth );
                              recurse = true;
                           // entity = "LLD_Block"; entity has to stay as LLD_Block for ei.getEntityDef().getName() check later on!!!
                              cursor = vLLD.getCursor( "LLD_Block" );
                              ei = cursor.getEntityInstance();
                           }
                        }
                     }
                  // if ( ei != null ) {
                  //    logger.debug( "Entity Instance Before: " + entity + "  ID: " + ID + "  Depth: " + depth );
                  //    ei.logEntity( false );
                  // }
                     applyJsonLabelToView( vLLD, (JSONObject)obj, entity, depth + 1, ei );
                  // if ( ei != null ) {
                  //    logger.debug( "Entity Instance After: " + entity + "  ID: " + ID + "  Depth: " + depth );
                  //    ei.logEntity( false );
                  // }
                  } catch ( ZeidonException ze ) {
                    logger.debug( "Failed to process entity: " + entity + "  Depth: " + depth + "   ID: " + ID );
                  } finally {
                     if ( recurse ) {
                     // recurse = false; // not used
                     // logger.debug( "ResetFromSubobject Entity: " + entity + "  Depth: " + depth + "   ID: " + ID );
                        vLLD.resetSubobject();
                     // entity = "LLD_SubBlock"; not needed since left alone after cursor.setToSubobject()
                     }
                  }
            // }
            } else {
               // logger.debug( indent + "Entity: " + entity + "  Depth: " + depth ); 
               applyJsonLabelToView( vLLD, (JSONObject)obj, entity, depth + 1, null );
            }
         } else {
            logger.debug( indent + "Entity: " + entity + " Unknown type: " + obj.getClass().getName() );
         }
      }
   }

   private String applyJsonLabelToView( View vLLD, JSONObject jsonObject, String entity, int depth, EntityInstance ei ) {
      Set<String> keys = jsonObject.keySet();
      String indent = StringUtils.repeat( " ", (depth + 2) * 3 );
// start debug code
      boolean log = false;
      if ( ei != null ) {
         Object o = jsonObject.get( "ID" );
         if ( o instanceof String ) {
            String ID = (String)o;
            if ( ID.compareTo( "626" ) == 0 ) {
               log = true;
               logger.debug( "Before Setting entity: " + entity + "  ID: " + ID );
               ei.logEntity( false );
            }
         }
      }
// end debug code
      for ( String key : keys ) {
      // logger.debug( "OTag: " + entity + "   Key: " + key + "   Depth: " + depth );
         Object obj = jsonObject.get( key );
         if ( obj instanceof String ) {
            String value = (String)obj;
         // logger.debug( indent + "E.Attr: " + entity + "." + key + " : " + value );
            if ( ei != null ) {
               if ( entity.equals( ei.getEntityDef().getName() ) ) {
                  if ( key.compareTo( "ID" ) != 0 ) {  // attribute is not ID (which is immutable)
                     String oldValue = ei.getAttribute( key ).getString();
                     if ( oldValue.equals( value ) == false ) { // if the value has changed ...
                     // if ( key.contains( "Color" ) ) {
                     //    logger.debug( "Color: " + key + ":" + value );
                     // }
                        try {
                           ei.getAttribute( key ).setValue( value );
                        } catch ( ZeidonException ze ) {
                           if ( key.startsWith( "FK_ID_" ) || key.startsWith( "FKID" ) || key.startsWith( "AUTOSEQ" ) ) {
                              String v = ei.getAttribute( key ).getString();
                              if ( v.compareTo( value ) != 0 ) {
                                 logger.debug( "System entity.attribute changed: " + entity + "." + key + "  value: " + value + " ==> " + v );
                              }
                           } else {
                              logger.debug( "Failed to set entity.attribute: " + entity + "." + key + "  value: " + value );
                           }
                        }
                     }
                  }
               } else {
                  String msg = "ei (" + ei.getEntityDef().getName() + ") does not match entity: " + entity + " for key: " + key;
                  logger.debug( msg ); 
                  throw new ZeidonException( msg ); 
               }
            }
         } else if ( obj instanceof JSONArray ) {
            JSONArray ja = (JSONArray)obj;
            // depth is 0 for a page, 1 for a panel, 2 for a block, 3 for a subblock, ...
            if ( key.compareTo( "OIs" ) == 0 ) {
               depth = -2;
            } else if ( key.compareTo( "SPLD_LLD" ) == 0 ) {
               depth = -1;
            }
         // logger.debug( indent + "Entity: " + key + " Depth: " + (depth + 1) );
            processJsonArray( vLLD, ja, key, depth );
         } else if ( obj instanceof JSONObject ) {
         // logger.debug( indent + "MetaOI: " + key + " Skipped!" );
         // applyJsonLabelToView( vLLD, (JSONObject)obj, key, depth + 1, null );
         } else {
            logger.debug( indent + "Key: " + key + "  Unknown type: " + obj.getClass().getName() );
         }
      }
// start debug code
      if ( log ) {
         logger.debug( "After Setting entity: " + entity + "  ID: " + "626" );
         ei.logEntity( false );
      }
// end debug code
      return "";
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
      // logger.debug( ">>>>>>>>>>>>> DECODED Post Data: " + decoded );
      // logger.debug( "=================================" );
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

   private void setPathCursorPosition( View vLLD, String entityTagList, int idx1, int depth ) {
      int idx2 = entityTagList.indexOf( ".", idx1 );
      if ( idx2 >= 0 ) {
         String entity = entityTagList.substring( idx1, idx2 );
         idx1 = idx2 + 1;
         idx2 = entityTagList.indexOf( ";", idx1 );
         if ( idx2 >= 0 ) {
            String tag = entityTagList.substring( idx1, idx2 );
            EntityCursor cursor;
            if ( depth > 2 && entity.compareTo( "LLD_Block" ) == 0 ) {
               entity = "LLD_SubBlock";
            }
            cursor = vLLD.getCursor( entity );
            CursorResult cr = cursor.setFirst( "Tag", tag );
            if ( cr.isSet() ) {
               logger.debug( "View path set to Entity.Tag ================>>> " + entity + "." + tag );
            // cursor.logEntity( false );
               if ( depth > 2 && entity.compareTo( "LLD_SubBlock" ) == 0 ) {
                  cursor.setToSubobject();
               }
               if ( idx2 < entityTagList.length() - 1 ) {
                  idx2++;
                  setPathCursorPosition( vLLD, entityTagList, idx2, depth + 1 );
               }
            } else {
               logger.debug( "Could not set cursor for Entity.Tag: " + entity + "." + tag );
            }
         }
      }
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
      Task epamms = oe.getTaskById( taskId );
   // Application zeidonTools = epamms.getApplication( "Zeidon_Tools" );
   // Task zeidonSystem = oe.getSystemTask();
      String action = request.getParameter( "action" );
      logger.debug( "Post ePamms action: " + action );
      String viewName = request.getParameter( "viewName" );
      View vLLD = epamms.getViewByName( viewName );
   // if ( vLLD != null ) {
   //    logger.debug( "vLLD OI: " );
   //    vLLD.logObjectInstance();
   // }

      String jsonLabel = null;
      
      if ( action.compareTo( "setCursorPosition" ) == 0 ) {
         if ( vLLD != null ) {
            try {
               View mSPLDefBlock = epamms.getViewByName( "mSPLDefBlock" );;
               if ( mSPLDefBlock == null ) {
                  mSPLDefBlock = vLLD.newView( );
               }
               mSPLDefBlock.setName( "mSPLDefBlock", Level.TASK );
               mSPLDefBlock.resetSubobjectTop();
               View mSPLDefPanel = epamms.getViewByName( "mSPLDefPanel" );;
               if ( mSPLDefPanel == null ) {
                  mSPLDefPanel = mSPLDefBlock.newView( );
                  mSPLDefPanel.setName( "mSPLDefPanel", Level.TASK );
               } else {
                  mSPLDefPanel.resetSubobjectTop();
               }
               String viewPath = request.getParameter( "viewPath" );
               logger.debug( "Setting view path: " + viewPath );
               setPathCursorPosition( mSPLDefBlock, viewPath, 0, 0 );
               logger.debug( "Finished setting view path: " + viewPath );
            } catch (ZeidonException ze) {
               // I think this means we are at the top
               logger.debug( "resetSubobject: " + ze.getMessage() );
            }
            response.setContentType( "text/json" );
            response.getWriter().write( new Gson().toJson( "{}" ) );
         }
      } else if ( action.compareTo( "saveLabel" ) == 0 ) {
         if ( vLLD != null ) {
         // jsonLabel = getPostData( request );
            JSONObject jsonPost = getPostData( request );
            String strJson = jsonPost.toJSONString();
            logger.debug( "Save JSON: " + strJson );
         // jsonLabel = request.getParameter( "jsonLabel" );
            try {
               View v = vLLD.newView();
               v.reset();
               applyJsonLabelToView( v, jsonPost, "", -2, null );  // OIs, SPLD_LLD, depth == 0 for LLD_Page
               logger.debug( "Saved JSON to OI" );
               vLLD.logObjectInstance();
               vLLD.commit();
            } catch( ZeidonException ze ) {
               logger.debug( "Error processing Json Label: " + ze.getMessage() );
            } finally {
               convertLLD_ToJSON( vLLD );
               logger.debug( "Completed processing Json Label: " + jsonLabel );
               response.setContentType( "text/json" );
            // response.getWriter().write( jsonLabel );
               response.getWriter().write( new Gson().toJson( "{}" ) );
            }
         } else {
            logger.debug( "Null LLD ... skipped processing Json Label: " + jsonLabel );
            response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
            response.getWriter().write( new Gson().toJson( "" ) );
         }
      } else if ( action.compareTo( "saveLabelRefresh" ) == 0 ) {
         if ( vLLD != null ) {
            jsonLabel = request.getParameter( "jsonLabel" );
            try {
               JSONParser jsonParser = new JSONParser();
               JSONObject jsonObject = (JSONObject)jsonParser.parse( jsonLabel );
               applyJsonLabelToView( vLLD, jsonObject, "", -2, null );  // OIs, SPLD_LLD, depth == 0 for LLD_Page
               vLLD.commit();
            } catch( ParseException pe ) {
               logger.debug( "Unable to parse JSON: " + jsonLabel );
            } catch( ZeidonException ze ) {
               logger.debug( "Error processing Json Label: " + ze.getMessage() );
            } finally {
               jsonLabel = convertLLD_ToJSON( vLLD );
            // logger.debug( "Completed processing Json Label: " + jsonLabel );
               response.setContentType( "text/json" );
            // response.getWriter().write( jsonLabel );
               response.getWriter().write( new Gson().toJson( jsonLabel ) );
            }
         } else {
            logger.debug( "Null LLD ... skipped processing Json Label: " + jsonLabel );
            response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
            response.getWriter().write( new Gson().toJson( jsonLabel ) );
         }
      } else if ( action.compareTo( "loadLabel" ) == 0 ) {
      // We are just going to get the SPLD_LLD and its children and rename SPLD_LLD to LLD
         try {
            jsonLabel = convertLLD_ToJSON( vLLD );
         // jsonLabel = jsonLabel.replaceFirst( "\"TZLLD\",", "\"TZLLD\",\n      \"fileName\" : \"" + fileName + "\"," );
         } catch( ZeidonException ze ) {
            logger.debug( "Error loading Json Label: " + ze.getMessage() );
            jsonLabel = "{ \"Error\" : \"" + ze.getMessage() + "\" }";
         } finally {
            response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
            response.getWriter().write( new Gson().toJson( jsonLabel ) );
         }
      } else if ( action.compareTo( "getSkeletonForView" ) == 0 ) {
         View vTaskView = epamms.getViewByName( "wWebXfer" );
         vLLD = vTaskView.getViewByName( viewName );
         StringWriter sw = new StringWriter();
         BufferedWriter writer = new BufferedWriter( sw );
         JsonUtils.writeXodToJsonStream( vLLD, writer );
         StringBuffer sb = sw.getBuffer();
      // logger.debug( "LLD XOD: " + sb.toString() );
         StringBuffer oea = getSkeletalLodEntities( sb );
      // logger.debug( "LLD ER: " + oea.toString() );
         response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
         response.getWriter().write( new Gson().toJson( oea.toString() ) );
      } else {
         //nothing to show
         response.setStatus( HttpServletResponse.SC_NO_CONTENT );
      }
   }
}
