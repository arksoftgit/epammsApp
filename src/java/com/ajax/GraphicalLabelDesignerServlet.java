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
      String jsonColors = "[";
      EntityCursor ec = vLLD.cursor( "Color" );
      CursorResult cr = ec.setFirst();
      while ( cr.isSet() ) {
         jsonColors += " { \"Name\" : \"" + ec.getAttribute( "Name" ).getString() +
                      "\", \"RGB\" : \"" + ec.getAttribute( "RGB" ).getString() +
                      "\", \"Pantone\" : \"" + ec.getAttribute( "Pantone" ).getString() + "\" }";
         cr = ec.setNext();
         if ( cr.isSet() ) {
            jsonColors += ", ";
         }
      }
      jsonColors += " ]";
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
         jsonLabel = sb.substring( 0, pos ) + " } ] } ], \"Colors\" : " + jsonColors + " }";
         logger.debug( "Reduced Json Label from OI: " + jsonLabel );

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

   private void displaySPLD( View mSPLDef, String entity ) {
      logger.debug( "displaySPLD" );
      EntityCursor ec;
      if ( entity != null ) {
         ec = mSPLDef.getCursor( entity );
         if ( ec.isNull() == false ) {
            ec.logEntity( false );
         } else {
            logger.debug( "Null entity: " + entity );
         }
      }
      View t = mSPLDef.newView();
      t.resetSubobjectTop();
      ec = t.getCursor( "SPLD_LLD" );
      ec.logEntity( true );
      t.drop();
   }

   private EntityCursor moveEntityIfNecessary( View vLLD, String entity, String ID, EntityCursor ec ) {
   // int id = Integer.getInteger( ID );
      if ( entity.compareTo( "LLD_Block" ) == 0 || entity.compareTo( "LLD_SubBlock" ) == 0 ) {  // the only entities that can be moved to a new parent
         // Note that ec and hence ei and eip are related to vLLD.
         EntityInstance ei = ec.getEntityInstance();  // this is the entity that we are moving (600 in test)
         String wPID = ec.getAttribute( "wPID" ).getString();
         EntityInstance eip = null;
         try {
            eip = ei.getParent();
         } catch ( ZeidonException ze ) {
            logger.debug( "Error checking for move entity: " + entity + "  error: " + ze );
            return ec;
         }
         String IDP = eip.getAttribute( "wID" ).getString();  // get ID of original parent
         /*
         if ( ID.compareTo( "600" ) == 0 || ID.compareTo( "812" ) == 0 || ID.compareTo( "813" ) == 0 ) {
            logger.debug( ID + "C"  + "  Checking move from parent ID: " + IDP + "  to parent ID: " + wPID );
            eip.logEntity( false );
            displaySPLD( vLLD, entity );
         }
         */
         if ( wPID == null || IDP == null  ) {
            logger.debug( "For ID: " + ID + "  Unexpected null wPID: " + wPID == null ? "Null" : wPID + "  wID: " + IDP == null ? "Null" : IDP );
         } else if ( wPID.compareTo( IDP ) != 0 ) { // if there is a new parent ...
         // logger.debug( "Before moving entity: " + entity + "  with ID: " + ID + "  from parent ID: " + IDP + "  to parent ID: " + wPID );
         // displaySPLD( vLLD, entity );
            String wPE = ec.getAttribute( "wPE" ).getString();
            ei.getAttribute( "wPE" ).setValue( wPE );
            ei.getAttribute( "wPID" ).setValue( wPID );
            if ( wPE.compareTo( "panel" ) == 0 ) {
               wPE = "LLD_Panel";
            } else if ( wPE.compareTo( "block" ) == 0 ) {
               wPE = "LLD_Block";
            } else {
               logger.debug( "Cannot move entity: " + entity + "  to parent: " + wPE );
               return ec;
            }

            View v = vLLD.newView();
            EntityCursor ecp = v.getCursor( wPE );  // this is the new parent entity
            CursorResult cr = ecp.setFirstWithinOi( "wID", wPID );
            if ( cr.isSet() ) {
               try {
                  if ( wPE.compareTo( "LLD_Block" ) == 0 ) {
                     ecp = v.getCursor( "LLD_SubBlock" );
                     ecp.setToSubobject();
                  }
                  ecp = v.getCursor( "LLD_Block" );
                  ecp.moveSubobject( CursorPosition.FIRST, ec, CursorPosition.NONE );
               // logger.debug( "After Moving To SubBlock Target entity: " + entity + "  with ID: " + ID + "  from parent ID: " + IDP + "  to parent ID: " + wPID );
               // displaySPLD( v, wPE );
               } catch ( ZeidonException ze ) {
                  logger.debug( "Error trying to move entity: " + entity + "  error: " + ze );
               }
            }
            v.drop();
         }
      }
      return ec;
   }
   private void processJsonArray( View vLLD, JSONArray jsonArray, String entity, int depth ) {
      Iterator it = jsonArray.iterator();
      while ( it.hasNext() ) {
         Object obj = it.next();
      // logger.debug( "Array type: " + obj.getClass().getName() );
         if ( obj instanceof JSONObject ) {
            JSONObject jo = (JSONObject)obj;
            if ( depth >= -1 ) {
               EntityCursor ec = vLLD.getCursor( entity );
            // if ( ec.isNull() == false ) {  // the ec.isNull may be true ==> no entities, but we may want to create one!
                  String ID = (String) jo.get( "ID" );
                  /*
                  if ( ID != null && ID.isEmpty() == false ) {
                     logger.debug( "Processing Entity: " + entity + "  ID: " + ID );
                     if ( ID.compareTo( "600" ) == 0 || ID.compareTo( "812" ) == 0 || ID.compareTo( "813" ) == 0 ) {
                        logger.debug( ID + "A" );
                     }
                  } else {
                     logger.debug( "Processing Entity: " + entity + "  wID: " + (String) jo.get( "wID" ) );
                  }
                  */
                  try {
                     if ( entity.compareTo( "LLD_Page" ) == 0 ) {
                        Object op = jo.get( "LLD_Panel" ); // if there are no panels we will delete the page
                        if ( op == null ) {
                           if ( ID != null && ID.isEmpty() == false ) {
                              CursorResult cr = ec.setFirst( "ID", ID );
                              if ( cr.isSet() ) {
                                 ec.getEntityInstance();
                                 logger.debug( "Deleting entity: " + entity );
                              // ec.logEntity( true );
                                 ec.deleteEntity();
                              }
                           }
                           continue; // while ( it.hasNext ...
                        }
                     }

                     CursorResult cr;
                     String _DeleteEntity = (String)jo.get( "_Delete" );
                     boolean deleteEntity = (_DeleteEntity != null && _DeleteEntity.charAt( 0 ) == 'Y') ? true : false;
                     if ( ID == null || ID.isEmpty() ) {  // if we are in a create situation, take care of that right now
                        String wID = (String) jo.get( "wID" );
                        if ( deleteEntity ) {
                           cr = ec.setFirstWithinOi( "wID", wID );
                           if ( cr.isSet() ) {
                              ec.deleteEntity();
                              logger.debug( "Entity DELETED: " + entity + "  ID: " + ID + "  Depth: " + depth );
                           }
                        } else {
                           String _EOI = (String)jo.get( "_EOI" );
                           if ( _EOI != null && _EOI.charAt( 0 ) == 'Y' ) { // exists on OI
                              cr = ec.setFirstWithinOi( "wID", wID );
                              if ( cr.isSet() ) {
                                 EntityInstance ei = ec.getEntityInstance();
                                 applyJsonPropertiesToZeidonAttributes( vLLD, (JSONObject)obj, entity, depth + 1, ei );
                                 ec = moveEntityIfNecessary( vLLD, entity, ID, ec );
                              }
                           } else {
                              String wPE = (String) jo.get( "wPE" );
                              if ( wPE.compareTo( "page" ) == 0 ) {
                                 wPE = "LLD_Page";
                              } else if ( wPE.compareTo( "panel" ) == 0 ) {
                                 wPE = "LLD_Panel";
                              } else if ( wPE.compareTo( "block" ) == 0 ) {
                                 wPE = "LLD_Block";
                              } else {
                                 logger.debug( "Cannot create entity: " + entity + "  for parent: " + wPE );
                                 return;
                              }
                              String wPID = (String) jo.get( "wPID" );
                              ec = vLLD.getCursor( wPE );  // this is the parent entity
                              cr = ec.setFirstWithinOi( "wID", wPID );
                              if ( cr.isSet() ) {
                                 ec = vLLD.getCursor( entity );
                                 ec.createEntity( CursorPosition.LAST );
                                 applyJsonPropertiesToZeidonAttributes( vLLD, (JSONObject)obj, entity, depth + 1, ec.getEntityInstance() );
                              }
                           }
                        }
                     } else {
                        // Get position on the corresponding entity in the OI.
                        cr = ec.setFirst( "ID", ID );
                        if ( cr.isSet() == false ) {
                           if ( entity.equals( "LLD_SubBlock" ) ) {
                              entity = "LLD_Block";
                              ec = vLLD.getCursor( entity );
                           }
                           cr = ec.setFirstWithinOi( "ID", ID );
                           if ( cr.isSet() == false ) {
                              // Locate using wID because if it exists ... ID only exists if the entity came from the database.
                              String wID = (String) jo.get( "wID" );
                              if ( wID != null && wID.isEmpty() == false ) {
                                 cr = ec.setFirstWithinOi( "wID", wID );
                              }
                           }
                        }
                        // If we found it, things are hunky-dory.
                        if ( cr.isSet() ) {
                           EntityInstance ei = ec.getEntityInstance();
                           //
                           if ( ID.compareTo( "600" ) == 0 || ID.compareTo( "812" ) == 0 || ID.compareTo( "813" ) == 0 ) {
                              EntityInstance eip = ei.getParent();
                              String IDP = eip.getAttribute( "ID" ).getString();
                           // logger.debug( ID + "B Parent ID: " + IDP );
                           }
                           //
                           if ( deleteEntity ) {
                           // vLLD.logObjectInstance();
                           //ec.logEntity( true );
                              ec.deleteEntity();
                              logger.debug( "Entity DELETED: " + entity + "  ID: " + ID + "  Depth: " + depth );
                              continue; // while ( it.hasNext ...
                           } else {
                              applyJsonPropertiesToZeidonAttributes( vLLD, (JSONObject)obj, entity, depth + 1, ei );
                              ec = moveEntityIfNecessary( vLLD, entity, ID, ec );
                           }
                        } else if ( cr == CursorResult.UNCHANGED ) {
                           logger.debug( "Entity NOT FOUND (UNCHANGED): " + entity + "  ID: " + ID + "  Depth: " + depth );
                           ec.createEntity( CursorPosition.NEXT );
                           ec.getAttribute( "Tag" ).setValue( "BustedUnchanged" + ID );
                           displaySPLD( vLLD, entity );
                           throw new ZeidonException( "Entity NOT Found: " + ID + "  Look for Busted" ); 
                        } else {
                           logger.debug( "Entity NOT FOUND: " + entity + "  ID: " + ID + "  Depth: " + depth );
                           ec.createEntity( CursorPosition.NEXT );
                           ec.getAttribute( "Tag" ).setValue( "Busted" + ID );
                           displaySPLD( vLLD, entity );
                           throw new ZeidonException( "Entity NOT Found: " + ID + "  Look for Busted" ); 
                        }
                     }
                     if ( deleteEntity == false ) {
                     // if ( ei != null ) {
                     //    logger.debug( "Entity Instance Before: " + entity + "  ID: " + ID + "  Depth: " + depth );
                     //    ei.logEntity( false );
                     // }
                        applyJsonLabelToView( vLLD, (JSONObject)obj, entity, depth + 1, ec.getEntityInstance() );
                     // if ( ei != null ) {
                     //    logger.debug( "Entity Instance After: " + entity + "  ID: " + ID + "  Depth: " + depth );
                     //    ei.logEntity( false );
                     // }
                     }
                  } catch ( ZeidonException ze ) {
                    logger.debug( "Failed to process entity: " + entity + "  Depth: " + depth + "   ID: " + ID + "   Error: " + ze.getMessage() );
                  } finally {
                     vLLD.resetSubobjectTop();
                  }
            // } not checking ec.isNull()
            } else {
            // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + entity + "  Depth: " + depth ); 
               applyJsonLabelToView( vLLD, (JSONObject)obj, entity, depth + 1, null );
            }
         } else {
            logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + entity + " Unknown type: " + obj.getClass().getName() );
         }
      }
   }

   private void applyJsonPropertiesToZeidonAttributes( View vLLD, JSONObject jsonObject, String entity, int depth, EntityInstance ei ) {
      if ( ei != null ) {
      // logger.debug( "Apply Json Start" );
      // ei.logEntity( false );
         String entityDefName = ei.getEntityDef().getName();
         if ( entity.equals( entityDefName ) ||
              (entity.equals( "LLD_Block" ) && entityDefName.contains( "LLD_SubBlock" )) ||
              (entity.equals( "LLD_SubBlock" ) && entityDefName.contains( "LLD_Block" )) ) {
         // Set<String> keys = (Set<String>) jsonObject.keySet(); // these two lines work, but cause
         // for ( String key : keys ) {                           // a warning ... replaced by next two lines
            for ( Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext(); ) {
               String key = (String) iterator.next();
            // logger.debug( "OTag: " + entity + "   Key: " + key + "   Depth: " + depth );
               Object obj = jsonObject.get( key );
               if ( obj instanceof String ) {
                  String valueNew = (String) obj;
               // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "E.Attr: " + entity + "." + key + " : " + valueNew );
                  if ( key.compareTo( "ID" ) != 0 && key.charAt( 0 ) != '_' ) {  // attribute is not ID (which is immutable)
                     String valueOld = ei.getAttribute( key ).getString();
                     if ( valueOld.equals( valueNew ) == false ) { // if the value has changed ...
                     // logger.debug( "Changing entity.attribute: " + entity + "." + key + ": " + valueOld + "  to: " + valueNew );
                     // ei.logEntity( false );
                        try {
                        // logger.debug( "AfterChange entity.attribute: " + entity + "." + key + ": " + valueOld + "  to: " + valueNew );
                           ei.getAttribute( key ).setValue( valueNew );
                        // ei.logEntity( false );
                        } catch ( ZeidonException ze ) {
                           if ( key.startsWith( "FK_ID_" ) || key.startsWith( "FKID" ) || key.startsWith( "AUTOSEQ" ) ) {
                              String v = ei.getAttribute( key ).getString();
                              if ( v.compareTo( valueNew ) != 0 ) {
                                 logger.debug( "System entity.attribute changed: " + entity + "." + key + "  value: " + valueNew + " ==> " + v );
                              }
                           } else {
                              logger.debug( "Failed to set entity.attribute: " + entity + "." + key + "  value: " + valueNew );
                           }
                        }
                     }
                  }
               }
            }
         } else {
            String msg = "ei (" + ei.getEntityDef().getName() + ") does not match entity: " + entity;
            logger.debug( msg ); 
            throw new ZeidonException( msg ); 
         }
      // logger.debug( "Apply Json End" );
      // ei.logEntity( false );
      }
   }

   private void applyJsonLabelToView( View vLLD, JSONObject jsonObject, String entity, int depth, EntityInstance ei ) {
/* start debug code
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
end debug code */
   // Set<String> keys = (Set<String>) jsonObject.keySet(); // these two lines work, but cause
   // for ( String key : keys ) {                           // a warning ... replaced by next two lines
      for ( Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext(); ) {
         String key = (String) iterator.next();
      // logger.debug( "OTag: " + entity + "   Key: " + key + "   Depth: " + depth );
         Object obj = jsonObject.get( key );
         if ( obj instanceof String ) {
            // we've already done this
         } else if ( obj instanceof JSONArray ) {
            JSONArray ja = (JSONArray)obj;
            // depth is 0 for a page, 1 for a panel, 2 for a block, 3 for a subblock, ...
            if ( key.compareTo( "OIs" ) == 0 ) {
               depth = -2;
            } else if ( key.compareTo( "SPLD_LLD" ) == 0 ) {
               depth = -1;
            }
         // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + key + " Depth: " + (depth + 1) );
            processJsonArray( vLLD, ja, key, depth );
         } else if ( obj instanceof JSONObject ) {
         // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "MetaOI: " + key + " Skipped!" );
         // applyJsonLabelToView( vLLD, (JSONObject)obj, key, depth + 1, null );
         } else {
            logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Key: " + key + "  Unknown type: " + obj.getClass().getName() );
         }
      }
/* start debug code
      if ( log ) {
         logger.debug( "After Setting entity: " + entity + "  ID: " + "626" );
         ei.logEntity( false );
      }
 end debug code*/
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

/* setPathCursorPosition is currently not used (deprecated ... setPositionByKey is being used instead)
   private EntityCursor setPathCursorPosition( View vLLD, String entityTagList, int idx1, int depth ) {
      EntityCursor ec = null;
      int idx2 = entityTagList.indexOf( ".", idx1 );
      if ( idx2 >= 0 ) {
         String entity = entityTagList.substring( idx1, idx2 );
         idx1 = idx2 + 1;
         idx2 = entityTagList.indexOf( ";", idx1 );
         if ( idx2 >= 0 ) {
            String tag = entityTagList.substring( idx1, idx2 );
            if ( entity.compareTo( "LLD_Block" ) == 0 ) {
               if ( depth > 2 ) {
                  ec = vLLD.getCursor( "LLD_SubBlock" );
                  ec.setToSubobject();
               } else {
                  if ( depth < 2 ) {
                     depth = 2;  // we for sure need to setToSubobject next level down from here on
                  }
               }
            }
            ec = vLLD.getCursor( entity );

            CursorResult cr = ec.setFirst( "Tag", tag );
            if ( cr.isSet() ) {
               logger.debug( "View path set to Entity.Tag ================>>> " + entity + "." + tag );
            // ec.logEntity( false );
               if ( idx2 < entityTagList.length() - 1 ) {
                  idx2++;
                  ec = setPathCursorPosition( vLLD, entityTagList, idx2, depth + 1 );
               }
            } else {
               logger.debug( "Could not set cursor for Entity.Tag: " + entity + "." + tag );
               throw new ZeidonException( "Could not set cursor for Entity.Tag: " + entity + "." + tag ); 
            }
         }
      }
      return ec;
   }
*/

   private EntityCursor setPositionByKey( View mSPLDefBlock, String elementKey ) {
      // mSPLDefBlock comes in set to the top.
      // entity.tag;id;wid;wpe ==> LLD_Block.Tag622;622;622;block
      EntityCursor ec = null;
      int idx1 = elementKey.indexOf( "." );
      if ( idx1 >= 0 ) {
         String entity = elementKey.substring( 0, idx1 );
         idx1++;
         int idx2 = elementKey.indexOf( ";", idx1 );
         if ( idx2 >= 0 ) {
            String tag = elementKey.substring( idx1, idx2 );
            idx1 = idx2 + 1;
            idx2 = elementKey.indexOf( ";", idx1 );
            if ( idx2 >= 0 ) {
               String id = elementKey.substring( idx1, idx2 );
               idx1 = idx2 + 1;
               idx2 = elementKey.indexOf( ";", idx1 );
               if ( idx2 >= 0 ) {
                  String wid = elementKey.substring( idx1, idx2 );
                  idx1 = idx2 + 1;
                  String wpe = elementKey.substring( idx1 );
                  if ( entity.compareTo( "LLD_Panel" ) == 0 ) {
                     ec = mSPLDefBlock.getCursor( "LLD_Panel" );
                  } else {
                     ec = mSPLDefBlock.getCursor( "LLD_Block" );
                  }
                  CursorResult cr;
                  if ( id != null && id.isEmpty() == false && id.compareTo( wid ) == 0 ) {
                     cr = ec.setFirstWithinOi( "ID", id );
                     tag = id;
                  } else {
                     cr = ec.setFirstWithinOi( "Tag", tag );
                  }
                  if ( cr.isSet() ) {
                     logger.debug( "PositionByKey set to Entity.Tag ================>>> " + entity + "." + tag );
                  // ec.logEntity( false );
                  } else {
                     logger.debug( "Could not set cursor for Entity.Tag: " + entity + "." + tag );
                     throw new ZeidonException( "Could not set cursor for Entity.Tag: " + entity + "." + tag ); 
                  }
               }
            }
         }
      }

      return ec;
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
      logger.debug( "=========================================>>>>>>>>>>>>>>>>>>>>>>>>>>> Graphical Designer Servlet Task Id: " + taskId );
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
                  mSPLDefBlock.setName( "mSPLDefBlock", Level.TASK );
               }
               mSPLDefBlock.resetSubobjectTop();
               View mSPLDefPanel = epamms.getViewByName( "mSPLDefPanel" );;
               if ( mSPLDefPanel == null ) {
                  mSPLDefPanel = mSPLDefBlock.newView( );
                  mSPLDefPanel.setName( "mSPLDefPanel", Level.TASK );
               } else {
                  mSPLDefPanel.resetSubobjectTop();
               }
               try {
                  String viewPath = request.getParameter( "viewPath" );
                  logger.debug( "Setting view path: " + viewPath );
                  String elementKey = request.getParameter( "elementKey" );
                  logger.debug( "Setting cursor for element key: " + elementKey );
               // EntityCursor ec = setPathCursorPosition( mSPLDefBlock, viewPath, 0, 0 );
                  EntityCursor ec = setPositionByKey( mSPLDefBlock, elementKey );
                  logger.debug( "Finished setting view path: " + viewPath );
                  ec.logEntity( false );
               } catch (ZeidonException ze) {
                  // Could not locate target block
                  logger.debug( "Error locating the target block: " + ze.getMessage() );
                  jsonLabel = "{ \"Error\" : \"" + ze.getMessage() + "\" }";
                  response.setStatus( HttpServletResponse.SC_ACCEPTED );
                  response.setContentType( "text/json" );
                  response.getWriter().write( new Gson().toJson( jsonLabel ) );
               }
            } catch (ZeidonException ze) {
               // I think this means we are at the top
               logger.debug( "setCursorPosition: " + ze.getMessage() );
            }
            response.setContentType( "text/json" );
            response.getWriter().write( new Gson().toJson( "{}" ) );
         }
      } else if ( action.compareTo( "saveLabel" ) == 0 || action.compareTo( "saveLabelCommit" ) == 0 ) {
         if ( vLLD != null ) {
         // jsonLabel = getPostData( request );
            JSONObject jsonPost = getPostData( request );
            String strJson = jsonPost.toJSONString();
         // logger.debug( "Save JSON: " + strJson );
         // jsonLabel = request.getParameter( "jsonLabel" );
            try {
               View v = vLLD.newView();
               v.resetSubobjectTop();
            // logger.debug( "Before Apply Json to OI" );
            // displaySPLD( vLLD, null );
               applyJsonLabelToView( v, jsonPost, "", -2, null );  // OIs, SPLD_LLD, depth == 0 for LLD_Page
               v.drop();
            // logger.debug( "Saved JSON to OI" );
            // displaySPLD( vLLD, null );
               vLLD.setName( "mSPLDefPanel", Level.TASK );
               vLLD.resetSubobjectTop();
               if ( action.compareTo( "saveLabelCommit" ) == 0 ) {
                  vLLD.commit();
               }
            } catch( ZeidonException ze ) {
               logger.debug( "Error processing Json Label: " + ze.getMessage() );
            } finally {
               convertLLD_ToJSON( vLLD );
            // logger.debug( "Completed processing Json Label: " + jsonLabel );
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
         // } catch( ZeidonException ze ) { already caught
         //    logger.debug( "Error processing Json Label: " + ze.getMessage() );
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
         // displaySPLD( vLLD, null );
            jsonLabel = convertLLD_ToJSON( vLLD );
         // logger.debug( "LoadLabel JSON: " + jsonLabel );
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
