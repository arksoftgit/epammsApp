//start mSPLDef 2017.06.26 09:51:26
zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_Label( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_FormatPrintIcons( zVIEW vViewToInstance0,
                           zLONG llFile1,
                           zPCHAR pchszWriteBuffer2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_FormatContinueBlock( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPanel1,
                              zLONG llFile2,
                              zPCHAR pchszPassedBlanks3,
                              zPCHAR pchszWriteBuffer4,
                              zPCHAR pchContinueType5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_ProcessPDF_Blocks( zVIEW vViewToInstance0,
                            zVIEW vmSPLDefPanel1,
                            zVIEW vmSPLDefContinuation2,
                            zLONG llFile3,
                            zPCHAR pchszPassedBlanks4,
                            zPCHAR pchszWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_DFU( zVIEW vViewToInstance0,
                          zVIEW vmSPLDefPDF1,
                          zLONG llFile2,
                          zPCHAR pchszSectionType3,
                          zPCHAR pchSTRING32szSPLD_Secti4,
                          zPCHAR pchszStatementName5,
                          zPCHAR pchszUsageName6,
                          zPCHAR pchszUsageNameScope7,
                          zPCHAR pchLeadingBlanks8,
                          zPCHAR pchWriteBuffer9 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_ClmList( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPDF1,
                              zLONG liFile2,
                              zPCHAR pchszSectionType3,
                              zPCHAR pchszLeadingBlanks4,
                              zPCHAR pchWriteBuffer5,
                              zLONG lNumberOfColumns6 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_Ingred( zVIEW vViewToInstance0,
                             zVIEW vmSPLDefPDF1,
                             zLONG llFile2,
                             zPCHAR pchszSectionType3,
                             zPCHAR pchszLeadingBlanks4,
                             zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_Content( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPDF1,
                              zLONG llFile2,
                              zPCHAR pchszSectionType3,
                              zPCHAR pchszLeadingBlanks4,
                              zPCHAR pchszWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_Hazards( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPDF1,
                              zLONG llFile2,
                              zPCHAR pchszSectionType3,
                              zPCHAR pchszLeadingBlanks4,
                              zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_General( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPDF1,
                              zLONG llFile2,
                              zPCHAR pchszLeadingBlanks3,
                              zPCHAR pchWriteBuffer4 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_StorDisp( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchSectionType3,
                               zPCHAR pchszLeadingBlanks4,
                               zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GeneratePDF_EPA_Reg( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPDF1,
                              zLONG llFile2,
                              zPCHAR pchszSectionType3,
                              zPCHAR pchszLeadingBlanks4,
                              zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_BuildSPLD_FromSLC( zVIEW vViewToInstance0,
                            zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_RebuildSPLD_FromSLC( zVIEW vNewSPLD0,
                              zVIEW vSourceSLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_DuplicateSPLD( zVIEW vNewSPLD0,
                        zVIEW vSourceSPLD1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_DuplicateSPLD_Block( zVIEW vNewSPLD0,
                              zVIEW vSourceSPLD1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_FormatBlockContainer( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefRoot1,
                               zLONG llFile2,
                               zPCHAR pchLeadingBlanks3,
                               zPCHAR pchWriteBuffer4,
                               zPCHAR pchszTopPosition5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_FormatBlock( zVIEW vmSPLDef0,
                      zLONG llFile1,
                      zPCHAR pchszLeadingBlanks2,
                      zPCHAR pchszWriteBuffer3 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_AddFormatToSpecialText( zVIEW vViewToInstance0,
                                 zPCHAR pchszSectionType1,
                                 zPCHAR pchVariableName2,
                                 zPCHAR pchWriteBuffer3 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_GenerateXML_File( zVIEW vmSPLDef0,
                           zPCHAR pchszTopEntityName1,
                           zPCHAR pchszDirectoryAndFileNa2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_SetUpFormattingSelect( zVIEW vViewToInstance0,
                                zPCHAR pchSectionType1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_ComputeTopPositions( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_ObjectConstraints( zVIEW vViewtoInstance0,
                            zSHORT nEvent1,
                            zSHORT nState2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_BuildUsageEntriesFrSLC( zVIEW vViewToInstance0,
                                 zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_CheckAddKeywordEntry( zVIEW vViewToInstance0,
                               zPCHAR pchszSectionType1,
                               zPCHAR pchszKeywordName2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_SetUpKeywordEntries( zVIEW vViewToInstance0,
                              zPCHAR pchszSectionType1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_BuildSPLD_FromSPLD( zVIEW vViewToInstance0,
                             zVIEW vPreviousSPLD1,
                             zVIEW vSourceSLC2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_ComputeTopPosRecursive( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_TraverseBlockRecursive( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef_TraverseBlocks( zVIEW vViewToInstance0 );

//end
//start mTempl 2014.04.11 13:18:24
zOPER_EXPORT zSHORT OPERATION
omTempl_BuildDisplayStructure( zVIEW vViewToInstance0 );

//end
//start mMasLC 2017.06.26 11:30:03
zOPER_EXPORT zSHORT OPERATION
omMasLC_MergeUsageSelectEnts( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildNewMLC_Version( zVIEW vViewToInstance0,
                             zVIEW vPreviousMLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_CopyMLCToNewProduct( zVIEW vTargetMLC0,
                             zVIEW vSourceMLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_ObjectConstraints( zVIEW vViewtoInstance0,
                           zSHORT nEvent1,
                           zSHORT nState2 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildCompEntriesForMLC( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildFullCompEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildCompEntsWO_Usage( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildUsageSelectEnts( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildUsageWorkEnts( zVIEW vViewToInstance0,
                            zPCHAR pchDirUseOrMarketingTyp1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_SetMLC_SelectedFlags( zVIEW vViewToInstance0,
                              zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildUsageGroupEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildUsageKeyEntries( zVIEW vViewToInstance0,
                              zPCHAR pchSourceKeywordEntityN1,
                              zPCHAR pchSourceTextEntityName2,
                              zPCHAR pchTextValue3,
                              zPCHAR pchTitleValue4 );

zOPER_EXPORT zSHORT OPERATION
omMasLC_BuildNonGroupEntries( zVIEW vViewToInstance0 );

//end
//start mSubLC 2017.06.26 09:51:27
zOPER_EXPORT zSHORT OPERATION
omSubLC_BuildNewSLC_Version( zVIEW vViewToInstance0,
                             zVIEW vOriginalSLC1,
                             zVIEW vNewMLC2,
                             zVIEW vPreviousMLC3 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_DuplicateSLC( zVIEW vNewSLC0,
                      zVIEW vPreviousSLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_BuildSLC_FromMLC( zVIEW vViewToInstance0,
                          zVIEW vSourceMLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_BuildDirsForUseSects( zVIEW vNewSLC0,
                              zVIEW vSourceMLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_BuildCompEntriesForSLC( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_BuildUsageWorkEnts( zVIEW vmSubLC0,
                            zPCHAR pchszDirUseOrMarketingT1 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_RefreshSLC_FromMLC( zVIEW vViewToInstance0,
                            zVIEW vmMasLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_BuildWorkVariables( zVIEW vViewToInstance0,
                            zVIEW vmMasLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_CopyDirsForUseSection( zVIEW vViewToInstance0,
                               zVIEW vmMLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubLC_ObjectConstraints( zVIEW vViewtoInstance0,
                           zSHORT nEvent1,
                           zSHORT nState2 );

//end
//start DOMAINT 2017.06.26 09:51:05
zOPER_EXPORT zSHORT OPERATION
oDOMAINT_ActivateDomainList( zPVIEW vViewToInstance0,
                             zVIEW vViewToWindow1 );

zOPER_EXPORT zSHORT OPERATION
oDOMAINT_PreloadSystemDomainsR( zPVIEW vViewToInstance0,
                                zVIEW vAnyReferenceView1,
                                zPCHAR pchInstallApp2 );

zOPER_EXPORT zSHORT OPERATION
oDOMAINT_PreloadSystemDomainsO( zPVIEW vViewToInstance0,
                                zVIEW vAnyReferenceView1,
                                zPCHAR pchInstallApp2 );

zOPER_EXPORT zSHORT OPERATION
oDOMAINT_PreloadSystemDomains( zVIEW vViewToInstance0,
                               zVIEW vAnyRefView1,
                               zPCHAR pchInstallApp2 );

//end
//start lMLCATgt 2017.06.26 09:51:06
zOPER_EXPORT zSHORT OPERATION
olMLCATgt_BuildDifferencesMLC( zVIEW vViewToInstance0,
                               zVIEW vSourceCompareObject1 );

zOPER_EXPORT zSHORT OPERATION
olMLCATgt_BuildDifferencesSLC( zVIEW vViewToInstance0,
                               zVIEW vlMLCASrc1,
                               zVIEW vlSLCAnal2 );

zOPER_EXPORT zSHORT OPERATION
olMLCATgt_SetDifferencesSortVs( zVIEW vlMLCATgt0,
                                zLONG llSortNbr1,
                                zPCHAR pchszTitle2 );

zOPER_EXPORT zSHORT OPERATION
olMLCATgt_DeleteEmptyTitles( zVIEW vViewToInstance0 );

//end
//start ZGlobal1 2016.12.28 13:16:30
zOPER_EXPORT zSHORT OPERATION
ConvertLineToEntity( zVIEW vEntityView0,
                     zVIEW vXOD_View1,
                     zPCHAR pchRecordArea2,
                     zPCHAR pchDelimiterType3,
                     zLONG lMaxRecordLth4 );

zOPER_EXPORT zSHORT OPERATION
RemovePairedCharactersFromString( zPCHAR pchString0,
                                  zPCHAR pchOpenChar1,
                                  zPCHAR pchCloseChar2,
                                  zPCHAR pchEnclosingOnly3 );

zOPER_EXPORT zSHORT OPERATION
ConvertHtmlEntities( zPCHAR pchStringToBeConverted0 );

zOPER_EXPORT zVOID OPERATION
ParseStatementForKeywords( zVIEW vmMasLC0,
                           zPCHAR eStatementEntity1,
                           zPCHAR aStatementAttribute2,
                           zPCHAR pchKeywordEntity3,
                           zPCHAR pchKeywordTextEntity4,
                           zPCHAR pchKeywordSemaphore5 );

zOPER_EXPORT zSHORT OPERATION
GenerateKeywordTextIntoString( zVIEW vKeywordEntityView0,
                               zPCHAR pchReturnedTextString1,
                               zPCHAR pchKeywordEntityName2,
                               zPCHAR pchKeywordTextEntityNam3,
                               zPCHAR pchSeparatorCharacters4 );

zOPER_EXPORT zVOID OPERATION
SetFirstCharacterCase( zPCHAR pchTargetString0,
                       zSHORT nUpperCase1 );

zOPER_EXPORT zSHORT OPERATION
DecipherUsageKeyword( zPCHAR pchFullUsage0,
                      zPCHAR pchOpenKeyword1,
                      zPCHAR pchCloseKeyword2,
                      zPCHAR pchKeyword3,
                      zSHORT nMaxKeywordLth4,
                      zPCHAR pchKeyValue5,
                      zSHORT nMaxKeyValueLth6 );

zOPER_EXPORT zVOID OPERATION
InsertOptionalSubUsages( zVIEW vmMasLC0,
                         zPCHAR pchReturnFormatted1,
                         zPCHAR pchEntity2,
                         zSHORT nbInsertBraces3 );

zOPER_EXPORT zSHORT OPERATION
InsertKeywordsIntoString( zVIEW vmSPLDef0,
                          zPCHAR pchszString1,
                          zPCHAR pchszUsageEntityName2,
                          zPCHAR pchszUsageNameScope3,
                          zPCHAR pchszSeparaterCharacter4 );

zOPER_EXPORT zSHORT OPERATION
BuildSimpleIntegerQualification( zVIEW vvSubtask0,
                                 zPVIEW vvQualificationObject1,
                                 zPCHAR pchEntityName2,
                                 zPCHAR pchKeyAttributeName3,
                                 zLONG lKeyAttributeValue4,
                                 zPCHAR pchComparator5 );

zOPER_EXPORT zSHORT OPERATION
BuildSimpleStringQualification( zVIEW vvSubtask0,
                                zPVIEW vvQualificationObject1,
                                zPCHAR pchEntityName2,
                                zPCHAR pchKeyAttributeName3,
                                zPCHAR pchKeyAttributeValue4,
                                zPCHAR pchComparator5 );

zOPER_EXPORT zSHORT OPERATION
SplitParagraphOnLinefeed( zPCHAR pchMultiLineText0,
                          zVIEW vTargetView1,
                          zPCHAR pchTargetEntityName2,
                          zPCHAR pchTargetAttributeName3,
                          zPCHAR pchdelimiters4 );

zOPER_EXPORT zSHORT OPERATION
DetermineNextVersion( zPCHAR pchReturnVersion0,
                      zVIEW vVersionListView1,
                      zPCHAR eVersionEntity2,
                      zPCHAR aVersionAttribute3 );

zOPER_EXPORT zSHORT OPERATION
SeparateNumberedStatement( zPCHAR pchOriginalStatement0,
                           zPLONG llMaxLth1,
                           zPCHAR pchNumberedText2 );

zOPER_EXPORT zSHORT OPERATION
WL_QC( zVIEW vAnyView0,
       zLONG llFile1,
       zPCHAR pchWriteBuffer2,
       zPCHAR pchDoubleQuoteExhangeCh3,
       zSHORT nExtraSpaceFlag4 );

zOPER_EXPORT zSHORT OPERATION
PositionOnEntityByZID( zVIEW vLDD0,
                       zPCHAR pchzid1 );

zOPER_EXPORT zSHORT OPERATION
InsertOI_DataIntoEmailTemplate( zVIEW vViewToWindow0,
                                zVIEW vMapObject1,
                                zPCHAR pchSMTPServer2,
                                zPCHAR pchEMailUserName3,
                                zPCHAR pchEMailPassword4,
                                zPCHAR pchSenderEMailAddress5,
                                zPCHAR pchSubjectLine6,
                                zPCHAR pchAttachmentFileName7,
                                zPCHAR pchTemplateFileName8,
                                zPCHAR pchpchAltFileName9,
                                zPCHAR pchRootEntityName10,
                                zLONG lFlag1HasAttachment2HTML11 );

zOPER_EXPORT zSHORT OPERATION
GetRTFPath( zVIEW vViewToSubTask0,
            zLONG lFlags1,
            zPCHAR pchszTargetPath2 );

zOPER_EXPORT zSHORT OPERATION
ParseBooleanExpression( zVIEW vzqFrame0 );

zOPER_EXPORT zSHORT OPERATION
WinShellExecute( zVIEW vViewSubTask0,
                 zPCHAR pchszFileOrExeName1,
                 zPCHAR pchszFileOpenCommand2,
                 zPCHAR pchszExeParms3 );

zOPER_EXPORT zSHORT OPERATION
GetGeneralPath( zVIEW vViewToSubTask0,
                zLONG lFlags1,
                zPCHAR pchszFileTyoe2,
                zPCHAR pchszTargetPath3 );

zOPER_EXPORT zSHORT OPERATION
DBQualEntityByString( zVIEW vvQualView0,
                      zPCHAR pchszEntityName1,
                      zPCHAR pchszAttributeName2,
                      zPCHAR pchszOper3,
                      zPCHAR pchszValue4,
                      zLONG lExists5 );

zOPER_EXPORT zSHORT OPERATION
GetCurrentApplicationName( zPCHAR pchReturnedString0,
                           zLONG lMaximumLength1,
                           zVIEW vViewToWindow2 );

zOPER_EXPORT zLONG OPERATION
ReadLine5000( zVIEW vViewToWindow0,
              zPCHAR pchLineBuffer1,
              zLONG llFileHandle2 );

zOPER_EXPORT zSHORT OPERATION
InsertOI_DataIntoTemplateFile( zVIEW vViewToWindow0,
                               zVIEW vMapObject1,
                               zPCHAR pchOutputFileName2,
                               zPCHAR pchTemplateFileName3,
                               zPCHAR pchpchAltFileName4,
                               zPCHAR pchRootEntityName5 );

zOPER_EXPORT zSHORT OPERATION
GetDataTypeForAttribute( zPCHAR pchDataType0,
                         zVIEW vObjectView1,
                         zPCHAR pchEntityName2,
                         zPCHAR pchAttributeName3 );

zOPER_EXPORT zSHORT OPERATION
AddSpacesToString( zPCHAR pchWorkString0 );

zOPER_EXPORT zSHORT OPERATION
FindStringInAttribute( zPCHAR pchSearchString0,
                       zVIEW vObjectView1,
                       zPCHAR pchEntityName2,
                       zPCHAR pchAttributeName3 );

zOPER_EXPORT zSHORT OPERATION
ConvertExternalValueOfAttribute( zPCHAR pchSearchValue0,
                                 zPCHAR pchInputSearchValue1,
                                 zVIEW vQueryView2,
                                 zPCHAR pchQueryEntityName3,
                                 zPCHAR pchQueryAttributeName4 );

zOPER_EXPORT zSHORT OPERATION
GetHTMLPath( zVIEW vViewToSubtask0,
             zLONG lnFlag1,
             zPCHAR pchTarget2 );

zOPER_EXPORT zSHORT OPERATION
GetRegistryCLSID( zPCHAR pchReturnData0,
                  zPCHAR pchszClassName1 );

zOPER_EXPORT zSHORT OPERATION
GetImagingPath( zVIEW vViewToSubtask0,
                zLONG lnFlag1,
                zPCHAR pchTarget2 );

zOPER_EXPORT zSHORT OPERATION
AGetRegistryValue( zPCHAR pchszResult0,
                   zPCHAR pchszKey1 );

zOPER_EXPORT zLONG OPERATION
CallObjectOperation( zPVIEW vViewToObject0,
                     zVIEW vvSubtask1,
                     zPCHAR pchszObjectName2,
                     zPCHAR pchszOperationName3 );

zOPER_EXPORT zLONG OPERATION
GetWindowsUserName( zPCHAR pchUserName0,
                    zLONG lMaxLengthOfName1 );

zOPER_EXPORT zSHORT OPERATION
RemoveLeadingBlanksFromAttrib( zVIEW vView0,
                               zPCHAR pchEntityName1,
                               zPCHAR pchAttributeName2 );

zOPER_EXPORT zLONG OPERATION
GetButtonHeaderName( zVIEW vViewToWindow0,
                     zPCHAR pchButtonHeaderName1 );

zOPER_EXPORT zSHORT OPERATION
AddMonthsToDate( zVIEW vTargetView0,
                 zPCHAR pchTargetEntityName1,
                 zPCHAR pchTargetAttributeName2,
                 zLONG lNumberOfMonths3 );

zOPER_EXPORT zLONG OPERATION
SetDecimalPrecisionRounded( zPDECIMAL mDecimalValue0,
                            zLONG lNumberOfDecimals1 );

zOPER_EXPORT zSHORT OPERATION
zTrim( zPCHAR pchStringInOut0 );

zOPER_EXPORT zSHORT OPERATION
PersonName_FirstMiddleLast( zVIEW vvAnyObject0,
                            zPVOID oszInternalEntityStruct1,
                            zPVOID oszInternalAttribStruct2,
                            zSHORT nnGetOrSetFlag3 );

zOPER_EXPORT zSHORT OPERATION
PersonName_LastFirstMiddle( zVIEW vvAnyObject0,
                            zPVOID oszInternalEntityStruct1,
                            zPVOID oszInternalAttribStruct2,
                            zSHORT nnGetOrSetFlag3 );

zOPER_EXPORT zSHORT OPERATION
GetAttribNameFromStructure( zPVOID oInternalAttribStructur0,
                            zPCHAR pchAttribName1 );

zOPER_EXPORT zSHORT OPERATION
dAdressLabelFull( zVIEW vvAnyObject0,
                  zPVOID oszInternalEntityStruct1,
                  zPVOID oszInternalAttribStruct2,
                  zSHORT nnGetOrSetFlag3 );

zOPER_EXPORT zSHORT OPERATION
dAdressLabel( zVIEW vvAnyObject0,
              zPVOID oszInternalEntityStruct1,
              zPVOID oszInternalAttribStruct2,
              zSHORT nnGetOrSetFlag3 );

zOPER_EXPORT zSHORT OPERATION
GetEntityNameFromStructure( zPVOID oInternalEntityStructur0,
                            zPCHAR pchEntityName1 );

zOPER_EXPORT zSHORT OPERATION
AddressFormatToMultiLine( zPCHAR pchMultiLineAddress0,
                          zPCHAR pchLine11,
                          zPCHAR pchLine22,
                          zPCHAR pchLine33,
                          zPCHAR pchCity4,
                          zPCHAR pchState5,
                          zPCHAR pchPostalCode6 );

zOPER_EXPORT zSHORT OPERATION
GetViewFromBlobAttribute( zPVIEW vRetrievedView0,
                          zVIEW vOI_View1,
                          zPCHAR pchOI_EntityName2,
                          zPCHAR pchOI_AttributeName3 );

zOPER_EXPORT zSHORT OPERATION
SetBlobAttributeFromView( zVIEW vOI_View0,
                          zPCHAR pchOI_EntityName1,
                          zPCHAR pchOI_AttributeName2,
                          zVIEW vViewToSet3 );

zOPER_EXPORT zSHORT OPERATION
SeparateName( zPCHAR pchFullName0,
              zPCHAR pchFirstName1,
              zPCHAR pchLastName2 );

zOPER_EXPORT zSHORT OPERATION
ReadLineIntoGlobalBuffer( zVIEW vViewToWindow0,
                          zLONG lhFile1 );

zOPER_EXPORT zSHORT OPERATION
SetAttributeFromTabField( zVIEW vCustomerView0,
                          zPCHAR pchEntityName1,
                          zPCHAR pchAttributeName2,
                          zLONG lFieldPosition3 );

zOPER_EXPORT zSHORT OPERATION
AddDaysToDate( zVIEW vTargetView0,
               zPCHAR pchTargetEntityName1,
               zPCHAR pchTargetAttributeName2,
               zLONG lNumberOfDays3 );

zOPER_EXPORT zSHORT OPERATION
ActivateWorkObjectFromFile( zPVIEW vWorkView0,
                            zPCHAR pchszFileName1,
                            zPCHAR pchszLOD_Name2,
                            zVIEW vViewToWindow3 );

zOPER_EXPORT zSHORT OPERATION
CompareAttributeByShortString( zVIEW vView0,
                               zPCHAR pchEntityName1,
                               zPCHAR pchAttributeName2,
                               zPCHAR pchszCompareString3 );

zOPER_EXPORT zSHORT OPERATION
AddWorkingDaysToDate( zVIEW vTargetView0,
                      zPCHAR pchTargetEntityName1,
                      zPCHAR pchTargetAttributeName2,
                      zLONG lNumberOfWorkingDays3 );

zOPER_EXPORT zSHORT OPERATION
GetDateAttributeDifferenceInDays( zPLONG lReturnedDays0,
                                  zVIEW vvSourceView1,
                                  zPCHAR pchSourceEntityName2,
                                  zPCHAR pchSourceAttributeName3,
                                  zVIEW vTargetView4,
                                  zPCHAR pchTargetEntityName5,
                                  zPCHAR pchTargetAttributeName6 );

zOPER_EXPORT zSHORT OPERATION
CharToCode( zPCHAR pchszStr0 );

zOPER_EXPORT zVOID OPERATION
CodeToChar( zPCHAR pchszStr0,
            zSHORT nsCode1 );

zOPER_EXPORT zDECIMAL OPERATION
StrToDecimal( zPCHAR pchszStr0 );

zOPER_EXPORT zDECIMAL OPERATION
DecimalSumOf( zVIEW vvView0,
              zPCHAR pchszEntityName1,
              zPCHAR pchszAttributeName2,
              zPCHAR pchszParentEntityName3 );

zOPER_EXPORT zLONG OPERATION
StrToInt( zPCHAR pchszStr0 );

zOPER_EXPORT zSHORT OPERATION
GetEnvVariable( zPCHAR pchszReturnWert0,
                zPCHAR pchszVariableName1,
                zSHORT nnMaxReturnLen2 );

zOPER_EXPORT zSHORT OPERATION
SetAttrFromStrByContext( zVIEW vView0,
                         zPCHAR eEntity1,
                         zPCHAR aAttribute2,
                         zPCHAR pchValue3,
                         zPCHAR pchContext4 );

zOPER_EXPORT zSHORT OPERATION
SetAttrFromIntByContext( zVIEW vView0,
                         zPCHAR eEntity1,
                         zPCHAR aAttribute2,
                         zLONG lValue3,
                         zPCHAR pchContext4 );

zOPER_EXPORT zSHORT OPERATION
AddToAttrFromIntByContext( zVIEW vView0,
                           zPCHAR eEntity1,
                           zPCHAR aAttribute2,
                           zLONG lValue3,
                           zPCHAR pchContext4 );

zOPER_EXPORT zSHORT OPERATION
GetStrFromAttrByContext( zPCHAR pchValue0,
                         zLONG lValueLen1,
                         zVIEW vView2,
                         zPCHAR eEntity3,
                         zPCHAR aAttribute4,
                         zPCHAR pchContext5 );

zOPER_EXPORT zSHORT OPERATION
GetIntFromAttrByContext( zPLONG lValue0,
                         zVIEW vView1,
                         zPCHAR eEntity2,
                         zPCHAR aAttribute3,
                         zPCHAR pchContext4 );

zOPER_EXPORT zSHORT OPERATION
SetCursorLatestEntity( zVIEW vView0,
                       zPCHAR pchEntityName1,
                       zPCHAR pchAttributeName2 );

zOPER_EXPORT zSHORT OPERATION
SetAttributeFromCurrentDateTime( zVIEW vView0,
                                 zPCHAR eEntityName1,
                                 zPCHAR aAttributeName2 );

//end
//start ZGlobalV 2014.03.26 19:06:58
zOPER_EXPORT zSHORT OPERATION
InitializeSLC_FromMLC( zVIEW vMasLC0,
                       zVIEW vSubLC1 );

zOPER_EXPORT zVOID OPERATION
BuildCompEntriesForSPLD( zVIEW vmSPLDef0 );

zOPER_EXPORT zSHORT OPERATION
GenerateKeywordTextIntoString( zVIEW vKeywordEntityView0,
                               zPCHAR pchReturnedTextString1,
                               zPCHAR pchKeywordEntityName2,
                               zPCHAR pchKeywordTextEntityNam3,
                               zPCHAR pchSeparatorCharacters4 );

zOPER_EXPORT zSHORT OPERATION
InsertKeywordsIntoString( zVIEW vmSPLDef0,
                              zPCHAR pchszString1,
                              zPCHAR pchszUsageEntityName2,
                              zPCHAR pchszUsageNameScope3,
                              zPCHAR pchszSeparaterCharacter4 );

zOPER_EXPORT zVOID OPERATION
SyncPhysicalLabel( zVIEW vmSPLDef0,
                   zVIEW vmSubLC1,
                   zSHORT nFlag2 );

zOPER_EXPORT zVOID OPERATION
CreateCurrentTemporalVersion( zVIEW vViewToWindow0,
                              zSHORT nPosition1,
                              zPCHAR pchViewName2,
                              zPCHAR eEntityName3,
                              zPCHAR pchComment4 );

zOPER_EXPORT zSHORT OPERATION
AcceptCurrentTemporalSubobject( zVIEW vViewToWindow0,
                                zSHORT nCommit1,
                                zPCHAR pchComment2 );

zOPER_EXPORT zSHORT OPERATION
CancelCurrentTemporalSubobject( zVIEW vViewToWindow0,
                                zPCHAR pchComment1 );

zOPER_EXPORT zSHORT OPERATION
SetDynamicBannerName( zVIEW vViewToWindow0,
                      zPCHAR pchDialogName1,
                      zPCHAR pchBannerName2 );

zOPER_EXPORT zSHORT OPERATION
InitializeSPLD_FromSLC( zVIEW vmSubLC0,
                        zVIEW vmSPLDef1 );

zOPER_EXPORT zSHORT OPERATION
CopySLC_EntityToSPLD( zVIEW vvSLC0,
                      zVIEW vmSPLD1,
                      zPCHAR eEntity2,
                      zSHORT nFlag3 );

zOPER_EXPORT zSHORT OPERATION
CopyMLC_EntityToSLC( zVIEW vMasLC0,
                     zVIEW vSubLC1,
                     zPCHAR eEntity2,
                     zSHORT nFlag3 );

//end
//start mMasDS 2016.10.04 09:46:03
zOPER_EXPORT zSHORT OPERATION
omMasDS_MergeUsageSelectEnts( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildNewMLC_Version( zVIEW vViewToInstance0,
                             zVIEW vPreviousMLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_CopyMLCToNewProduct( zVIEW vTargetMLC0,
                             zVIEW vSourceMLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_ObjectConstraints( zVIEW vViewtoInstance0,
                           zSHORT nEvent1,
                           zSHORT nState2 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildCompEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildFullCompEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildCompEntsWO_Usage( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildUsageSelectEnts( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildUsageWorkEnts( zVIEW vViewToInstance0,
                            zPCHAR pchDirUseOrMarketingTyp1 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_SetMLC_SelectedFlags( zVIEW vViewToInstance0,
                              zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildUsageGroupEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildUsageKeyEntries( zVIEW vViewToInstance0,
                              zPCHAR pchSourceKeywordEntityN1,
                              zPCHAR pchSourceTextEntityName2,
                              zPCHAR pchTextValue3,
                              zPCHAR pchTitleValue4 );

zOPER_EXPORT zSHORT OPERATION
omMasDS_BuildNonGroupEntries( zVIEW vViewToInstance0 );

//end
//start mSubDS 2016.10.04 09:46:06
zOPER_EXPORT zSHORT OPERATION
omSubDS_BuildNewSLC_Version( zVIEW vViewToInstance0,
                             zVIEW vOriginalSLC1,
                             zVIEW vNewMLC2,
                             zVIEW vPreviousMLC3 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_DuplicateSLC( zVIEW vNewSLC0,
                      zVIEW vPreviousSLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_BuildSLC_FromMLC( zVIEW vViewToInstance0,
                          zVIEW vSourceMLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_BuildDirsForUseSects( zVIEW vNewSLC0,
                              zVIEW vSourceMLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_BuildCompEntries( zVIEW vmSubLC0 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_BuildUsageWorkEnts( zVIEW vmSubLC0,
                            zPCHAR pchszDirUseOrMarketingT1 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_RefreshSLC_FromMLC( zVIEW vViewToInstance0,
                            zVIEW vmMasLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_BuildWorkVariables( zVIEW vViewToInstance0,
                            zVIEW vmMasLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_CopyDirsForUseSection( zVIEW vViewToInstance0,
                               zVIEW vmMLC1 );

zOPER_EXPORT zSHORT OPERATION
omSubDS_ObjectConstraints( zVIEW vViewtoInstance0,
                           zSHORT nEvent1,
                           zSHORT nState2 );

//end
//start lMLCATds 2016.10.04 09:45:32
zOPER_EXPORT zSHORT OPERATION
olMLCATds_BuildDifferencesMLC( zVIEW vViewToInstance0,
                               zVIEW vSourceCompareObject1 );

zOPER_EXPORT zSHORT OPERATION
olMLCATds_BuildDifferencesSLC( zVIEW vViewToInstance0,
                               zVIEW vlMLCASrc1,
                               zVIEW vlSLCAnal2 );

zOPER_EXPORT zSHORT OPERATION
olMLCATds_SetDifferencesSortVs( zVIEW vViewToInstance0,
                                zLONG lSortNumber1,
                                zPCHAR pchSectionTitleName2 );

zOPER_EXPORT zSHORT OPERATION
olMLCATds_DeleteEmptyTitles( zVIEW vViewToInstance0 );

//end
//start lMLCATrk 2016.10.04 09:45:53
zOPER_EXPORT zSHORT OPERATION
olMLCATrk_BuildDifferencesMLC( zVIEW vViewToInstance0,
                               zVIEW vSourceCompareObject1 );

zOPER_EXPORT zSHORT OPERATION
olMLCATrk_BuildDifferencesSLC( zVIEW vViewToInstance0,
                               zVIEW vlMLCASrc1,
                               zVIEW vlSLCAnal2 );

zOPER_EXPORT zSHORT OPERATION
olMLCATrk_SetDifferencesSortVs( zVIEW vViewToInstance0,
                                zLONG lSortNumber1,
                                zPCHAR pchSectionTitleName2 );

zOPER_EXPORT zSHORT OPERATION
olMLCATrk_DeleteEmptyTitles( zVIEW vViewToInstance0 );

//end
//start ZGlobalS 2016.10.31 17:43:01
zOPER_EXPORT zVOID OPERATION
BuildCompEntriesForSPLD( zVIEW vmSPLDef0 );

//end
//start mSPLDefx 2016.11.08 15:48:38
zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_Label( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_FormatPrintIcons( zVIEW vViewToInstance0,
                            zLONG llFile1,
                            zPCHAR pchszWriteBuffer2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_FormatContinueBlock( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPanel1,
                               zLONG llFile2,
                               zPCHAR pchszPassedBlanks3,
                               zPCHAR pchszWriteBuffer4,
                               zPCHAR pchContinueType5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_ProcessPDF_Blocks( zVIEW vViewToInstance0,
                             zVIEW vmSPLDefPanel1,
                             zVIEW vmSPLDefContinuation2,
                             zLONG llFile3,
                             zPCHAR pchszPassedBlanks4,
                             zPCHAR pchszWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_DFU( zVIEW vViewToInstance0,
                           zVIEW vmSPLDefPDF1,
                           zLONG llFile2,
                           zPCHAR pchSTRING32szSPLD_Secti3,
                           zPCHAR pchszStatementName4,
                           zPCHAR pchszUsageName5,
                           zPCHAR pchszUsageNameScope6,
                           zPCHAR pchLeadingBlanks7,
                           zPCHAR pchWriteBuffer8 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_ClmList( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG liFile2,
                               zPCHAR pchszLeadingBlanks3,
                               zPCHAR pchWriteBuffer4,
                               zLONG lNumberOfColumns5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_Ingred( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPDF1,
                              zLONG llFile2,
                              zPCHAR pchszLeadingBlanks3,
                              zPCHAR pchWriteBuffer4 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_Content( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszLeadingBlanks3,
                               zPCHAR pchszWriteBuffer4 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_Hazards( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszLeadingBlanks3,
                               zPCHAR pchWriteBuffer4 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_General( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszLeadingBlanks3,
                               zPCHAR pchWriteBuffer4 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_StorDisp( zVIEW vViewToInstance0,
                                zVIEW vmSPLDefPDF1,
                                zLONG llFile2,
                                zPCHAR pchSectionType3,
                                zPCHAR pchszLeadingBlanks4,
                                zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GeneratePDF_EPA_Reg( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszLeadingBlanks3,
                               zPCHAR pchWriteBuffer4 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_BuildSPLD_FromSLC( zVIEW vViewToInstance0,
                             zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_RebuildSPLD_FromSLC( zVIEW vNewSPLD0,
                               zVIEW vSourceSLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_DuplicateSPLD( zVIEW vNewSPLD0,
                         zVIEW vSourceSPLD1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_DuplicateSPLD_Block( zVIEW vNewSPLD0,
                               zVIEW vSourceSPLD1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_FormatBlockContainer( zVIEW vViewToInstance0,
                                zVIEW vmSPLDefRoot1,
                                zLONG llFile2,
                                zPCHAR pchLeadingBlanks3,
                                zPCHAR pchWriteBuffer4,
                                zPCHAR pchszTopPosition5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_FormatBlock( zVIEW vmSPLDef0,
                       zLONG llFile1,
                       zPCHAR pchszLeadingBlanks2,
                       zPCHAR pchszWriteBuffer3 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_AddFormatToSpecialText( zVIEW vViewToInstance0,
                                  zPCHAR pchVariableName1,
                                  zPCHAR pchWriteBuffer2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_GenerateXML_File( zVIEW vmSPLDef0,
                            zPCHAR pchszTopEntityName1,
                            zPCHAR pchszDirectoryAndFileNa2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_SetUpFormattingSelect( zVIEW vViewToInstance0,
                                 zPCHAR pchSectionType1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_ComputeTopPositions( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_ObjectConstraints( zVIEW vViewtoInstance0,
                             zSHORT nEvent1,
                             zSHORT nState2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_BuildUsageEntriesFrSLC( zVIEW vViewToInstance0,
                                  zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_CheckAddKeywordEntry( zVIEW vViewToInstance0,
                                zPCHAR pchszKeywordName1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_SetUpKeywordEntries( zVIEW vViewToInstance0,
                               zPCHAR pchszSectionType1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_BuildSPLD_FromSPLD( zVIEW vViewToInstance0,
                              zVIEW vPreviousSPLD1,
                              zVIEW vSourceSLC2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_ComputeTopPosRecursive( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_TraverseBlockRecursive( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDefx_TraverseBlocks( zVIEW vViewToInstance0 );

//end
//start mMasLC1 2017.06.26 09:51:25
zOPER_EXPORT zSHORT OPERATION
omMasLC1_MergeUsageSelectEnts( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildNewMLC_Version( zVIEW vViewToInstance0,
                              zVIEW vPreviousMLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_CopyMLCToNewProduct( zVIEW vTargetMLC0,
                              zVIEW vSourceMLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_ObjectConstraints( zVIEW vViewtoInstance0,
                            zSHORT nEvent1,
                            zSHORT nState2 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildCompositeEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildFullCompEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildCompEntsWO_Usage( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildUsageSelectEnts( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildUsageWorkEnts( zVIEW vViewToInstance0,
                             zPCHAR pchDirUseOrMarketingTyp1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_SetMLC_SelectedFlags( zVIEW vViewToInstance0,
                               zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildUsageGroupEntries( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omMasLC1_BuildUsageKeyEntries( zVIEW vViewToInstance0,
                               zPCHAR pchSourceKeywordEntityN1,
                               zPCHAR pchSourceTextEntityName2,
                               zPCHAR pchTextValue3,
                               zPCHAR pchTitleValue4 );

//end
//start mSPLDef1 2017.01.12 16:47:56
zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_Label( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_FormatPrintIcons( zVIEW vViewToInstance0,
                            zLONG llFile1,
                            zPCHAR pchszWriteBuffer2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_FormatContinueBlock( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPanel1,
                               zLONG llFile2,
                               zPCHAR pchszPassedBlanks3,
                               zPCHAR pchszWriteBuffer4,
                               zPCHAR pchContinueType5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_ProcessPDF_Blocks( zVIEW vViewToInstance0,
                             zVIEW vmSPLDefPanel1,
                             zVIEW vmSPLDefContinuation2,
                             zLONG llFile3,
                             zPCHAR pchszPassedBlanks4,
                             zPCHAR pchszWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_DFU( zVIEW vViewToInstance0,
                           zVIEW vmSPLDefPDF1,
                           zLONG llFile2,
                           zPCHAR pchszSectionType3,
                           zPCHAR pchSTRING32szSPLD_Secti4,
                           zPCHAR pchszStatementName5,
                           zPCHAR pchszUsageName6,
                           zPCHAR pchszUsageNameScope7,
                           zPCHAR pchLeadingBlanks8,
                           zPCHAR pchWriteBuffer9 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_ClmList( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG liFile2,
                               zPCHAR pchszSectionType3,
                               zPCHAR pchszLeadingBlanks4,
                               zPCHAR pchWriteBuffer5,
                               zLONG lNumberOfColumns6 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_Ingred( zVIEW vViewToInstance0,
                              zVIEW vmSPLDefPDF1,
                              zLONG llFile2,
                              zPCHAR pchszSectionType3,
                              zPCHAR pchszLeadingBlanks4,
                              zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_Content( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszSectionType3,
                               zPCHAR pchszLeadingBlanks4,
                               zPCHAR pchszWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_Hazards( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszSectionType3,
                               zPCHAR pchszLeadingBlanks4,
                               zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_General( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszLeadingBlanks3,
                               zPCHAR pchWriteBuffer4 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_StorDisp( zVIEW vViewToInstance0,
                                zVIEW vmSPLDefPDF1,
                                zLONG llFile2,
                                zPCHAR pchSectionType3,
                                zPCHAR pchszLeadingBlanks4,
                                zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GeneratePDF_EPA_Reg( zVIEW vViewToInstance0,
                               zVIEW vmSPLDefPDF1,
                               zLONG llFile2,
                               zPCHAR pchszSectionType3,
                               zPCHAR pchszLeadingBlanks4,
                               zPCHAR pchWriteBuffer5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_BuildSPLD_FromSLC( zVIEW vViewToInstance0,
                             zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_RebuildSPLD_FromSLC( zVIEW vNewSPLD0,
                               zVIEW vSourceSLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_DuplicateSPLD( zVIEW vNewSPLD0,
                         zVIEW vSourceSPLD1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_DuplicateSPLD_Block( zVIEW vNewSPLD0,
                               zVIEW vSourceSPLD1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_FormatBlockContainer( zVIEW vViewToInstance0,
                                zVIEW vmSPLDefRoot1,
                                zLONG llFile2,
                                zPCHAR pchLeadingBlanks3,
                                zPCHAR pchWriteBuffer4,
                                zPCHAR pchszTopPosition5 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_FormatBlock( zVIEW vmSPLDef0,
                       zLONG llFile1,
                       zPCHAR pchszLeadingBlanks2,
                       zPCHAR pchszWriteBuffer3 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_AddFormatToSpecialText( zVIEW vViewToInstance0,
                                  zPCHAR pchszSectionType1,
                                  zPCHAR pchVariableName2,
                                  zPCHAR pchWriteBuffer3 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_GenerateXML_File( zVIEW vmSPLDef0,
                            zPCHAR pchszTopEntityName1,
                            zPCHAR pchszDirectoryAndFileNa2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_SetUpFormattingSelect( zVIEW vViewToInstance0,
                                 zPCHAR pchSectionType1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_ComputeTopPositions( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_ObjectConstraints( zVIEW vViewtoInstance0,
                             zSHORT nEvent1,
                             zSHORT nState2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_BuildUsageEntriesFrSLC( zVIEW vViewToInstance0,
                                  zVIEW vmSubLC1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_CheckAddKeywordEntry( zVIEW vViewToInstance0,
                                zPCHAR pchszSectionType1,
                                zPCHAR pchszKeywordName2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_SetUpKeywordEntries( zVIEW vViewToInstance0,
                               zPCHAR pchszSectionType1 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_BuildSPLD_FromSPLD( zVIEW vViewToInstance0,
                              zVIEW vPreviousSPLD1,
                              zVIEW vSourceSLC2 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_ComputeTopPosRecursive( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_TraverseBlockRecursive( zVIEW vViewToInstance0 );

zOPER_EXPORT zSHORT OPERATION
omSPLDef1_TraverseBlocks( zVIEW vViewToInstance0 );

//end
