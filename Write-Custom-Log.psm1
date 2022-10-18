Function Write-Custom-Log
{
	param
	(
        [Parameter(Mandatory)][string]$LogWrite,
		[string]$LogType = 3,
        [Parameter(Mandatory)][string]$LogPath,
		[bool]$CreatePath = $False,
		[string]$ComponentName = "CustomLog"
		<# LogType  3 - verbose; 2 - alert; 1 - error	#>
	)

    # Check if file exists, attempt to create one if it doens't
	$TestPathResult = Test-Path -Path $LogPath -PathType leaf
	if(-NOT $TestPathResult){
		Write-Warning "Path was not find" 
		if ($CreatePath){
			try {
				New-Item -Path $LogPath
			}
			catch {
				"Error creating the path..."
			}
		} else {
			Write-Error "could not proceed writing to a log. Please ensure the LogPath is entered correctly or set -CreatePath True"
			Exit 1
		}
		
	}

    # Get the current date 
	$CurrentDate = Get-Date -Format "MM-dd-yyy"
	# Get time in a log specific format
	$CurrentTime = Get-Date | Select-Object -Property TimeOfDay | Format-Table -HideTableHeaders | Out-String
	# Remove empty spaces in the result
	$CurrentTime = $CurrentTime -replace '\s',''

    # Add log to the file
	Add-content $LogPath -Value "<![LOG[$LogWrite]LOG]!><time=""$CurrentTime"" date=""$CurrentDate"" component=""$ComponentName"" context="""" type=""$LogType"" thread="""" file="""">"
	Write-Host $LogWrite

	Exit 0
}
