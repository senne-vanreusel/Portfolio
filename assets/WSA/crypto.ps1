


$crypto ='bitcoin'
$currency ='eur'
$threshold = 0
$discordURL ="https://discord.com/api/webhooks/956197392590442497/1HUPGgaIGdTD_b8GkDx0dZJFe61AmR6eXCGGWeSqVW_arrGT-OhbsPs54hw2ZApzjqVf"
$content =""

while(1){
Try{
    $url="https://api.coingecko.com/api/v3/simple/price?ids=$crypto&vs_currencies=$currency"
    $info = (Invoke-WebRequest -uri $url -UseBasicParsing).Content | ConvertFrom-Json    
}
Catch{
    $Exception = $_.Exception.Message

    Write-Error "Cannot connect to the coingecko.com API. Here's the error: $Exception"
    
    break
}

$price = $info.$crypto.$currency

if($price -gt $threshold){
    Write-Host "Coin up"
    Write-Host "Price: $price"
    Write-Host "Threshold: $threshold"
    $content = @"
    $crypto is up
the price of 1 $crypto is $price $currency
Threshold: $threshold
"@
}else{
    Write-Host "Coin down"
    Write-Host "Price: $price"
    Write-Host "Threshold: $threshold"
    $content = @"
    $crypto is down
the price of 1 $crypto is $price $currency
Threshold: $threshold
"@
}

$payload = [PSCustomObject]@{

  content = $content

}

Invoke-RestMethod -Uri $discordURL -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'

$threshold = $price
Start-Sleep -s 20

}

