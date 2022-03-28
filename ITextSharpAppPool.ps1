#Импортируем модуль IIS
import-module WebAdministration

#Получаем дату текущую
$Date = Get-Date;

#Переменные с пулами
$App_Pool_1 = "DefaultAppPool";

#Смотрим текущее состояние
function Get_All_AppPool($Date)
{
Write-Host "$Date, Before: ";
$State_Output = Get-IISAppPool 'DefaultAppPool';
Start-Sleep -Seconds 5;
$State_Output >> C:\VSK\logs\AppPool_State_Success_ITextSharpAppPool.txt
}

#Смотрим состояние после каки-либо изменении
function IIS_AppPool_Start($Date)
{
Write-Host "After: ";

if((Get-WebAppPoolState -Name 'DefaultAppPool').Value -eq 'Stopped')
{
$Bad_Output = Write-Output "$Date, Stop_AppPool : 'DefaultAppPool'";
Start-WebAppPool -Name 'DefaultAppPool';
Start-Sleep -Seconds 5;
$Bad_Output >> C:\VSK\logs\AppPool_Stop_Bad_ITextSharpAppPool.txt;
}
else
{
$Success_Output = Write-Host "$Date, 'ITextSharpAppPool' State Start...All Ok`s";
$Success_Output >> C:\vsk\logs\AppPool_State_Success_ITextSharpAppPool.txt;
}

}

Get_All_AppPool($Date);
IIS_AppPool_Start($Date);