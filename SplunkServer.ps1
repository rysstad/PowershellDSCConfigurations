configuration SplunkServer {
    
    Import-DscResource –ModuleName ’PSDesiredStateConfiguration’

    package splunkServer631 {
    Ensure    = "Present"
    Name      = "Splunk Enterprise"
    Path      = "C:\Software\splunk-6.3.1-f3e41e4b37b2-x64-release.msi"
    ProductId = "B1422A85-DDFC-42D8-872F-397E25D3ED73"
    Arguments = "AGREETOLICENSE=Yes WINEVENTLOG_APP_ENABLE=1 WINEVENTLOG_SYS_ENABLE=1 WINEVENTLOG_SET_ENABLE=1"
    LogPath   = "C:\DSC\Log\splunkServer631.log"
    }
}

SplunkServer -OutputPath C:\DSC -Verbose
Start-DscConfiguration C:\DSC –Wait -Verbose -Force
