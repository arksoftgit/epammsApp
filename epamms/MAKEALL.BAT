del *.err
del *.ler
copy bin\domainc.mak
nmake %1 -f domainc.MAK
nmake %1 -f ZGlobal1.MAK
nmake %1 -f LODOPSYS.MAK
nmake %1 -f lPrimReg.MAK
nmake %1 -f rPrimReg.MAK
nmake %1 -f qPrimReg.MAK
nmake %1 -f lMLCATgt.MAK
nmake %1 -f wePamms.MAK
nmake %1 -f wPrimR.MAK
nmake %1 -f wStartUp.MAK
nmake %1 -f wSubR.MAK
nmake %1 -f mPrimReg.MAK
nmake %1 -f mSubreg.MAK
nmake %1 -f mMasLC.MAK
nmake %1 -f mMasProd.MAK
nmake %1 -f mPerson.MAK
nmake %1 -f mPrimReg.mak
nmake %1 -f mSubLC.MAK
nmake %1 -f mSubProd.MAK
nmake %1 -f wTemplD.MAK
nmake %1 -f mUser.MAK
nmake %1 -f lSubreg.MAK
nmake %1 -f qSubreg.MAK
nmake %1 -f qOrganiz.MAK
nmake %1 -f rSubreg.MAK
nmake %1 -f Template.MAK
nmake %1 -f Test.MAK
nmake %1 -f TestGenD.MAK
nmake %1 -f wePamms.MAK
nmake %1 -f wMLC.MAK
nmake %1 -f wPrimR.MAK
nmake %1 -f wSPLD.MAK
nmake %1 -f wSLC.MAK
nmake %1 -f mUser.MAK
nmake %1 -f wWebXfer.MAK
nmake %1 -f wSystem.MAK
dir *.ler
dir *.err /os
