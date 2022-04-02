#Variables
SET Path_IIS=c:\Windows\System32\inetsrv\
SET Pool_Name=FrontOffice_Pool
%Path_IIS%appcmd recycle apppool /apppool.name:%Pool_Name%
PAUSE