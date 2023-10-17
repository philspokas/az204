$uri = "https://prod-00.westus3.logic.azure.com:443/workflows/14f758511d8944029ea15088d87ae913/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=zDR61IwCcp9OVgtmoDGixz6p-hnWzt_r5IAPp9f-99Q"

$headers = @{
    'Content-type' = 'application/json'
}

$body = @{
 name = "jim"
 message = "hey there"
}

$return = Invoke-RestMethod $uri -Method Post -ContentType 'application/json' -Body $($body | ConvertTo-Json)
