		#########################################################################################################
		#   Disable Loopback Check
		#########################################################################################################
		#  Please note: Disabling the Loopback Check reduces security
		#  This should not be used in production, but simplifies things in development!
		Registry DisableLoopbackCheck {
			Ensure = "Present"
			Force = $true
			Key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"
			ValueName = "DisableLoopbackCheck"
			ValueType = "Dword"
			ValueData = "1"
		}
