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
import com.quinsoft.epamms.ZGlobal1_Operation;
import com.quinsoft.zeidon.utils.QualificationBuilder;
import com.quinsoft.zeidon.SetMatchingFlags;

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
import java.util.ArrayList;
import java.util.List;
import static java.lang.Math.*;
import java.util.StringTokenizer;
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
         if ( ZKey.equals( (String) json.get( "ZKey" ) ) ) {
             return json;
         }
      }
      return null;
   }

   private int insertTag( ArrayList <String>tagList, String tag ) {
      String newTag = tag;
      int lower = 0;
      int upper = tagList.size();
      int k = 0;
      int mid;
      int rc;
   // logger.debug( "Beginning insert Tag: " + tag );
      while ( lower <= upper ) {
      // logger.debug( "insert Tag: " + newTag + "  lower: " + lower + "  upper: " + upper );
         mid = (lower + upper) / 2;
         if ( mid < 0 || mid >= tagList.size() ) {
            break;
         }
         rc = newTag.compareTo( tagList.get( mid ) );
         if ( rc > 0 ) {
            lower = mid + 1;
         } else if ( rc < 0 ) {
            upper = mid - 1;
         } else {
            // found a dup ... add an integer suffix until it is no longer a dup
            logger.error( "Duplicate block tags: " + tag );
            k++;
            newTag = tag + k;
            lower = 0;
            upper = tagList.size();
         }
      }
      mid = min( max( 0, lower ), tagList.size() );
      tagList.add( mid, newTag );
   // logger.debug( "Insert Added Tag: " + tag + "   at position: " + mid );
      return mid;
   }

   private int getBlockTagList( View mSPLDef, ArrayList <String>tagList ) {
      try {
         CursorResult cr = mSPLDef.cursor( "LLD_Block" ).setFirst();
         while ( cr.isSet() ) {
            String tag = mSPLDef.cursor( "LLD_Block" ).getAttribute( "Tag" ).getString();
            int pos = insertTag( tagList, tag );
            if ( tag.equals( tagList.get( pos ) ) == false ) {
               mSPLDef.cursor( "LLD_Block" ).getAttribute( "Tag" ).setValue( tagList.get( pos ) );
            }
            if ( mSPLDef.cursor( "LLD_SubBlock" ).hasAny() ) {
               mSPLDef.cursor( "LLD_SubBlock" ).setToSubobject();
               int rc = getBlockTagList( mSPLDef, tagList );
               mSPLDef.cursor( "LLD_Block" ).resetSubobjectToParent();
               if ( rc < 0 ) {
                  return rc;
               }
            }
            cr = mSPLDef.cursor( "LLD_Block" ).setNext();
         }
      } catch( ZeidonException ze ) {
         logger.error( "Error checking unique block tags: " + ze.getMessage() );
         return -1;
      }
      return 0;
   }

   private int sortBlocks( View mSPLDef ) {
      int cnt = 0;
      try {
         CursorResult cr = mSPLDef.cursor( "LLD_Block" ).setFirst();
         while ( cr.isSet() ) {
            cnt++;
            if ( mSPLDef.cursor( "LLD_SubBlock" ).hasAny() ) {
               mSPLDef.cursor( "LLD_SubBlock" ).setToSubobject();
               int rc = sortBlocks( mSPLDef );
               mSPLDef.cursor( "LLD_Block" ).resetSubobjectToParent();
               if ( rc < 0 ) {
                  return rc;
               }
            }
            cr = mSPLDef.cursor( "LLD_Block" ).setNext();
         }

         if ( cnt > 1 ) { // we had more than one block ... so sort 'em
            mSPLDef.cursor( "LLD_Block" ).orderEntities( "Left A Top A Width A Height A" );
         }
      } catch( ZeidonException ze ) {
         logger.error( "Error sorting blocks: " + ze.getMessage() );
         return -1;
      }
      return 0;
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
                  if ( s1.equals( "ATTRIB" ) ) {
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
                  } else if ( s1.equals( ".meta" ) || s1.equals( ".oimeta" ) ) { // skip these guys
                     while ( xod.charAt( k ) != '}' )
                        k++;
                     while ( xod.charAt( k ) != ',' )
                        k++;
                     k++;
                  } else {
                     if ( s1.equals( "OBJECT" ) ) {
                        s1 = "Object";
                     } else if ( s1.equals( "ENTITY" ) ) {
                        s1 = "Root";
                     } else if ( s1.equals( "CHILDENTITY" ) ) {
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
               if ( s1.equals( "NAME" ) ||
                    s1.equals( "RECURSIVE" ) ||
                    s1.equals( "DERIVED" ) ||
                    s1.equals( "version" ) ) {
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
               if ( s1.equals( "ZKey" ) ||
                    s1.equals( "KEY" ) ||
                    s1.equals( "OPER_LIBNM" ) ||
                    s1.equals( "ER_DATE" ) ||
                    s1.equals( "MAX_LTH" ) ||
                    s1.equals( "ERENT_TOK" ) ||
                    s1.equals( "PERSIST" ) ||
                    s1.equals( "FULLPERSIST" ) ||
                    s1.equals( "CREATE" ) ||
                    s1.equals( "DELETE" ) ||
                    s1.equals( "PDELETE" ) ||
                    s1.equals( "UPDATE" ) ||
                    s1.equals( "INCLSRC" ) ||
                    s1.equals( "INCLUDE" ) ||
                    s1.equals( "EXCLUDE" ) ||
                    s1.equals( "ERATT_TOK" ) ||
                    s1.equals( "APDM_TOK" ) ||
                    s1.equals( "DOMAIN" ) ||
                    s1.equals( "TYPE" ) ||
                    s1.equals( "LTH" ) ||
                    s1.equals( "REQUIRED" ) ||
                    s1.equals( "XVAATT_TOK" ) ||
                    s1.equals( "SEQ_AD" ) ||
                    s1.equals( "ERREL_TOK" ) ||
                    s1.equals( "ERREL_LINK" ) ||
                    s1.equals( "CARDMIN" ) ||
                    s1.equals( "CARDMAX" ) ||
                    s1.equals( "DECIMAL" ) ||
                    s1.equals( "DUPENTIN" ) ||
                    s1.equals( "HANG_FK" ) ) {
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
      int k;
      String s;
      String attr;
      EntityCursor ec = vLLD.cursor( "SPLD_HumanHazardSection" );
      String jsonSelectedHazard = "{ \"Panel\" : \"" + ec.getAttribute( "PanelLoc" ).getString() +
                                                      "\", \"Label\" : \"" + ec.getAttribute( "LabelLoc" ).getString() + "\" }";
      String jsonHazard = " [";
      for ( k = 1; k <= 5; k++ ) {
         attr = "PanelLoc" + k;
         s = ec.getAttribute( attr ).getString();
         if ( s != null && s.isEmpty() == false ) {
            jsonHazard += " { \"Panel\" : \"" + s + "\" }, ";
         }
         attr = "LabelLoc" + k;
         s = ec.getAttribute( attr ).getString();
         if ( s != null && s.isEmpty() == false ) {
            jsonHazard += " { \"Label\" : \"" + s + "\" }, ";
         }
      }
      if ( jsonHazard.endsWith( ", ") ) {
         jsonHazard = jsonHazard.substring( 0, jsonHazard.length() - 2 );
      }
      jsonHazard += " ]";

      String jsonReuse = "[";
      ec = vLLD.cursor( "ReusableBlockDefinition" );
      ec.orderEntities( "LLD_SectionType A Name A" );
      CursorResult cr = ec.setFirst();
      while ( cr.isSet() ) {
         jsonReuse += " { \"LLD_SectionType\" : \"" + ec.getAttribute( "LLD_SectionType" ).getString() +
                      "\", \"Name\" : \"" + ec.getAttribute( "Name" ).getString() +
                      "\", \"Description\" : \"" + ec.getAttribute( "Description" ).getString() + "\" }";
         cr = ec.setNext();
         if ( cr.isSet() ) {
            jsonReuse += ", ";
         }
      }
      jsonReuse += " ]";

      String jsonColors = "[";
      ec = vLLD.cursor( "Color" );
      cr = ec.setFirst();
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

      String jsonMarketing = "[";
      ec = vLLD.cursor( "SPLD_MarketingSection" );
      cr = ec.setFirst();
      while ( cr.isSet() ) {
         jsonMarketing += " { \"Name\" : \"" + ec.getAttribute( "Name" ).getString() + "\" }";
         cr = ec.setNext();
         if ( cr.isSet() ) {
            jsonMarketing += ", ";
         }
      }
      jsonMarketing += " ]";

      ArrayList<String> tagList = new ArrayList<>();
      // Get the tags from the panels.
      cr = vLLD.cursor( "LLD_Panel" ).setFirst();
      while ( cr.isSet() ) {
         String tag = vLLD.cursor( "LLD_Panel" ).getAttribute( "Tag" ).getString();
         int pos = insertTag( tagList, tag );
         String newTag = tagList.get( pos );
      // logger.debug( "Return from insertTag: " + newTag );
         if ( tag.equals( newTag ) == false ) {
            vLLD.cursor( "LLD_Panel" ).getAttribute( "Tag" ).setValue( newTag );
         }
         int rc = getBlockTagList( vLLD, tagList );
         if ( rc < 0 ) {
            break;
         }
         cr = vLLD.cursor( "LLD_Panel" ).setNext();
      }
      String jsonTagList = "[ ";
      int lth = tagList.size();
      for ( k = 0; k < lth; k++ ) {
         jsonTagList += "\"" + tagList.get(k) + "\"";
         if ( k < lth - 1 ) {
            jsonTagList += ", ";
         }
      }
      jsonTagList += " ]";

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
         jsonLabel = sb.substring( 0, pos ) + " } ] } ], \"BlockTags\" : " + jsonTagList +
                                                      ", \"ReusableBlocks\" : " + jsonReuse +
                                                      ", \"Colors\" : " + jsonColors +
                                                      ", \"Marketing\" : " + jsonMarketing +
                                                      ", \"HazardSelectedLocations\" : " + jsonSelectedHazard +
                                                      ", \"HazardLocations\" : " + jsonHazard +
                                              " }";
      // logger.debug( "Reduced Json Label from OI: " + jsonLabel );
      } catch( ZeidonException ze ) {
         logger.error( "Error loading Json Label: " + ze.getMessage() );
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

   private void displaySPLD( View mSPLDef, String entity, String id ) {
   // logger.debug( "displaySPLD" );
      EntityCursor ec;
      if ( entity != null ) {
         boolean display = false;
         ec = mSPLDef.getCursor( entity );
         if ( id != "" ) {
            CursorResult cr = ec.setFirst( "ID", id );
            if ( cr.isSet() ) {
               display = true;
            }
         }
         if ( ec.isNull() == false ) {
            ec.logEntity( display );
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
      if ( entity.equals( "LLD_Block" ) ) {  // the only entity that can be moved to a new parent
         // Note that ec and hence ei and eip are related to vLLD.
         EntityInstance ei = ec.getEntityInstance();  // this is the entity that we are moving (600 in test)
         String wPID = ec.getAttribute( "wPID" ).getString();
         EntityInstance eip = null;
         try {
            eip = ei.getParent();
         } catch ( ZeidonException ze ) {
            logger.error( "Error checking for move entity: " + entity + "  error: " + ze );
            return ec;
         }
         String IDP = eip.getAttribute( "wID" ).getString();  // get ID of original parent
         /*
         if ( ID.equals( "600" ) || ID.equals( "812" ) || ID.equals( "813" ) ) {
            logger.debug( ID + "C"  + "  Checking move from parent ID: " + IDP + "  to parent ID: " + wPID );
            eip.logEntity( false );
            displaySPLD( vLLD, entity, ID );
         }
         */
         if ( wPID == null || IDP == null  ) {
            logger.error( "For ID: " + ID + "  Unexpected null wPID: " + wPID == null ? "Null" : wPID + "  wID: " + IDP == null ? "Null" : IDP );
         } else if ( wPID.equals( IDP ) == false ) { // if there is a new parent ...
         // logger.debug( "Before moving entity: " + entity + "  with ID: " + ID + "  from parent ID: " + IDP + "  to parent ID: " + wPID );
         // displaySPLD( vLLD, entity, "" );
            String wPE = ec.getAttribute( "wPE" ).getString();
            ei.getAttribute( "wPE" ).setValue( wPE );
            ei.getAttribute( "wPID" ).setValue( wPID );
            if ( wPE.equals( "panel" ) ) {
               wPE = "LLD_Panel";
            } else if ( wPE.equals( "block" ) ) {
               wPE = "LLD_Block";
            } else {
               logger.error( "Cannot move entity: " + entity + "  to parent: " + wPE );
               return ec;
            }

            View v = vLLD.newView();
            EntityCursor ecp = v.getCursor( wPE );  // this is the new parent entity
            CursorResult cr = ecp.setFirstWithinOi( "wID", wPID );
            if ( cr.isSet() ) {
               try {
                  if ( wPE.equals( "LLD_Block" ) ) {
                     ecp = v.getCursor( "LLD_SubBlock" );
                     ecp.setToSubobject();
                  }
                  ecp = v.getCursor( "LLD_Block" );
                  ecp.moveSubobject( CursorPosition.FIRST, ec, CursorPosition.NONE );
               // logger.debug( "After Moving To SubBlock Target entity: " + entity + "  with ID: " + ID + "  from parent ID: " + IDP + "  to parent ID: " + wPID );
               // displaySPLD( v, wPE, "" );
               } catch ( ZeidonException ze ) {
                  logger.error( "Error trying to move entity: " + entity + "  error: " + ze );
               }
            }
            v.drop();
         }
      }
      return ec;
   }
   private void processJsonArray( View vLLD, View vBlock, JSONArray jsonArray, String entity, int depth ) {
      Iterator it = jsonArray.iterator();
      while ( it.hasNext() ) {
         Object obj = it.next();
      // logger.debug( "Array type: " + obj.getClass().getName() );
         if ( obj instanceof JSONObject ) {
            JSONObject jo = (JSONObject)obj;
            if ( depth >= -1 ) {
               EntityCursor ec = vBlock.getCursor( entity );
            // if ( ec.isNull() == false ) {  // the ec.isNull may be true ==> no entities, but we may want to create one!
               String ID = (String) jo.get( "ID" );
               CursorResult cr;
               /*
               if ( ID != null && ID.isEmpty() == false ) {
                  logger.debug( "Processing Entity: " + entity + "  ID: " + ID );
                  cr = ec.setFirstWithinOi( "ID", ID );
                  if ( cr.isSet() ) {
                     if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                        ec.setToSubobject();
                     }
                     if ( ID.equals( "893" ) || ID.equals( "892" ) || ID.equals( "890" ) ||
                          ID.equals( "901" ) || ID.equals( "900" ) || ID.equals( "899" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "878" ) || ID.equals( "882" ) || ID.equals( "877" ) ) {
                        logger.debug( ID + " at entity: " + entity );
                        ec.logEntity( false );
                     }
                  }
               } else {
                  logger.debug( "Processing Entity: " + entity + "  wID: " + (String) jo.get( "wID" ) );
               }
               */
               try {
                  if ( entity.equals( "LLD_Page" ) ) {
                     Object op = jo.get( "LLD_Panel" ); // if there are no panels we will delete the page
                     if ( op == null ) {
                        if ( ID != null && ID.isEmpty() == false ) {
                           cr = ec.setFirst( "ID", ID );
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

                  String _DeleteEntity = (String)jo.get( "_Delete" );
                  boolean deleteEntity = (_DeleteEntity != null && _DeleteEntity.charAt( 0 ) == 'Y') ? true : false;
                  if ( ID == null || ID.isEmpty() ) {  // if we are in a create situation, take care of that right now
                     String wID = (String) jo.get( "wID" );
                     if ( deleteEntity ) {
                        cr = ec.setFirstWithinOi( "wID", wID );
                        if ( cr.isSet() ) {
                           if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                              ec.setToSubobject();
                           }
                           ec.deleteEntity();
                           logger.debug( "Entity DELETED: " + entity + "  ID: " + ID + "  Depth: " + depth );
                        }
                     } else {
                        String _EOI = (String)jo.get( "_EOI" );
                        if ( _EOI != null && _EOI.charAt( 0 ) == 'Y' ) { // exists on OI
                           cr = ec.setFirstWithinOi( "wID", wID );
                           if ( cr.isSet() ) {
                              if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                                 ec.setToSubobject();
                              }
                              EntityInstance ei = ec.getEntityInstance();
                              applyJsonPropertiesToZeidonAttributes( vLLD, vBlock, (JSONObject)obj, entity, depth, ei );
                              ec = moveEntityIfNecessary( vBlock, entity, ID, ec );
                           }
                        } else {
                           String setPE = null;
                           String wPE = (String) jo.get( "wPE" );
                           if ( wPE == null ) {
                              if ( entity.equals( "SPLD_LLD" ) ) {
                                 wPE = "SubregPhysicalLabelDef";
                                 setPE = "pagemenu";
                              } else if ( entity.equals( "LLD_Page" ) ) {
                                 wPE = "SPLD_LLD";
                                 setPE = "label";
                              } else if ( entity.equals( "LLD_Panel" ) ) {
                                 wPE = "LLD_Page";
                                 setPE = "page";
                              } else if ( entity.equals( "LLD_Block" ) ) {
                                 wPE = "LLD_Panel";
                                 setPE = "panel";
                              } else if ( entity.equals( "LLD_SubBlock" ) ) {
                                 entity = "LLD_Block";
                                 wPE = "LLD_Block";
                                 setPE = "block";
                              } else {
                                 logger.error( "Cannot create unknown entity: " + entity + "  for null parent: " );
                                 return;
                              }
                           } else if ( wPE.equals( "label" ) ) {
                              wPE = "SPLD_LLD";
                           } else if ( wPE.equals( "page" ) ) {
                              wPE = "LLD_Page";
                           } else if ( wPE.equals( "panel" ) ) {
                              wPE = "LLD_Panel";
                           } else if ( wPE.equals( "block" ) ) {
                              wPE = "LLD_Block";
                           } else {
                              logger.error( "Cannot create entity: " + entity + "  for parent: " + wPE );
                              return;
                           }
                           String wPID = (String) jo.get( "wPID" );
                           ec = vBlock.getCursor( wPE );  // this is the parent entity
                           if ( wPID == null ) {
                              cr = CursorResult.SET;  // we must be on the correct parent (at least we really hope so)
                           } else {
                              cr = ec.setFirstWithinOi( "wID", wPID );
                           }
                           if ( cr.isSet() ) {
                           // if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                              if ( wPE.equals( "LLD_Block" ) ) {
                                 ec = vBlock.getCursor( "LLD_SubBlock" );
                                 ec.createEntity( CursorPosition.LAST );
                                 ec.setToSubobject();
                                 entity = "LLD_Block";
                                 ec = vBlock.getCursor( entity );
                              } else {
                                 ec = vBlock.getCursor( entity );
                                 if ( entity.equals( "LLD_Block" ) || entity.equals( "LLD_Panel" ) ) {
                                    if ( entity.equals( "LLD_Panel" ) ) {
                                       vBlock.resetSubobjectTop();
                                    }
                                    ec.createEntity( CursorPosition.LAST );
                                 }
                                 if ( setPE != null ) {
                                    ec.getAttribute( "wPE" ).setValue( setPE );
                                 }
                              }
                              applyJsonPropertiesToZeidonAttributes( vLLD, vBlock, (JSONObject)obj, entity, depth, ec.getEntityInstance() );
                           }
                        }
                     }
                  } else {
                     // Get position on the corresponding entity in the OI.
                     cr = ec.setFirst( "ID", ID );
                     if ( cr.isSet() == false ) {
                        cr = ec.setFirstWithinOi( "ID", ID );
                        if ( cr.isSet() == false ) {
                           // Locate using wID because if it exists ... ID only exists if the entity came from the database.
                           String wID = (String) jo.get( "wID" );
                           if ( wID != null && wID.isEmpty() == false ) {
                              cr = ec.setFirstWithinOi( "wID", wID );
                           }
                        }
                        if ( cr.isSet() ) {
                           if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                              ec.setToSubobject();
                           }
                        }
                     }
                     // If we found it, things are hunky-dory.
                     if ( cr.isSet() ) {
                        EntityInstance ei = ec.getEntityInstance();
                        /*
                        if ( ID.equals( "600" ) || ID.equals( "812" ) || ID.equals( "878" ) ) {
                           EntityInstance eip = ei.getParent();
                           String IDP = eip.getAttribute( "ID" ).getString();
                           logger.debug( ID + " B Parent ID: " + IDP );
                        }
                        */
                        if ( deleteEntity ) {
                        // vBlock.logObjectInstance();
                        //ec.logEntity( true );
                           ec.deleteEntity();
                           logger.debug( "Entity DELETED: " + entity + "  ID: " + ID + "  Depth: " + depth );
                           continue; // while ( it.hasNext ...
                        } else {
                           applyJsonPropertiesToZeidonAttributes( vLLD, vBlock, (JSONObject)obj, entity, depth, ei );
                           ec = moveEntityIfNecessary( vBlock, entity, ID, ec );
                        }
                     } else if ( cr == CursorResult.UNCHANGED ) {
                        logger.error( "Entity NOT FOUND (UNCHANGED): " + entity + "  ID: " + ID + "  Depth: " + depth );
                        ec.createEntity( CursorPosition.NEXT );
                        ec.getAttribute( "Tag" ).setValue( "BustedUnchanged" + ID );
                        displaySPLD( vBlock, entity, ID );
                        throw new ZeidonException( "Entity NOT Found: " + ID + "  Look for Busted" );
                     } else {
                        logger.error( "Entity NOT FOUND: " + entity + "  ID: " + ID + "  Depth: " + depth );
                        ec.createEntity( CursorPosition.NEXT );
                        ec.getAttribute( "Tag" ).setValue( "Busted" + ID );
                        displaySPLD( vBlock, entity, ID );
                        throw new ZeidonException( "Entity NOT Found: " + ID + "  Look for Busted" );
                     }
                  }
                  if ( deleteEntity == false ) {
                  // if ( ei != null ) {
                  //    logger.debug( "Entity Instance Before: " + entity + "  ID: " + ID + "  Depth: " + depth );
                  //    ei.logEntity( false );
                  // }
                  /*
                     if ( ID.equals( "893" ) || ID.equals( "892" ) || ID.equals( "890" ) ||
                          ID.equals( "901" ) || ID.equals( "900" ) || ID.equals( "899" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "878" ) || ID.equals( "882" ) || ID.equals( "877" ) ) {
                        logger.debug( ID + " finished entity: " + entity );
                        ec.logEntity( true );
                     }
                  */
                     applyJsonLabelToView( vLLD, vBlock, (JSONObject)obj, entity, depth + 1, ec.getEntityInstance() );
                  // if ( ei != null ) {
                  //    logger.debug( "Entity Instance After: " + entity + "  ID: " + ID + "  Depth: " + depth );
                  //    ei.logEntity( false );
                  // }
                  }
               } catch ( ZeidonException ze ) {
                  logger.error( "Failed to process entity: " + entity + "  Depth: " + depth + "   ID: " + ID + "   Error: " + ze.getMessage() );
               } finally {
               // vBlock.resetSubobjectTop();
               }
            // } not checking ec.isNull()
            } else {
            // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + entity + "  Depth: " + depth );
               applyJsonLabelToView( vLLD, vBlock, (JSONObject)obj, entity, depth + 1, null );
            }
         } else {
            logger.error( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + entity + " Unknown type: " + obj.getClass().getName() );
         }
      }
   }

   private void checkSetValue( EntityInstance ei, String entity, String attribute, String valueNew ) {
      String valueOld = ei.getAttribute( attribute ).getString();
      if ( valueOld.equals( valueNew ) == false ) { // if the value has changed ...
      // logger.debug( "Changing entity.attribute: " + entity + "." + attribute + ": " + valueOld + "  to: " + valueNew );
      // ei.logEntity( false );
         try {
         // logger.debug( "AfterChange entity.attribute: " + entity + "." + key + ": " + valueOld + "  to: " + valueNew );
            ei.getAttribute( attribute ).setValue( valueNew );
         // ei.logEntity( false );
         } catch ( ZeidonException ze ) {
            if ( attribute.startsWith( "FK_ID_" ) || attribute.startsWith( "FKID" ) || attribute.startsWith( "AUTOSEQ" ) ) {
               String v = ei.getAttribute( attribute ).getString();
               if ( v.equals( valueNew ) == false ) {
                  logger.error( "System entity.attribute changed: " + entity + "." + attribute + "  value: " + valueNew + " ==> " + v );
               }
            } else {
               logger.error( "Failed to set entity.attribute: " + entity + "." + attribute + "  value: " + valueNew );
            }
         }
      }
   }

   private void applyJsonPropertiesToZeidonAttributes( View vLLD, View vBlock, JSONObject jsonObject, String entity, int depth, EntityInstance ei ) {
      if ( ei != null ) {
      // logger.debug( "Apply Json Start" );
      // ei.logEntity( false );
         String entityDefName = ei.getEntityDef().getName();
         if ( entity.equals( entityDefName ) || (entity.equals( "LLD_Block" ) && entityDefName.equals( "LLD_SubBlock" )) ) {
         // Set<String> keys = (Set<String>) jsonObject.keySet(); // these two lines work, but cause
         // for ( String key : keys ) {                           // a warning ... replaced by next two lines
            for ( Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext(); ) {
               String key = (String) iterator.next();
               Object obj = jsonObject.get( key );
            // logger.debug( "OTag: " + entity + "   Key: " + key + "   Depth: " + depth );
               if ( obj instanceof String ) {
                  String valueNew = (String) obj;
               // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "E.Attr: " + entity + "." + key + " : " + valueNew );
                  if ( key.equals( "ID" ) == false && key.charAt( 0 ) != '_' &&  // attribute is not ID (which is immutable) or a label designer work (starts with '_')
                       key.startsWith( "FK_ID_" ) == false && key.startsWith( "AUTOSEQ" ) == false ) {
                     // This is where we need to handle special entity/attributes such as: z_^marketing.^text.^font^weight - which
                     // should be mapped to the "Marketing" LLD_SpecialSectionAttribute entity and the "Text" LLD_SpecialSectionAttrBlock
                     // entity FontWeight attribute ... e.g. DirectionsForUse.Title.z_MarginTop
                     int idx1 = key.indexOf( "." );
                     if ( idx1 >= 0 ) {
                        String sectionType = key.substring( 0, idx1 ); // e.g. DirectionsForUse
                        idx1++;
                        int idx2 = key.indexOf( ".z_", idx1 );
                        if ( idx2 >= 0 ) {
                           String blockType = key.substring( idx1, idx2 ); // e.g. Title
                           String attribute = key.substring( idx2 + 3 ); // e.g. MarginTop
                           EntityCursor ec = vBlock.cursor( "LLD_SpecialSectionAttribute" );
                           if ( attribute.equals( "ID" ) == false ) {
                              CursorResult cr = ec.setFirst( "Name", blockType );
                              if ( cr.isSet() == false ) {
                                 ec.createEntity();
                                 ec.getAttribute( "Name" ).setValue( blockType );
                              }
                              ec = vBlock.cursor( "LLD_SpecialSectionAttrBlock" );
                              cr = ec.setFirst( "LLD_SectionType", sectionType );
                              if ( cr.isSet() == false ) {
                                 cr = ec.setFirst();
                                 if ( cr.isSet() == false ) {
                                    ec.createEntity();
                                 }
                                 ec.getAttribute( "LLD_SectionType" ).setValue( sectionType );
                              }
                              if ( attribute.equals( "TextColor" ) ) { // we need to include the color entity
                              // logger.debug( "TextColor E.Attr: " + entity + "." + key + " : " + valueNew );
                                 ec.getAttribute( "TextColor" ).setValue( valueNew );
                                 ec = vBlock.cursor( "SpecialAttributeTextColor" );
                                 cr = ec.setFirst( "dColorName", valueNew );
                                 if ( cr.isSet() == false ) {
                                    cr = ec.setFirst();
                                    if ( cr.isSet() ) {
                                       ec.excludeEntity();
                                    }
                                    EntityCursor ecp = vLLD.cursor( "Color" );
                                    cr = ecp.setFirst( "dColorName", valueNew );
                                    if ( cr.isSet() ) {
                                       ec.includeSubobject( ecp );
                                    }
                                 }
                              // ec = vBlock.cursor( entity );  // debug only
                              // ec.logEntity( true );               // debug only
                              } else {
                                 checkSetValue( ec.getEntityInstance(), "LLD_SectionType", attribute, valueNew );
                              }
                           }
                        // else {  no!!! we do not want to set ID
                        //    EntityInstance eib = ec.getEntityInstance();
                        //    checkSetValue( eib, "LLD_SectionType", attribute, valueNew );
                        // }
                        }
                     } else {
                        if ( key.equals( "BackgroundColor" ) || key.equals( "BorderColor" ) ) { // we need to include the color entity
                        // logger.debug( key + " E.Attr: " + entity + "." + key + " : " + valueNew );
                           EntityCursor ec = vBlock.cursor( entity );
                           ec.getAttribute( key ).setValue( valueNew );
                           String colorEntity;
                           if ( entity.contains( "Block" ) ) {
                              colorEntity = "Block" + key;
                           } else if ( entity.contains( "Panel" ) ) {
                              colorEntity = "Panel" + key;
                           } else {
                              colorEntity = "Page" + key;
                           }
                           ec = vBlock.cursor( colorEntity ); // like BlockBorderColor or PanelBackgroundColor
                           CursorResult cr = ec.setFirst( "dColorName", valueNew );
                           if ( cr.isSet() == false ) {
                              cr = ec.setFirst();
                              if ( cr.isSet() ) {
                                 ec.excludeEntity();
                              }
                              EntityCursor ecp = vLLD.cursor( "Color" );
                              cr = ecp.setFirst( "dColorName", valueNew );
                              if ( cr.isSet() ) {
                                 ec.includeSubobject( ecp );
                              }
                           }
                        } else {
                           checkSetValue( ei, entity, key, valueNew );
                        }
                     }
                  }
               }
            }
         } else {
            String msg = "ei (" + ei.getEntityDef().getName() + ") does not match entity: " + entity;
            logger.error( msg );
            throw new ZeidonException( msg );
         }
      // logger.debug( "Apply Json End" );
      // ei.logEntity( false );
      }
   }

   private void applyJsonLabelToView( View vLLD, View vBlock, JSONObject jsonObject, String entity, int depth, EntityInstance ei ) {
/* start debug code
      boolean log = false;
      if ( ei != null ) {
         Object o = jsonObject.get( "ID" );
         if ( o instanceof String ) {
            String ID = (String)o;
            if ( ID.equals( "626" ) ) {
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
            if ( key.equals( "OIs" ) ) {
               depth = -2;
            } else if ( key.equals( "SPLD_LLD" ) ) {
               depth = -1;
            } else if ( key.equals( "SPLD_Page" ) ) {
               depth = 0;
            } else if ( key.equals( "SPLD_Panel" ) ) {
               depth = 1;
            }

            String entityName = key.equals( "LLD_SubBlock" ) ? "LLD_Block" : key;
         // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + key + " Depth: " + (depth + 1) );
            processJsonArray( vLLD, vBlock, ja, entityName, depth );
         } else if ( obj instanceof JSONObject ) {
         // logger.debug( StringUtils.repeat( " ", (depth + 2) * 3 ) + "MetaOI: " + key + " Skipped!" );
         // applyJsonLabelToView( vLLD, vBlock, (JSONObject)obj, key, depth + 1, null );
         } else {
            logger.error( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Key: " + key + "  Unknown type: " + obj.getClass().getName() );
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
         // logger.debug( ">>>>>>>>>>>>> Raw Post Character: " + rc );
            if ( rc >= 0 )
               os.write( buf, 0, rc );
         }
         String s = new String( os.toByteArray(), "UTF-8" );
      // logger.debug( ">>>>>>>>>>>>> Raw Post Data: " + s );
      // logger.debug( "=================================" );
         decoded = URLDecoder.decode( s, "UTF-8" );
      // logger.debug( ">>>>>>>>>>>>> DECODED Post Data: " + decoded );
      // logger.debug( "=================================" );
         JSONParser jsonParser = new JSONParser();
         json = (JSONObject)jsonParser.parse( decoded );
      } catch( IOException io ) {
         logger.error( "Error getting Post data: " + io.getMessage() );
         logger.error( "*********************************" );
      } catch( ParseException pe ) {
         logger.error( "Unable to parse decoded JSON: " + decoded );
         logger.error( "Parse Error: " + pe.getMessage() );
         logger.error( "*********************************" );
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
            if ( entity.equals( "LLD_Block" ) ) {
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
                  if ( entity.equals( "LLD_Panel" ) ) {
                     ec = mSPLDefBlock.getCursor( "LLD_Panel" );
                  } else {
                     ec = mSPLDefBlock.getCursor( "LLD_Block" );
                  }
                  CursorResult cr;
                  if ( id != null && id.isEmpty() == false && id.equals( wid ) ) {
                     cr = ec.setFirstWithinOi( "ID", id );
                     tag = id;
                  } else {
                     cr = ec.setFirstWithinOi( "Tag", tag );
                  }
                  if ( cr.isSet() ) {
                     logger.debug( "PositionByKey set to Entity.Tag ================>>> " + entity + "." + tag );
                  // ec.logEntity( false );
                  } else {
                     logger.error( "Could not set cursor for Entity.Tag: " + entity + "." + tag );
                     throw new ZeidonException( "Could not set cursor for Entity.Tag: " + entity + "." + tag );
                  }
               }
            }
         }
      }

      return ec;
   }

   private void copyBlockToReuse( View vLLD, View vBlock, View mBlockRU ) {
      EntityCursor ecb = mBlockRU.getCursor( "LLD_Block" );
      EntityCursor ec = vBlock.getCursor( "LLD_Block" );
      ecb.createEntity( CursorPosition.LAST );
      ecb.setMatchingAttributesByName( ec, SetMatchingFlags.DEFAULT );
      ec = vBlock.getCursor( "LLD_SpecialSectionAttribute" );
      CursorResult cr = ec.setFirst();
      while ( cr.isSet() ) {
         ecb = mBlockRU.getCursor( "LLD_SpecialSectionAttribute" );
         ecb.createEntity();
         ecb.setMatchingAttributesByName( ec, SetMatchingFlags.DEFAULT );
         EntityCursor ecs = vBlock.getCursor( "LLD_SpecialSectionAttrBlock" );
         CursorResult crs = ecs.setFirst();
         while ( crs.isSet() ) {
            ecb = mBlockRU.getCursor( "LLD_SpecialSectionAttrBlock" );
            ecb.createEntity();
            ecb.setMatchingAttributesByName( ecs, SetMatchingFlags.DEFAULT );
            EntityCursor ecc = vBlock.getCursor( "SpecialAttributeTextColor" );
            CursorResult crc = ecc.setFirst();
            if ( crc.isSet() ) {
               ecb = mBlockRU.getCursor( "SpecialAttributeTextColor" );
               ecb.includeSubobject( ecc );
            }
            crs = ecs.setNext();
         }
         cr = ec.setNext();
      }
      ec = vBlock.getCursor( "BlockBackgroundColor" );
      cr = ec.setFirst();
      if ( cr.isSet() ) {
         ecb = mBlockRU.getCursor( "BlockBackgroundColor" );
         ecb.includeSubobject( ec );
      }
      ec = vBlock.getCursor( "BlockBorderColor" );
      cr = ec.setFirst();
      if ( cr.isSet() ) {
         ecb = mBlockRU.getCursor( "BlockBorderColor" );
         ecb.includeSubobject( ec );
      }
      ec = vBlock.getCursor( "LLD_SubBlock" );
      cr = ec.setFirst();
      while ( cr.isSet() ) {
         vBlock.cursor( "LLD_SubBlock" ).setToSubobject();
         mBlockRU.cursor( "LLD_SubBlock" ).setToSubobject();
         copyBlockToReuse( vLLD, vBlock, mBlockRU );
         mBlockRU.cursor( "LLD_Block" ).resetSubobjectToParent();
         vBlock.cursor( "LLD_Block" ).resetSubobjectToParent();
         cr = ec.setNext();
      }
   }

   private String addReusableBlock( View vLLD, View vBlock, String blockTag, String blockName ) {
      View vBlockCopy = vBlock.newView();
      vBlockCopy.copyCursors( vBlock );
      EntityCursor ec = vBlockCopy.getCursor( "LLD_Block" );
      CursorResult cr = ec.setFirstWithinOi( "Tag", blockTag );
      if ( cr.isSet() ) {
         View mBlockRU;
         mBlockRU = new QualificationBuilder( vLLD )
                    .setLodDef( "mBlockRU" )
                    .addAttribQual( "ReusableBlockDefinition", "Name", "=", blockName )
                    .activate();
         boolean deleted = false;
         while ( mBlockRU.cursor( "ReusableBlockDefinition" ).hasAny() ) {
            mBlockRU.cursor( "ReusableBlockDefinition" ).deleteEntity( CursorPosition.NEXT );
            deleted = true;
         }
         if ( deleted ) {
            mBlockRU.commit();
         }
         mBlockRU = vLLD.activateEmptyObjectInstance( "mBlockRU" );
         EntityCursor ecb = mBlockRU.getCursor( "ReusableBlockDefinition" );
         ecb.createEntity();
         ecb.getAttribute( "Name" ).setValue( blockName );
         ecb.getAttribute( "LLD_SectionType" ).setValue( ec.getAttribute( "LLD_SectionType" ) );

         ecb = mBlockRU.getCursor( "Subregistrant" );
         ecb.includeSubobject( vLLD.getCursor( "Subregistrant" ) );
         copyBlockToReuse( vLLD, vBlockCopy, mBlockRU );
      // logger.debug( "Reusable Block OI: " );
      // mBlockRU.logObjectInstance();
         mBlockRU.commit();
         mBlockRU.drop();
         vBlockCopy.drop();
         String jsonReuse = "{ \"ReusableBlocks\" : [ ";
         ec = vLLD.cursor( "ReusableBlockDefinition" );
         ec.orderEntities( "LLD_SectionType A Name A" );
         cr = ec.setFirst();
         while ( cr.isSet() ) {
            jsonReuse += " { \"LLD_SectionType\" : \"" + ec.getAttribute( "LLD_SectionType" ).getString() +
                         "\", \"Name\" : \"" + ec.getAttribute( "Name" ).getString() +
                         "\", \"Description\" : \"" + ec.getAttribute( "Description" ).getString() + "\" }";
            cr = ec.setNext();
            if ( cr.isSet() ) {
               jsonReuse += ", ";
            }
         }
         jsonReuse += " ] }";
         return jsonReuse;
      } else {
         vBlockCopy.drop();
         return "{}";
      }
   }

   private void copyReuseToBlock( View vLLD, View vBlock, View mBlockRU ) {
      EntityCursor ecb = mBlockRU.getCursor( "LLD_Block" );
      EntityCursor ec = vBlock.getCursor( "LLD_Block" );
      ec.createEntity( CursorPosition.LAST );
      ec.setMatchingAttributesByName( ecb, SetMatchingFlags.DEFAULT );
      ec.getAttribute( "wID" ).setValue( ec.getAttribute( "Tag" ).getString() );
      ecb = mBlockRU.getCursor( "LLD_SpecialSectionAttribute" );
      CursorResult cr = ecb.setFirst();
      while ( cr.isSet() ) {
         ec = vBlock.getCursor( "LLD_SpecialSectionAttribute" );
         ec.createEntity();
         ec.setMatchingAttributesByName( ecb, SetMatchingFlags.DEFAULT );
         EntityCursor ecs = mBlockRU.getCursor( "LLD_SpecialSectionAttrBlock" );
         CursorResult crs = ecs.setFirst();
         while ( crs.isSet() ) {
            ec = vBlock.getCursor( "LLD_SpecialSectionAttrBlock" );
            ec.createEntity();
            ec.setMatchingAttributesByName( ecs, SetMatchingFlags.DEFAULT );
            EntityCursor ecc = mBlockRU.getCursor( "SpecialAttributeTextColor" );
            CursorResult crc = ecc.setFirst();
            if ( crc.isSet() ) {
               ec = vBlock.getCursor( "SpecialAttributeTextColor" );
               ec.includeSubobject( ecc );
            }
            crs = ecs.setNext();
         }
         cr = ecb.setNext();
      }
      ecb = mBlockRU.getCursor( "BlockBackgroundColor" );
      cr = ecb.setFirst();
      if ( cr.isSet() ) {
         ec = vBlock.getCursor( "BlockBackgroundColor" );
         ec.includeSubobject( ecb );
      }
      ecb = mBlockRU.getCursor( "BlockBorderColor" );
      cr = ecb.setFirst();
      if ( cr.isSet() ) {
         ec = vBlock.getCursor( "BlockBorderColor" );
         ec.includeSubobject( ecb );
      }
      ecb = mBlockRU.getCursor( "LLD_SubBlock" );
      cr = ecb.setFirst();
      while ( cr.isSet() ) {
         vBlock.cursor( "LLD_SubBlock" ).setToSubobject();
         mBlockRU.cursor( "LLD_SubBlock" ).setToSubobject();
         copyReuseToBlock( vLLD, vBlock, mBlockRU );
         mBlockRU.cursor( "LLD_Block" ).resetSubobjectToParent();
         vBlock.cursor( "LLD_Block" ).resetSubobjectToParent();
         cr = ecb.setNext();
      }
   }

   private boolean applyReusableBlock( View vLLD, View vBlock, String panelTag, String blockName, String parms ) {
      EntityCursor ec = vBlock.getCursor( "LLD_Panel" );
      CursorResult cr = ec.setFirstWithinOi( "Tag", panelTag );
      if ( cr.isSet() ) {
         View mBlockRU;
         mBlockRU = new QualificationBuilder( vLLD )
                    .setLodDef( "mBlockRU" )
                    .addAttribQual( "ReusableBlockDefinition", "Name", "=", blockName )
                    .activate();
         if ( mBlockRU.cursor( "ReusableBlockDefinition" ).hasAny() ) {
            try {
               // parms = "{ \"top\": \"" + event.pageY + "\", \"left\": \"" + event.pageX + "\" }"
               JSONParser jsonParser = new JSONParser();
               JSONObject jsonObj = (JSONObject)jsonParser.parse( parms );
               ec = mBlockRU.getCursor( "LLD_Block" );
               ec.getAttribute( "Top" ).setValue( jsonObj.get( "top" ) );
               ec.getAttribute( "Left" ).setValue( jsonObj.get( "left" ) );
            // logger.debug( "Reusable Block Entity: " );
            // ec.logEntity();
               copyReuseToBlock( vLLD, vBlock, mBlockRU );
            } catch( ParseException pe ) {
               logger.error( "Unable to parse parms JSON: " + parms );
               logger.error( "Parse Error: " + pe.getMessage() );
               logger.error( "*********************************" );
            }
            return true;
         }
      }
      return false;
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
   // logger.debug( "=========================================>>>>>>>>>>>>>>>>>>>>>>>>>>> Graphical Designer Servlet Task Id: " + taskId );
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

      if ( action.equals( "setCursorPosition" ) ) {
         if ( vLLD != null ) {
            try {
               View mSPLDefBlock = epamms.getViewByName( "mSPLDefBlock" );;
               if ( mSPLDefBlock == null ) {
                  mSPLDefBlock = vLLD.newView( );
                  mSPLDefBlock.setName( "mSPLDefBlock", Level.TASK );
               }
               mSPLDefBlock.resetSubobjectTop();
               View mSPLDefPanel = epamms.getViewByName( "mSPLDefPanel" );
               if ( mSPLDefPanel == null ) {
                  mSPLDefPanel = mSPLDefBlock.newView( );
                  mSPLDefPanel.setName( "mSPLDefPanel", Level.TASK );
               } else {
                  mSPLDefPanel.resetSubobjectTop();
               }
               try {
                  String viewPath = request.getParameter( "viewPath" );
               // logger.debug( "Setting view path: " + viewPath );
                  String elementKey = request.getParameter( "elementKey" );
               // logger.debug( "Setting cursor for element key: " + elementKey );
               // EntityCursor ec = setPathCursorPosition( mSPLDefBlock, viewPath, 0, 0 );
                  EntityCursor ec = setPositionByKey( mSPLDefBlock, elementKey );
               // logger.debug( "Finished setting view path: " + viewPath );
               // ec.logEntity( false );
               } catch (ZeidonException ze) {
                  // Could not locate target block
                  logger.error( "Error locating the target block: " + ze.getMessage() );
                  jsonLabel = "{ \"Error\" : \"" + ze.getMessage() + "\" }";
                  response.setStatus( HttpServletResponse.SC_ACCEPTED );
                  response.setContentType( "text/json" );
                  response.getWriter().write( new Gson().toJson( jsonLabel ) );
               }
            } catch (ZeidonException ze) {
               // I think this means we are at the top
               logger.error( "setCursorPosition: " + ze.getMessage() );
            }
            response.setContentType( "text/json" );
            response.getWriter().write( new Gson().toJson( "{}" ) );
         }
      } else if ( action.equals( "saveReusableBlock" ) ) {
         View vBlock = null;
         String blockTag = request.getParameter( "blockTag" );
         String blockName = request.getParameter( "blockName" );
            try {
               vLLD.resetSubobjectTop();
               vBlock = vLLD.newView();
               vBlock.resetSubobjectTop();
               jsonLabel = addReusableBlock( vLLD, vBlock, blockTag, blockName );
            } catch( ZeidonException ze ) {
               logger.error( "Error processing Json Label: " + ze.getMessage() );
               jsonLabel = "{}";
            } finally {
               if ( vBlock != null ) {
                  vBlock.drop();
               }
               response.setContentType( "text/json" );
            // response.getWriter().write( jsonLabel );
               response.getWriter().write( new Gson().toJson( jsonLabel ) );
            }

      } else if ( action.equals( "saveLabel" ) || action.equals( "saveLabelCommit" ) ||
                  action.equals( "saveLabelRefresh" ) || action.equals( "applyReusableBlock" ) ) {
         if ( vLLD != null ) {
            View vBlock = null;
            JSONObject jsonPost = getPostData( request );
         // String strJson = jsonPost.toJSONString();
         // logger.debug( "Save JSON: " + strJson );
            try {
               vLLD.resetSubobjectTop();
               vBlock = vLLD.newView();
               vBlock.resetSubobjectTop();
            // logger.debug( "Before Apply Json to OI" );
            // displaySPLD( vLLD, null, "" );
               applyJsonLabelToView( vLLD, vBlock, jsonPost, "", -2, null );  // OIs, SPLD_LLD, depth == 0 for LLD_Page
               vLLD.setName( "mSPLDefPanel", Level.TASK );
            // displaySPLD( vLLD, null, "" );
               // Sort the blocks
               CursorResult cr = vLLD.cursor( "LLD_Panel" ).setFirst();
               while ( cr.isSet() ) {
                  sortBlocks( vLLD );
                  cr = vLLD.cursor( "LLD_Panel" ).setNext();
               }
            // logger.debug( "After Sort Blocks LLD OI: " );
            // displaySPLD( vLLD, null, "" );
            // vLLD.logObjectInstance();
            // logger.debug( "Saved JSON to OI" );
               if ( action.equals( "saveLabelCommit" ) ) {
                  vLLD.commit();
               // displaySPLD( vLLD, null, "" );
               }
               if ( action.equals( "saveLabelRefresh" ) || action.equals( "saveReusableBlock" ) || action.equals( "applyReusableBlock" ) ) {
                  if ( action.equals( "saveReusableBlock" ) || action.equals( "applyReusableBlock" ) ) {
                     String blockTag = request.getParameter( "blockTag" );
                     String blockName = request.getParameter( "blockName" );
                     String parms = request.getParameter( "parms" );
                     applyReusableBlock( vLLD, vBlock, blockTag, blockName, parms );
                  // logger.debug( "After saveReusableBlock" + blockName );
                  // vLLD.logObjectInstance();
                  }
                  if ( action.equals( "applyReusableBlock" ) == false ) {
                     String id = vLLD.cursor( "SubregPhysicalLabelDef" ).getAttribute( "ID" ).getString();
                     vLLD.drop();
                     vLLD = new QualificationBuilder( epamms )
                               .setLodDef( "mSPLDef" )
                               .addAttribQual( "SubregPhysicalLabelDef", "ID", "=", id )
                               .activate();
                     vLLD.setName( viewName, Level.TASK );
                  }
               // logger.debug( "After RefreshLabel" );
               // vLLD.logObjectInstance();
                  jsonLabel = convertLLD_ToJSON( vLLD );
               // logger.debug( "Completed refresh Json Label: " + jsonLabel );
               } else {
                  jsonLabel = "{}";
               }
            } catch( ZeidonException ze ) {
               logger.error( "Error processing Json Label: " + ze.getMessage() );
               jsonLabel = "{}";
            } finally {
               if ( vBlock != null ) {
                  vBlock.drop();
               }
               response.setContentType( "text/json" );
            // response.getWriter().write( jsonLabel );
               response.getWriter().write( new Gson().toJson( jsonLabel ) );
            }
         } else {
            logger.debug( "Null LLD ... skipped processing Json Label: " + jsonLabel );
            response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
            response.getWriter().write( new Gson().toJson( "{}" ) );
         }
      } else if ( action.equals( "loadLabel" ) ) {
      // We are just going to get the SPLD_LLD and its children and rename SPLD_LLD to LLD
         try {
         // logger.debug( "LoadLabel OI: " );
         // displaySPLD( vLLD, null, "" );
         // vLLD.logObjectInstance();
            jsonLabel = convertLLD_ToJSON( vLLD );
         // logger.debug( "LoadLabel JSON: " + jsonLabel );
         // jsonLabel = jsonLabel.replaceFirst( "\"TZLLD\",", "\"TZLLD\",\n      \"fileName\" : \"" + fileName + "\"," );
         } catch( ZeidonException ze ) {
            logger.error( "Error loading Json Label: " + ze.getMessage() );
            jsonLabel = "{ \"Error\" : \"" + ze.getMessage() + "\" }";
         } finally {
            response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
            response.getWriter().write( new Gson().toJson( jsonLabel ) );
         }
      } else if ( action.equals( "getSkeletonForView" ) ) {
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
      } else if ( action.equals( "sethazardpanel" ) ) {
         String location = request.getParameter( "location" );
         EntityCursor ec = vLLD.cursor( "SPLD_HumanHazardSection" );
      // logger.debug( "Set Hazard Panel Location: " + location );
         ec.getAttribute( "PanelLoc" ).setValue( location );
         response.setContentType( "text/json" );
         response.getWriter().write( new Gson().toJson( "{}" ) );
      } else if ( action.equals( "sethazardlabel" ) ) {
         String location = request.getParameter( "location" );
         EntityCursor ec = vLLD.cursor( "SPLD_HumanHazardSection" );
      // logger.debug( "Set Hazard Label Location: " + location );
         ec.getAttribute( "LabelLoc" ).setValue( location );
         response.setContentType( "text/json" );
         response.getWriter().write( new Gson().toJson( "{}" ) );
      } else {
         //nothing to show
         response.setStatus( HttpServletResponse.SC_NO_CONTENT );
      }
   }
}
