DriverFolder = "C:\Drivers"
$Drivers = Get-ChildItem $DriverFolder | where {$_.Extension -eq ".exe"}
$DriversTotal = $Drivers.Count
foreach ($Driver in $Drivers)
{
    $DriverFileName = $Driver.Name
    $DriverPath = $Driver.FullName
    $DriverCount++
    Write-Progress -Activity "Installing..." -Status "($DriverCount / $DriversTotal) $DriverFileName" -PercentComplete ((($DriverCount - 1) / $DriversTotal) * 100)
    Write-Output "Installing $DriverFileName"
    Start-Process $DriverPath -ArgumentList "/s" -Wait
    Write-Output "Installed $DriverFileName"
    Write-Output ""
}
