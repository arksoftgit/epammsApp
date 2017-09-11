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
   private int g_SyncId;

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
   // logger.info( "Beginning insert Tag: " + tag );
      while ( lower <= upper ) {
      // logger.info( "insert Tag: " + newTag + "  lower: " + lower + "  upper: " + upper );
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
   // logger.info( "Insert Added Tag: " + tag + "   at position: " + mid );
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
            mSPLDef.cursor( "LLD_Block" ).orderEntities( "Top A Left A Width D Height D" );
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
      EntityInstance ei;
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
      ec.orderEntities( "LLD_BlockType A Name A" );
      CursorResult cr = ec.setFirst();
      while ( cr.isSet() ) {
         jsonReuse += " { \"LLD_BlockType\" : \"" + ec.getAttribute( "LLD_BlockType" ).getString() +
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

      String jsonFontFamily = "[";
      ec = vLLD.cursor( "Font" );
      cr = ec.setFirst();
      while ( cr.isSet() ) {
         jsonFontFamily += " { \"Name\" : \"" + ec.getAttribute( "Name" ).getString() + "\" }";
         cr = ec.setNext();
         if ( cr.isSet() ) {
            jsonFontFamily += ", ";
         }
      }
      jsonFontFamily += " ]";

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
      // logger.info( "Return from insertTag: " + newTag );
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

         // Set sync id for each block.
         vLLD.resetSubobjectTop();
         ec = vLLD.cursor( "SPLD_LLD" );
         g_SyncId = 1;
         ec.getAttribute( "wSyncId" ).setValue( g_SyncId++ );
         Iterator<? extends EntityInstance> hierInstanceIterator = ec.getChildrenHier( false ).iterator();
         while ( hierInstanceIterator.hasNext() ) {
            ei = hierInstanceIterator.next();
            if ( ei.getEntityDef().getName().equals( "LLD_Block" ) || ei.getEntityDef().getName().equals( "LLD_SubBlock" ) ||
                 ei.getEntityDef().getName().equals( "LLD_Panel" ) || ei.getEntityDef().getName().equals( "LLD_Page" ) ) { // || ei.getEntityDef().getName().equals( "SPLD_LLD" ) ) {
               ei.getAttribute( "wSyncId" ).setValue( g_SyncId++ );
            }
         }
         hierInstanceIterator = null;
         vLLD.resetSubobjectTop();
      //xdisplaySPLD( vLLD, null, "" );

         StringBuilder sb = new StringBuilder( vLLD.serializeOi().asJson().withIncremental().toStringWriter().toString() );
      // logger.info( "LLD Json Label from OI: " + sb.toString() );

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
                                                      ", \"FontFamily\" : " + jsonFontFamily +
                                                      ", \"Marketing\" : " + jsonMarketing +
                                                      ", \"HazardSelectedLocations\" : " + jsonSelectedHazard +
                                                      ", \"HazardLocations\" : " + jsonHazard +
                                              " }";
      // logger.info( "Reduced Json Label from OI: " + jsonLabel );
      } catch( ZeidonException ze ) {
         logger.error( "Error loading Json Label: " + ze.getMessage() );
         jsonLabel = "{ \"Error\" : \"" + ze.getMessage() + "\" }";
      } finally {
      /*
         if ( sw != null ) {
            try {
               sw.close();
            } catch( IOException oi ) {
               logger.info( "Unable to close StringWriter in convertLLD_ToJSON" );
            }
         }
         if ( writer != null ) {
            try {
               writer.close();
            } catch( IOException oi ) {
               logger.info( "Unable to close BufferedWriter in convertLLD_ToJSON" );
            }
         }
      */
      }
      return jsonLabel;
   }

   private void displaySPLD( View mSPLDef, String entity, String id ) {
      logger.info( "displaySPLD" );
      EntityCursor ec;
      if ( entity != null ) {
         boolean display = false;
         ec = mSPLDef.getCursor( entity );
         if ( ! id.equals( "" ) ) {
            CursorResult cr = ec.setFirst( "ID", id );
            if ( cr.isSet() ) {
               display = true;
            }
         }
         if ( ec.isNull() == false ) {
            ec.logEntity( display );
         } else {
            logger.info( "Null entity: " + entity );
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

      // if ( ID.equals( "600" ) || ID.equals( "812" ) || ID.equals( "813" ) ) {
      //    logger.info( ID + "C"  + "  Checking move from parent ID: " + IDP + "  to parent ID: " + wPID );
      //    eip.logEntity( false );
      //    displaySPLD( vLLD, entity, ID );
      // }

         if ( wPID == null || IDP == null  ) {
            logger.error( "For ID: " + ID + "  Unexpected null wPID: " + wPID == null ? "Null" : wPID + "  wID: " + IDP == null ? "Null" : IDP );
         } else if ( wPID.equals( IDP ) == false ) { // if there is a new parent ...
         // logger.info( "Before moving entity: " + entity + "  with ID: " + ID + "  from parent ID: " + IDP + "  to parent ID: " + wPID );
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
                  ecp.moveSubobject( CursorPosition.LAST, ec, CursorPosition.NONE );
                  vLLD.copyCursors( v );  // we want position on the moved entity
               // logger.info( "After Moving To SubBlock Target entity: " + entity + "  with ID: " + ID + "  from parent ID: " + IDP + "  to parent ID: " + wPID );
               // vLLD.logObjectInstance();  huge
               // displaySPLD( vLLD, wPE, "" );
               // ecp.logEntity( false );
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
      // logger.info( "Array type: " + obj.getClass().getName() );
         if ( obj instanceof JSONObject ) {
            JSONObject jo = (JSONObject)obj;
            if ( depth >= -1 ) {
               EntityCursor ec = vBlock.getCursor( entity );
            // if ( ec.isNull() == false ) {  // the ec.isNull may be true ==> no entities, but we may want to create one!
               Integer syncId;
               String ID = (String) jo.get( "wSyncId" );
               if ( ID != null ) {
                  syncId = Integer.parseInt( ID );
               } else {
                  syncId = null;
               }
               ID = (String) jo.get( "ID" );
               if ( ID != null ) {
                  try {
                     String is = ID.replaceAll( "[^\\d]", "" );
                     int id = Integer.parseInt( is );
                     if ( id <= 0 ) {
                        ID = null;
                     }
                  } catch ( NumberFormatException e ) {
                     ID = null;        
                  }
               }
               CursorResult cr;
               /*
               if ( ID != null && ID.isEmpty() == false ) {
                  logger.info( "Processing Entity: " + entity + "  ID: " + ID );
                  cr = ec.setFirstWithinOi( "ID", ID );
                  if ( cr.isSet() ) {
                     if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                        ec.setToSubobject();
                     }
                     if ( ID.equals( "893" ) || ID.equals( "892" ) || ID.equals( "890" ) ||
                          ID.equals( "878" ) || ID.equals( "882" ) || ID.equals( "877" ) ) {
                        logger.info( ID + " at entity: " + entity );
                        ec.logEntity( false );
                     }
                  }
               } else {
                  logger.info( "Processing Entity: " + entity + "  wID: " + (String) jo.get( "wID" ) );
               }
               */
               try {
                  if ( entity.equals( "LLD_Page" ) ) {
                     Object op = jo.get( "LLD_Panel" ); // if there are no panels we will delete the page
                     if ( op == null ) {
                        if ( syncId != null && syncId > 0 ) { // ID != null && ID.isEmpty() == false ) {
                           cr = ec.setFirst( "wSyncId", syncId );
                           if ( cr.isSet() ) {
                              ec.getEntityInstance();
                              logger.info( "Deleting entity: " + entity );
                           // ec.logEntity( true );
                              ec.deleteEntity();
                           }
                        }
                        continue; // while ( it.hasNext ...
                     }
                  }

                  String _DeleteEntity = (String)jo.get( "_Delete" );
                  boolean deleteEntity = (_DeleteEntity != null && _DeleteEntity.charAt( 0 ) == 'Y') ? true : false;
                  if ( syncId == null || syncId <= 0 ) { //ID == null || ID.isEmpty() ) {  // if we are in a create situation, take care of that right now
                     String wID = (String) jo.get( "wID" );
                     if ( deleteEntity ) {
                        cr = ec.setFirstWithinOi( "wID", wID );
                        if ( cr.isSet() ) {
                           if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                              ec.setToSubobject();
                           }
                           ec.deleteEntity();
                           logger.info( "Entity DELETED: " + entity + "  ID: " + ID + "  Depth: " + depth );
                        }
                     } else {
                        String _EOI = (String)jo.get( "_EOI" );
                        if ( _EOI != null && _EOI.charAt( 0 ) == 'Y' ) { // exists on OI
                           cr = ec.setFirstWithinOi( "ID", wID );  // changed from "wID" to "ID" ... dks 2016.12.30
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
                           String wPE = (String) jo.get( "wPE" );  // parent entity
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
                              } else if ( entity.equals( "LLD_SpecialSectionAttribute" ) ) {
                                 wPE = "LLD_Block";
                                 setPE = "block";
                              } else if ( entity.equals( "LLD_SpecialSectionAttrBlock" ) ) {
                                 wPE = "LLD_SpecialSectionAttribute";
                                 setPE = "special";
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
                           } else if ( wPE.equals( "special" ) ) {
                              wPE = "LLD_SpecialSectionAttribute";
                           } else {
                              logger.error( "Cannot create entity: " + entity + "  for parent: " + wPE );
                              return;
                           }
                           String wPID = (String) jo.get( "wPID" );
                           ec = vBlock.getCursor( wPE );  // this is the parent entity
                           if ( wPID == null ) {
                              if ( entity.equals( "LLD_SpecialSectionAttribute" ) ) {
                                 String pTag = (String) jo.get( "_pTag" );  // parent tag
                              // cr = ec.setFirstWithinOi( "Tag", pTag );
                                 cr = ec.setFirst( "Tag", pTag );
                                 if ( cr.isSet() ) {
                                    ec.logEntity( true );
                                 // if ( "LLD_SubBlock".compareTo( ec.getEntityInstance().getEntityDef().getName() ) == 0 ) {
                                 //   ec.setToSubobject();
                                 //   ec = vBlock.getCursor( "LLD_Block" );
                                 // }
                                    ec = vBlock.getCursor( "LLD_SpecialSectionAttribute" );
                                    String name = (String) jo.get( "Name" );
                                    cr = ec.setFirst( "Name", name );
                                    if ( cr.isSet() == false ) {
                                       ec.createEntity( CursorPosition.LAST );
                                       ec.getAttribute( "Name" ).setValue( name );
                                       cr = CursorResult.SET;
                                       ec.logEntity( true );
                                    }
                                 }
                              } else if ( entity.equals( "LLD_SpecialSectionAttrBlock" ) ) {
                                 ec = vBlock.getCursor( "LLD_SpecialSectionAttrBlock" );
                                 String name = (String) jo.get( "Name" );
                                 cr = ec.setFirst( "Name", name );
                                 if ( cr.isSet() == false ) {
                                    ec.createEntity( CursorPosition.LAST );
                                    ec.getAttribute( "Name" ).setValue( name );
                                    cr = CursorResult.SET;
                                    ec.logEntity( true );
                                 }
                              } else {
                                 cr = CursorResult.SET;  // we must be on the correct parent (at least we really hope so)
                              }
                           } else {
                              cr = ec.setFirstWithinOi( "wID", wPID );  // changed from "ID" to "wID" ... dks 2017.01.04
                           }
                           if ( cr.isSet() ) {
                           // if ( ec.getEntityDef().getName().equals( "LLD_SubBlock" ) ) {
                              if ( wPE.equals( "LLD_Block" ) && entity.equals( "LLD_SpecialSectionAttribute" ) == false ) {
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
                     cr = ec.setFirst( "wSyncId", syncId );
                     if ( cr.isSet() == false ) {
                        cr = ec.setFirstWithinOi( "wSyncId", syncId );
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
                           logger.info( ID + " B Parent ID: " + IDP );
                        }
                        */
                        if ( deleteEntity ) {
                        // vBlock.logObjectInstance();
                        // ec.logEntity( true );
                           ec.deleteEntity();
                           logger.info( "Entity DELETED: " + entity + "  ID: " + ID + "  Depth: " + depth );
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
                  //    logger.info( "Entity Instance Before: " + entity + "  ID: " + ID + "  Depth: " + depth );
                  //    ei.logEntity( false );
                  // }
                  /*
                     if ( ID.equals( "893" ) || ID.equals( "892" ) || ID.equals( "890" ) ||
                          ID.equals( "901" ) || ID.equals( "900" ) || ID.equals( "899" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "894" ) || ID.equals( "861" ) || ID.equals( "871" ) ||
                          ID.equals( "878" ) || ID.equals( "882" ) || ID.equals( "877" ) ) {
                        logger.info( ID + " finished entity: " + entity );
                        ec.logEntity( true );
                     }
                  */
                     applyJsonLabelArrayToView( vLLD, vBlock, (JSONObject)obj, entity, depth + 1, ec.getEntityInstance() );
                  // if ( ei != null ) {
                  //    logger.info( "Entity Instance After: " + entity + "  ID: " + ID + "  Depth: " + depth );
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
            // logger.info( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + entity + "  Depth: " + depth );
               applyJsonLabelArrayToView( vLLD, vBlock, (JSONObject)obj, entity, depth + 1, null );
            }
         } else {
            logger.error( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + entity + " Unknown type: " + obj.getClass().getName() );
         }
      }
   }

   private void checkSetValue( EntityInstance ei, String entity, String attribute, String valueNew ) {
      String valueOld = ei.getAttribute( attribute ).getString();
      if ( valueOld.equals( valueNew ) == false ) { // if the value has changed ...
      // logger.info( "Changing entity.attribute: " + entity + "." + attribute + ": " + valueOld + "  to: " + valueNew );
      // ei.logEntity( false );
         try {
         // logger.info( "AfterChange entity.attribute: " + entity + "." + key + ": " + valueOld + "  to: " + valueNew );
            ei.getAttribute( attribute ).setValue( valueNew );
         // ei.logEntity( false );
         } catch ( ZeidonException ze ) {
            if ( attribute.startsWith( "FK_ID_" ) || attribute.startsWith( "FKID" ) || attribute.startsWith( "AUTOSEQ" ) ||
                 attribute.startsWith( "BD_ID_" ) || attribute.startsWith( "BG_ID_" ) ) {
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

   // The difference between classes zeidon and zeidon-special is that zeidon-special is an extra block entity based on the block type of the current block.
   // When we switch to or from a special block category, we need to keep the block's data in sync with the special block data so that the UI works properly.
   // The functions mapToSpecialBlockFromBlock and mapFromSpecialBlockToBlock perform this synchronization using the attributes defined in g_SpecialBlockAttrList.
   // This list needs to be kept in sync between labeldesigner.js and GraphicalLabelDesignerServlet.java.
   private static final String[] g_SpecialBlockAttrList =
               new String[] { "TextColor", "TextColorOverride",
                              "FontFamily", "FontSize", "FontWeight", "CapitalizeTitleTextFlag",
                              "Margin", "MarginTop", "MarginLeft", "MarginBottom", "MarginRight", "MarginOverride",
                              "Border", "BorderTop", "BorderBottom", "BorderLeft", "BorderRight", "BorderOverride",
                              "Padding", "PaddingTop", "PaddingBottom", "PaddingLeft", "PaddingRight", "PaddingOverride",
                              "TitlePosition", "TextAlign", "TextLineHeight", "TextLetterSpace" };

   public static <T> boolean arrayContains( final T[] array, final T v ) {
      if ( v == null ) {
         for ( final T e : array )
            if ( e == null )
               return true;
      } else {
         for ( final T e : array )
            if ( e == v || v.equals(e) )
               return true;
      }

      return false;
   }

   private void applyJsonPropertiesToZeidonAttributes( View vLLD, View vBlock, JSONObject jsonObject, String entity, int depth, EntityInstance ei ) {
      if ( ei != null ) {
      // logger.info( "Apply Json Start" );
      // ei.logEntity( false );
         String entityDefName = ei.getEntityDef().getName();
         if ( entity.equals( entityDefName ) || (entity.equals( "LLD_Block" ) && entityDefName.equals( "LLD_SubBlock" )) ) {
         // Set<String> keys = (Set<String>) jsonObject.keySet(); // these two lines work, but cause
         // for ( String key : keys ) {                           // a warning ... replaced by next two lines
            for ( Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext(); ) {
               String key = (String) iterator.next();
               Object obj = jsonObject.get( key );
            // logger.info( "OTag: " + entity + "   Key: " + key + "   Depth: " + depth );
               if ( obj instanceof String ) {
                  String valueNew = (String) obj;
               // logger.info( StringUtils.repeat( " ", (depth + 2) * 3 ) + "E.Attr: " + entity + "." + key + " : " + valueNew );
                  if ( key.equals( "ID" ) == false &&  // attribute is not ID (which is immutable)
                       key.startsWith( "FK_ID_" ) == false && key.startsWith( "BD_ID_" ) == false && key.startsWith( "TX_ID_" ) == false && key.startsWith( "AUTOSEQ" ) == false ) {
                     // This is where we need to handle special entity/attributes such as: z_^marketing.^text.^font^weight - which
                     // should be mapped to the "Marketing" LLD_SpecialSectionAttribute entity and the "Text" LLD_SpecialSectionAttrBlock
                     // entity FontWeight attribute ... e.g. DirectionsForUse.Title.z_MarginTop
                  // int idx1 = key.indexOf( "." );
                  // int idx1 = g_SpecialBlockAttrList..indexOf( "." );
                  // if ( idx1 >= 0 ) {
                     if ( key.charAt( 0 ) == '_' ) {  // attribute is a label designer work (starts with '_')
                        if ( key.equals( "_pTag" ) && entity.equals( "LLD_SpecialSectionAttribute" ) ) {
                           EntityCursor ec = vBlock.cursor( "LLD_Block" );
                           String blockTag = ec.getAttribute( "Tag" ).getString();
                           if ( blockTag.equals( valueNew ) == false ) {
                              String msg = "Entity: LLD_SpecialSectionAttribute Tag: " + valueNew + "   does not match LLD_Block Tag: " + blockTag;
                              logger.error( msg );
                              throw new ZeidonException( msg );
                           }
                        }
                     } else {
                        boolean bSpecial = entity.equals( "LLD_SpecialSectionAttrBlock" );
                        if ( entity.equals( "LLD_SpecialSectionAttribute" ) ) {
                        // logger.info( "Entity: LLD_SpecialSectionAttribute   key: " + key + "   value: " + valueNew );
                        } else if ( entity.equals( "LLD_Block" ) || bSpecial ) {
                        // logger.info( "Entity: " + entity + "   key: " + key + "   value: " + valueNew );
                           if ( arrayContains( g_SpecialBlockAttrList, key ) ) {
                           // logger.info( "Entity: " + entity + "   FOUND key: " + key );
                              if ( ! bSpecial ) {
                                 continue;  // skip this attribute for block
                              }
                           } else {
                           // logger.info( "Entity: " + entity + "   NOT FOUND key: " + key );
                              if ( bSpecial ) {
                                 continue;  // skip this attribute
                              }
                           }
                        }
                     /*
                     // String blockType = key.substring( 0, idx1 ); // e.g. DirectionsForUse
                     // idx1++;
                     // int idx2 = key.indexOf( ".z_", idx1 );
                     // if ( idx2 >= 0 ) {
                     //    String blockType = key.substring( idx1, idx2 ); // e.g. Title
                     //    String attribute = key.substring( idx2 + 3 ); // e.g. MarginTop
                           String attribute = key;
                           String blockType = 
                           EntityCursor ec = vBlock.cursor( "LLD_SpecialSectionAttribute" );
                           if ( attribute.equals( "ID" ) == false ) {
                              CursorResult cr = ec.setFirst( "Name", blockType );
                              if ( cr.isSet() == false ) {
                                 ec.createEntity();
                                 ec.getAttribute( "Name" ).setValue( blockType );
                              }
                              ec = vBlock.cursor( "LLD_SpecialSectionAttrBlock" );
                              cr = ec.setFirst( "LLD_BlockType", blockType );
                              if ( cr.isSet() == false ) {
                                 cr = ec.setFirst();
                                 if ( cr.isSet() == false ) {
                                    ec.createEntity();
                                 }
                                 ec.getAttribute( "LLD_BlockType" ).setValue( blockType );
                              }
                     */
                        if ( ((key.equals( "BackgroundColor" ) || key.equals( "BorderColor" )) && bSpecial == false) ||
                              (key.equals( "TextColor" ) && bSpecial) ) { // we need to include the color entity
                        // logger.info( key + " E.Attr: " + entity + "." + key + " : " + valueNew );
                           EntityCursor ec = vBlock.cursor( entity );
                           ec.getAttribute( key ).setValue( valueNew );
                           String colorEntity;
                           if ( bSpecial ) {
                              colorEntity = "SpecialAttributeTextColor";
                           } else if ( entity.contains( "Block" ) ) {
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
      // logger.info( "Apply Json End" );
      // ei.logEntity( false );
      }
   }

   private void applyJsonLabelArrayToView( View vLLD, View vBlock, JSONObject jsonObject, String entity, int depth, EntityInstance ei ) {
/* start debug code
      boolean log = false;
      if ( ei != null ) {
         Object o = jsonObject.get( "ID" );
         if ( o instanceof String ) {
            String ID = (String)o;
            if ( ID.equals( "626" ) ) {
               log = true;
               logger.info( "Before Setting entity: " + entity + "  ID: " + ID );
               ei.logEntity( false );
            }
         }
      }
end debug code */
   // Set<String> keys = (Set<String>) jsonObject.keySet(); // these two lines work, but cause
   // for ( String key : keys ) {                           // a warning ... replaced by next two lines
      for ( Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext(); ) {
         String key = (String) iterator.next();
      // logger.info( "OTag: " + entity + "   Key: " + key + "   Depth: " + depth );
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
            } else if ( key.equals( "LLD_Page" ) ) {
               depth = 0;
            } else if ( key.equals( "LLD_Panel" ) ) {
               depth = 1;
            }

            String entityName = key.equals( "LLD_SubBlock" ) ? "LLD_Block" : key;
         // logger.info( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Entity: " + key + " Depth: " + (depth + 1) );
            processJsonArray( vLLD, vBlock, ja, entityName, depth );
         } else if ( obj instanceof JSONObject ) {
         // logger.info( StringUtils.repeat( " ", (depth + 2) * 3 ) + "MetaOI: " + key + " Skipped!" );
         // applyJsonLabelArrayToView( vLLD, vBlock, (JSONObject)obj, key, depth + 1, null );
         } else {
            logger.error( StringUtils.repeat( " ", (depth + 2) * 3 ) + "Key: " + key + "  Unknown type: " + obj.getClass().getName() );
         }
      }
/* start debug code
      if ( log ) {
         logger.info( "After Setting entity: " + entity + "  ID: " + "626" );
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
         // logger.info( ">>>>>>>>>>>>> Raw Post Character: " + rc );
            if ( rc >= 0 )
               os.write( buf, 0, rc );
         }
         String s = new String( os.toByteArray(), "UTF-8" );
      // logger.info( ">>>>>>>>>>>>> Raw Post Data: " + s );
      // logger.info( "=================================" );
         decoded = URLDecoder.decode( s, "UTF-8" );
      // logger.info( ">>>>>>>>>>>>> DECODED Post Data: " + decoded );
      // logger.info( "=================================" );
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
               logger.info( "View path set to Entity.Tag ================>>> " + entity + "." + tag );
            // ec.logEntity( false );
               if ( idx2 < entityTagList.length() - 1 ) {
                  idx2++;
                  ec = setPathCursorPosition( vLLD, entityTagList, idx2, depth + 1 );
               }
            } else {
               logger.info( "Could not set cursor for Entity.Tag: " + entity + "." + tag );
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
                  // logger.info( "PositionByKey set to Entity.Tag ================>>> " + entity + "." + tag );
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
         ecb.getAttribute( "LLD_BlockType" ).setValue( ec.getAttribute( "LLD_BlockType" ) );

         ecb = mBlockRU.getCursor( "Subregistrant" );
         ecb.includeSubobject( vLLD.getCursor( "Subregistrant" ) );
         copyBlockToReuse( vLLD, vBlockCopy, mBlockRU );
      // logger.info( "Reusable Block OI: " );
      // mBlockRU.logObjectInstance();
         mBlockRU.commit();
         mBlockRU.drop();
         vBlockCopy.drop();
         String jsonReuse = "{ \"ReusableBlocks\" : [ ";
         ec = vLLD.cursor( "ReusableBlockDefinition" );
         ec.orderEntities( "LLD_BlockType A Name A" );
         cr = ec.setFirst();
         while ( cr.isSet() ) {
            jsonReuse += " { \"LLD_BlockType\" : \"" + ec.getAttribute( "LLD_BlockType" ).getString() +
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
      String tag = "RB_" + ec.getAttribute( "Tag" ).getString();
      ec.getAttribute( "Tag" ).setValue( tag );
      ec.getAttribute( "wID" ).setValue( tag );
      ec.getAttribute( "wSyncId" ).setValue( g_SyncId++ );
   // ec.getAttribute( "ID" ).setValue( -g_SyncId );  don't do this since the ID cannot be reset back to null
   // ec.getAttribute( "ID" ).setValue( null );
   //xec.logEntity( false );
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
            // logger.info( "Reusable Block Entity: " );
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
   // logger.info( "=========================================>>>>>>>>>>>>>>>>>>>>>>>>>>> Graphical Designer Servlet Task Id: " + taskId );
   // Application zeidonTools = epamms.getApplication( "Zeidon_Tools" );
   // Task zeidonSystem = oe.getSystemTask();
      String action = request.getParameter( "action" );
      logger.info( "Post ePamms action: " + action );
      String viewName = request.getParameter( "viewName" );
      View vLLD = epamms.getViewByName( viewName );
   // if ( vLLD != null ) {
   //    logger.info( "vLLD OI: " );
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
               // logger.info( "Setting view path: " + viewPath );
                  String elementKey = request.getParameter( "elementKey" );
               // logger.info( "Setting cursor for element key: " + elementKey );
               // EntityCursor ec = setPathCursorPosition( mSPLDefBlock, viewPath, 0, 0 );
                  EntityCursor ec = setPositionByKey( mSPLDefBlock, elementKey );
               // logger.info( "Finished setting view path: " + viewPath );
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
               logger.error( "Error processing Save Reusable Block: " + ze.getMessage() );
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
            String strJson = jsonPost.toJSONString();
            logger.info( "Save JSON: " + strJson );
            try {
               vLLD.resetSubobjectTop();
               vBlock = vLLD.newView();
               vBlock.resetSubobjectTop();
            //xlogger.info( "Before Apply Json to OI" );
            //xdisplaySPLD( vLLD, null, "" );
               applyJsonLabelArrayToView( vLLD, vBlock, jsonPost, "", -2, null );  // OIs, SPLD_LLD, depth == 0 for LLD_Page
               vLLD.resetSubobjectTop();
               vLLD.setName( "mSPLDefPanel", Level.TASK );
            //xlogger.info( "After Apply Json to OI" );
            //xdisplaySPLD( vLLD, null, "" );
               // Sort the blocks
               CursorResult cr = vLLD.cursor( "LLD_Panel" ).setFirst();
               while ( cr.isSet() ) {
                  sortBlocks( vLLD );
                  cr = vLLD.cursor( "LLD_Panel" ).setNext();
               }
            // logger.info( "After Sort Blocks LLD OI: " );
            // displaySPLD( vLLD, null, "" );
            // vLLD.logObjectInstance();
            // logger.info( "Saved JSON to OI" );
               if ( action.equals( "saveLabelCommit" ) ) {
                  EntityCursor ec = vLLD.cursor( "LLD_SpecialSectionAttribute" );
                  cr = ec.setFirstWithinOi();
                  while ( cr.isSet() ) {
                     EntityCursor ec2 = vLLD.cursor( "LLD_SpecialSectionAttrBlock" );
                     if ( ec2.hasAny() == false ) {
                        logger.info( "Deleting : LLD_SpecialSectionAttribute" );
                        ec.logEntity( true );
                        ec.deleteEntity( CursorPosition.NONE );
                     }
                     cr = ec.setNextWithinOi();
                  }
                  vLLD.resetSubobjectTop();
               // logger.info( "Before commit LLD OI: " );
               // displaySPLD( vLLD, null, "" );
                  vLLD.commit();
               // logger.info( "After commit LLD OI: " );
               // displaySPLD( vLLD, null, "" );
               }
               if ( action.equals( "saveLabelRefresh" ) || action.equals( "saveReusableBlock" ) || action.equals( "applyReusableBlock" ) ) {
                  if ( action.equals( "saveReusableBlock" ) || action.equals( "applyReusableBlock" ) ) {
                     String blockTag = request.getParameter( "blockTag" );
                     String blockName = request.getParameter( "blockName" );
                     String parms = request.getParameter( "parms" );
                     applyReusableBlock( vLLD, vBlock, blockTag, blockName, parms );
                  //xlogger.info( "After saveReusableBlock" + blockName );
                  //xdisplaySPLD( vLLD, null, "" );
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
               // logger.info( "After RefreshLabel" );
               // vLLD.logObjectInstance();
                  jsonLabel = convertLLD_ToJSON( vLLD );
               // logger.info( "Completed refresh Json Label: " + jsonLabel );
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
            logger.error( "Null LLD ... skipped processing Json Label: " + jsonLabel );
            response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
            response.getWriter().write( new Gson().toJson( "{}" ) );
         }
      } else if ( action.equals( "loadLabel" ) ) {
      // We are just going to get the SPLD_LLD and its children and rename SPLD_LLD to LLD
         try {
         // logger.info( "LoadLabel OI: " );
         // displaySPLD( vLLD, null, "" );
         // vLLD.logObjectInstance();
            jsonLabel = convertLLD_ToJSON( vLLD );
         // logger.info( "LoadLabel JSON: " + jsonLabel );
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
      // logger.info( "LLD XOD: " + sb.toString() );
         StringBuffer oea = getSkeletalLodEntities( sb );
      // logger.info( "LLD ER: " + oea.toString() );
         response.setContentType( "text/json" );
         // response.getWriter().write( jsonLabel );
         response.getWriter().write( new Gson().toJson( oea.toString() ) );
      } else if ( action.equals( "sethazardpanel" ) ) {
         String location = request.getParameter( "location" );
         EntityCursor ec = vLLD.cursor( "SPLD_HumanHazardSection" );
      // logger.info( "Set Hazard Panel Location: " + location );
         ec.getAttribute( "PanelLoc" ).setValue( location );
         response.setContentType( "text/json" );
         response.getWriter().write( new Gson().toJson( "{}" ) );
      } else if ( action.equals( "sethazardlabel" ) ) {
         String location = request.getParameter( "location" );
         EntityCursor ec = vLLD.cursor( "SPLD_HumanHazardSection" );
      // logger.info( "Set Hazard Label Location: " + location );
         ec.getAttribute( "LabelLoc" ).setValue( location );
         response.setContentType( "text/json" );
         response.getWriter().write( new Gson().toJson( "{}" ) );
      } else {
         //nothing to show
         response.setStatus( HttpServletResponse.SC_NO_CONTENT );
      }
   }
}
