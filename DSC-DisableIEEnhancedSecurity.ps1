#########################################################################################################
#	Disable IE Enhanced Security
#########################################################################################################
Script DisableIEEnhancedSecurity {
    SetScript = {
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name isinstalled -Value 0
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name isinstalled -Value 0
        Rundll32 iesetup.dll, IEHardenLMSettings,1,True
        Rundll32 iesetup.dll, IEHardenUser,1,True
        Rundll32 iesetup.dll, IEHardenAdmin,1,True
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}") {
            Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
        }
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}") {
            Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
        }
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main\First Home Page") {
            Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main"  "First Home Page" -ErrorAction SilentlyContinue
        }

    } # End of SetScript

    GetScript = {
		# Checking and checking takes the same amount of time... 	
		Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name isinstalled -Value 0
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name isinstalled -Value 0
        Rundll32 iesetup.dll, IEHardenLMSettings,1,True
        Rundll32 iesetup.dll, IEHardenUser,1,True
        Rundll32 iesetup.dll, IEHardenAdmin,1,True
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}") {
            Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
        }
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}") {
            Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
        }
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main\First Home Page") {
            Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main"  "First Home Page" -ErrorAction SilentlyContinue
        }
        return @{IEEnhancedSecurityDisabled = $true}
    }

    Testscript = {
		# Checking and checking takes the same amount of time... 
		Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name isinstalled -Value 0
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name isinstalled -Value 0
        Rundll32 iesetup.dll, IEHardenLMSettings,1,True
        Rundll32 iesetup.dll, IEHardenUser,1,True
        Rundll32 iesetup.dll, IEHardenAdmin,1,True
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}") {
            Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
        }
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}") {
            Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
        }
        If (Test-Path "HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main\First Home Page") {
            Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main"  "First Home Page" -ErrorAction SilentlyContinue
        }
        return $true
    }

} # End of Script DisableIEEnhancedSecurity
