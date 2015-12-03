Script DisableCertificateRevokationCheck {

	SetScript = {
		# Disables certificate CRL checking
		# More info here: http://blogs.msdn.com/b/chaun/archive/2014/05/01/best-practices-for-crl-checking-on-sharepoint-servers.aspx
		# Disables the certificate CRL checking for all users in HKEY_USERS, including Default
		$HKEYUSERS = get-childitem $(Resolve-Path Registry::HKEY_USERS\)

		foreach ($userKey in $HKEYUSERS) {
			$RegPath = $userKey.PSPath
			$RegPath = $RegPath + "\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing\"

			if ($(Test-Path $RegPath)) {
				Set-ItemProperty -Path $RegPath -Name "State" -Value 146944
			}
		}

		Write-Verbose "Requesting a reboot from the DSC Local Configuration Manager"
		$global:DSCMachineStatus = 1

	} # End of SetScript


	GetScript = {
		$HKEYUSERS = get-childitem $(Resolve-Path Registry::HKEY_USERS\)
        $a = 0
		foreach ($userKey in $HKEYUSERS) {
			$RegPath = $userKey.PSPath
			$RegPath = $RegPath + "\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing\"
			if ($(Test-Path $RegPath)) {
				# Set-ItemProperty -Path $RegPath -Name "State" -Value 146944
                $StateSetting = Get-ItemProperty -Path $RegPath -Name "State"
                if ($StateSetting.State -ne "146944") {
                    Write-Verbose "CRL-checking not disabled, Setscript required"
                    $a++
                } else {
                    Write-Verbose "CRL-checking disabled, Setscript not required"
                }
            }
		} # End of foreach


        if ($a -gt 0) {
            return @{CertificateRevokationCheckDisabled = $false}
        } else {
            return @{CertificateRevokationCheckDisabled = $true}
        }
	} #  End  of GetScript


TestScript = {
$HKEYUSERS = get-childitem $(Resolve-Path Registry::HKEY_USERS\)
        $a = 0
		foreach ($userKey in $HKEYUSERS) {
			$RegPath = $userKey.PSPath
			$RegPath = $RegPath + "\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing\"
			if ($(Test-Path $RegPath)) {
				# Set-ItemProperty -Path $RegPath -Name "State" -Value 146944
                $StateSetting = Get-ItemProperty -Path $RegPath -Name "State"
                if ($StateSetting.State -ne "146944") {
                    Write-Verbose "CRL-checking not disabled, Setscript required"
                    $a++
                } else {
                    Write-Verbose "CRL-checking disabled, Setscript not required"
                }
            }
		} # End of foreach


        if ($a -gt 0) {
            return $false
        } else {
            return $true
        }

	} # End of TestScript
} # End of DisableCertificateRevokationCheck
