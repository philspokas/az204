$fnuri = "https://test-fn2-249861024.azurewebsites.net/api/HttpTestFn?"
$appuri = "https://test-appsvc-249861024.azurewebsites.net"

function CallTest($n) {
    $uri = "$($fnuri)name=ps test $n"
    $result = Invoke-RestMethod -Uri $uri
    "$(Get-Date -Format "hh:mm:ss") $result"
}

function CallApp($n) {
    $result = Invoke-WebRequest -Uri $appuri
    "$(Get-Date -Format "hh:mm:ss") $n $($result.StatusCode)"
}


for ($i = 1; $i -le 1000; $i++) {
    CallTest $i
}

for ($i = 1; $i -le 1000; $i++) {
    CallApp $i
}

for ($i = 1; $i -le 500; $i++) {
    CallApp $i
    CallTest $i
}


# Get-Random -Max 100
