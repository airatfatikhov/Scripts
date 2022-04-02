#Variables
SET Path_IIS=c:\Windows\System32\inetsrv\
SET Path_VirtualFile=C:\web_site_1\
SET Port=8080
SET Name_Site=FrontOffice
SET Pipeline_I=Integrated
SET Pipeline_C=Classic
SET Pool_Name=FrontOffice_Pool
SET Frwk_4=v4.0
SET Frwk_2=v2.0

#Add Pool
%Path_IIS%appcmd add apppool /name:%Pool_Name% /managedRuntimeVersion:%Frwk_4% /managedPipelineMode:%Pipeline_I%
#Add Site
%Path_IIS%appcmd add site /name:%Name_Site% /bindings:http://*:%Port% /physicalPath:%Path_VirtualFile%
#Bindinf Pool and Site
%Path_IIS%appcmd set site /site.name:%Name_Site% /[path='/'].applicationPool:%Pool_Name%

#appcmd set config /section:applicationPools /[name='techpool'].processModel.identityType:SpecificUser /[name='techpool'].processModel.userName:anuket /[name='techpool'].processModel.password:redhat123 ?
PAUSE