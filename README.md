# Write-Custom-Log-PowerShell

## Description

Create custom logs for your PowerShell scripts with the format 

## Parameters

```-LogWrite ``` - string - mandatory - The main content of the log. Use this to writeyour message.

```-LogPath ``` - string - mandatory - Specify the absolute path for the log file. It can be any text file, but I recommend using .log. 

```-CreatePath``` - boolean - optional - If the path doesn't exist, create one.

```-ComponentName``` - string - optional - Useful when one log file uses multiple sources.

