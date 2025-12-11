#!powershell

[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSReviewUnusedParameter", "")]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]

param(
   [string]$TpchcVersion = "0.00",
   [string]$BuildVersion = "0.00.1970.01.01",
   [string]$SatTeam = "SATTeam placeholder",
   [string]$HwswDomain = "HWSWDomain placeholder",
   [string]$Location = "Kyndryl",
   [string]$Account = "SATHCaaS",
   [string]$Gsma = "s2c",
   [string]$Blueid = "BAC9999999",
   [switch]$Debug,
   [switch]$Udcmode,
   [string]$ScriptLocation = "C:\temp",
   [string]$ExcludeCategory = "",
   [string]$Segment = "",
   [string]$DeviceName = "",
   [string]$InventoryName = "",
   [string]$NameBase = "",
   [string]$TechspecVersion = ""
)

Function Set-Variables {
   Set-Location -Path $ScriptLocation
   $script:TimeStamp = Get-Date -UFormat "%Y-%m-%d %H:%M:%S"
   $script:LogFile = Join-Path -Path $PWD -ChildPath ($InventoryName + "_" + $NameBase + ".log")
   $script:OutFile = Join-Path -Path $PWD -ChildPath ($InventoryName + "_" + $NameBase + ".out")
   $script:Result = @{
      changed = $False
      failed = $False
      rc = 0
    }
}

Function Fail-Json($obj = $Result, $msg = $null, $rc = 1) {
   $TimeStamp = Get-Date -UFormat "%Y-%m-%d %H:%M:%S"
   $ClosingTimeStamp = Get-Date -UFormat "%a %b %d %H:%M:%S %Y"
   # Closing out the log so BPS Engine can properly process
   $Content = "${TimeStamp} - ${msg}"
   $Content | Out-File -FilePath $LogFile -Encoding utf8 -Append
   "${Timestamp} - DATA COLLECTION ON $($InventoryName.ToUpper()) FINISHED WITH ERRORS ($rc).`r`n${ClosingTimeStamp}: Data collection status: Failed`r`n" | Out-File -FilePath $LogFile -Encoding utf8 -Append

   # Setting $Result and returning it to the wrapper module
   $Result.failed = $true
   $Result.msg = $msg
   $Result.rc = $rc
   Write-Output $obj | ConvertTo-Json -Compress -Depth 99
   Exit $rc
}

Function Exit-Json($obj = $Result) {
   $TimeStamp = Get-Date -UFormat "%Y-%m-%d %H:%M:%S"
   $ClosingTimeStamp = Get-Date -UFormat "%a %b %d %H:%M:%S %Y"
   # Closing out the log so BPS Engine can properly process
   "${Timestamp} - DATA COLLECTION ON $($InventoryName.ToUpper()) FINISHED SUCCESSFULLY ($($obj.rc)).`r`n${ClosingTimeStamp}: Data collection status: OK`r`n" | Out-File -FilePath $LogFile -Encoding utf8 -Append

   # Setting $Result and returning it to the wrapper module
   Write-Output $obj | ConvertTo-Json -Compress -Depth 99
   Exit 0
}

Function Write-LogFile($Segment, $Status) {
   $TimeStamp = Get-Date -UFormat "%Y-%m-%d %H:%M:%S"
   $Content = "${TimeStamp} - ${Segment}: ${Status}"
   $Content | Out-File -FilePath $LogFile -Encoding utf8 -Append
   $Result.stdout += $Content + "`r`n"
}

Function Write-OutFile($SegmentData){
   $Header = ($SegmentData -split "`r`n")[0]
   Write-LogFile -Segment $Header -Status "success"
   $SegmentData | Out-File -FilePath $OutFile -Encoding utf8 -Append
}

Function Set-NonFailingError {
   $functionName = $MyInvocation.MyCommand.Name
   Write-LogFile -Segment $Header -Status "Warning - non-failing exception when executing $functionName"
   $Result.rc = 3
}

Function Collect-SystemInfo {
   $SystemInfo = New-Object -TypeName PSobject
   try {
         $computerSystem = Get-CimInstance -Class Win32_ComputerSystem
         $computerSystemProduct = Get-CimInstance -Class Win32_ComputerSystemProduct
         $computerBIOS = Get-CimInstance -Class Win32_BIOS
         $computerOS = Get-CimInstance -Class Win32_OperatingSystem
         $computerCPU = Get-CimInstance -Class Win32_Processor
         $DomainRole = ("Standalone Workstation","Member Workstation","Standalone Server","Member Server","Backup Domain Controller","Primary Domain Controller")
         # set up the different possible types of licenses in an array:
         $licenseStatus=@{0="Unlicensed"; 1="Licensed"; 2="OOBGrace"; 3="OOTGrace"; 4="NonGenuineGrace"; 5="Notification"; 6="ExtendedGrace"}
         # Now get the license details and assign the object to $r
         $r = Get-CimInstance -Class SoftwareLicensingProduct | Where-Object {$_.ApplicationID -eq "55c92734-d682-4d71-983e-d6ec3f16059f" -AND $null -ne  $_.PartialProductKey}
         $PageFileResults = Get-CimInstance -Class Win32_PageFileUsage
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "MachineName" -Value $computerSystem.Name
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Manufacturer" -Value $computerSystem.Manufacturer
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Model" -Value $computerSystem.Model
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "OperatingSystem" -Value $computerOS.caption
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "OperatingSystem ServicePack" -Value $computerOS.ServicePackMajorVersion
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "BuildNumber" -Value $computerOS.BuildNumber
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Version" -Value $computerOS.Version
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "InstallDate" -value $ComputerOS.InstallDate.ToString()
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "License" -Value $licenseStatus[[int]$r.LicenseStatus]
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Uptime" -value  $computerOS.LastBootUpTime.ToString()
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "BootDevice" -Value $computerOS.BootDevice
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "SystemDevice" -Value $computerOS.SystemDevice
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "SystemDirectory" -Value $computerOS.SystemDirectory
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "WindowsDirectory" -Value $computerOS.WindowsDirectory
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "OSArchitecture" -Value $computerOS.OSArchitecture
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "PowerShellVersion" -Value $PSVersionTable.PSVersion.tostring()
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "CurrentTimeZone" -Value $computerOS.CurrentTimeZone
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Debug" -Value $computerOS.Debug
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Distributed" -Value $computerOS.Distributed
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "EncryptionLevel" -Value $computerOS.EncryptionLevel
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "DNS Host Name" -Value $computerSystem.DNSHostName
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Domain Role" -Value $DomainRole[$computerSystem.DomainRole]
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Roles" -Value ($computerSystem.Roles -join ',')
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "Serial Number" -Value $computerBIOS.SerialNumber
         if ($computerCPU -is [array]) {
            $SystemInfo | Add-Member -MemberType NoteProperty -Name "CPU Array" -Value $computerCPU.Name[0]
         } else {
            $SystemInfo | Add-Member -MemberType NoteProperty -Name "CPU" -Value $computerCPU.Name
         }
         if ($computerCPU -is [array]) {
            $SystemInfo | Add-Member -MemberType NoteProperty -Name "CPU cores" -Value ($computerCPU.NumberOfCores | Measure-Object -sum).sum
         } else {
            $SystemInfo | Add-Member -MemberType NoteProperty -Name "CPU cores" -Value $computerCPU.NumberOfCores
         }
         if ($computerCPU -is [array]) {
            $SystemInfo | Add-Member -MemberType NoteProperty -Name "CPU LogicalProcessors" -Value ($computerCPU.NumberOfLogicalProcessors | Measure-Object -sum).sum
         } else {
            $SystemInfo | Add-Member -MemberType NoteProperty -Name "CPU LogicalProcessors" -Value $computerCPU.NumberOfLogicalProcessors
         }
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "RAM (GB)" -Value ([math]::Round($computerSystem.TotalPhysicalMemory/1GB,2))
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "PageFilePath" -Value $PageFileResults.Description
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "AutoManagedPageFile" -Value $computerSystem.AutomaticManagedPagefile
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "PageFileSize(MB)" -Value $PageFileResults.AllocatedBaseSize
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "PageFileUsage(MB)" -Value $PageFileResults.CurrentUsage
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "PageFilePeakUsage(MB)" -Value $PageFileResults.PeakUsage
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "TempPageFileInUse" -Value $PageFileResults.TempPageFile
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "ProductKeyChannel" -Value $r.ProductKeyChannel
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "UUID" -Value $computerSystemProduct.UUID
         $SystemInfo | Add-Member -MemberType NoteProperty -Name "FQDN" -Value $([System.Net.Dns]::GetHostByName($env:computerName).HostName)
   }
   catch {
      $functionName = $MyInvocation.MyCommand.Name
      $Result.stderr = "Failure when executing $functionName"
      $Result.rc = 1
      $Result.failed = $true
      Fail-Json -obj $Result -msg $Result.stderr -rc $Result.rc
   }
   $Header = "#### <OS_INFO>"
   $Footer = "#### </OS_INFO>"
   $Data = $SystemInfo | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-VBRServer {
   $Header = "#### <servers>"
   $Footer = "#### </servers>"
   try {
      $Data = Get-VbrServer | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      $functionName = $MyInvocation.MyCommand.Name
      $Result.stderr = "Failure when executing $functionName - no VBR servers found?"
      $Result.rc = 1
      $Result.failed = $true
      Fail-Json -obj $Result -msg $Result.stderr -rc $Result.rc
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-VBRNetworkTrafficRule {
   $Header = "#### <network_traffic_rules>"
   $Footer = "#### </network_traffic_rules>"
   $Data = ""
   try {
      $Data = Get-VBRNetworkTrafficRule | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-ScaleOutBackupPermission {
   $Header = "#### <scale_out_backup_permissions>"
   $Footer = "#### </scale_out_backup_permissions>"
   $Data = ""
   try {
      $Data = Get-VBRBackupRepository -ScaleOut | Get-VBREPPermission | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-Acl {
   $Header = "#### <acls>"
   $Footer = "#### </acls>"
   $AclPaths = @(
      "C:\Program Files\Veeam",
      "C:\ProgramData\Veeam",
      "C:\ProgramData\Veeam\Backup",
      "C:\VBRCatalog"
   )
   $Data = @()
   try {
      $AclPaths | ForEach-Object {
         $acl = Get-Acl $_
         $Data += [PSCustomObject]@{
             Path = $_
             Owner = $acl.Owner
         }
      }
      $Data = $Data | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-VBRJobEncryption {
   $Header = "#### <job_encryption>"
   $Footer = "#### </job_encryption>"
   $Data = ""
   try {
      $Data = Get-VbrJob | Select-Object -Property LogNameMainPart, UserCryptoKey | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-VBRConfigurationBackupJob {
   $Header = "#### <backup_job_config>"
   $Footer = "#### </backup_job_config>"
   $Data = ""
   try {
      $Data = Get-VBRConfigurationBackupJob | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-LatestBackupJob {
   $Header = "#### <latest_backup_job>"
   $Footer = "#### </latest_backup_job>"
   $Data = ""
   try {
      $Data = [Veeam.Backup.Core.CConfigurationBackupJob]::Find() | Select-Object -ExpandProperty LatestRunLocal | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-Proxy {
   $Header = "#### <proxies>"
   $Footer = "#### </proxies>"
   $Data = ""
   try {
      $Data = Get-VBRViProxy | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-FilteredTrafficRule {
   $Header = "#### <filtered_traffic_rules>"
   $Footer = "#### </filtered_traffic_rules>"
   $Data = ""
   try {
      $Data = Get-VBRNetworkTrafficRule | Select-Object -ExpandProperty Name | Select-String -Pattern 'Internet' -NotMatch | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Collect-VBRBackupServerInfo {
   $Header = "#### <backup_server_info>"
   $Footer = "#### </backup_server_info>"
   $Data = ""
   try {
      $Data = Get-VBRBackupServerInfo | ConvertTo-Csv -NoTypeInformation -Delimiter ";" | Out-String
   }
   catch {
      Set-NonFailingError
   }
   $SegmentData = "$Header`r`n$($Data.Trim())`r`n$Footer`r`n"
   Write-OutFile $SegmentData
}

Function Main {
   # Any output that's not the JSON object required by the wrapper will mess up UDC
   $WarningPreference = "SilentlyContinue"
   # Set the culture to en-US
   [System.Threading.Thread]::CurrentThread.CurrentCulture = New-Object "System.Globalization.CultureInfo" "en-US"

   Set-Variables
   try {
      Import-Module Veeam.Backup.PowerShell -DisableNameChecking -ErrorAction Stop
   }
   catch {
      $Result.stderr = "Failed to import prerequisite module: Veeam.Backup.PowerShell"
      $Result.rc = 1
      $Result.failed = $true
      Fail-Json -obj $Result -msg $Result.stderr -rc $Result.rc
   }

   $Result.outfile = $OutFile
   $Result.logfile = $LogFile
   Collect-SystemInfo
   Collect-VBRServer
   Collect-VBRNetworkTrafficRule
   Collect-ScaleOutBackupPermission
   Collect-Acl
   Collect-VBRJobEncryption
   Collect-VBRConfigurationBackupJob
   Collect-LatestBackupJob
   Collect-Proxy
   Collect-FilteredTrafficRule
   Collect-VBRBackupServerInfo

   Exit-Json
}

$PSDefaultParameterValues['out-file:width'] = 2000

Main
