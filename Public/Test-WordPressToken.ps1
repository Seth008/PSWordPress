﻿Function Test-WordPressToken{
param($clientID=$global:clientID,$authtoken=$global:AuthToken)
    try {
        $result =Invoke-RestMethod "https://public-api.wordpress.com/oauth2/token-info?client_id=$clientID&token=$authToken" -ErrorAction STOP
        $err=$false
    }
    catch {
        Write-Warning "Double check that you're providing a Token, and not an access code";$err=$true}
    finally {
        if (-not($err)){
            Write-host "Token is valid, for the following user"
            $result
            }
    }
}