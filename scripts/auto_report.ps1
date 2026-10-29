# AUDIT: xác nhận đã thẩm định script.
$reportPath = "..\backup\bao-cao-su-co.txt"
"========================================" | Out-File -FilePath $reportPath -Encoding utf8
"BAO CAO SU CO - SMARTFARM" | Out-File -FilePath $reportPath -Append -Encoding utf8
"Ngay gio: $(Get-Date -Format 'dd/MM/yyyy HH:mm')" | Out-File -FilePath $reportPath -Append -Encoding utf8
"========================================" | Out-File -FilePath $reportPath -Append -Encoding utf8
"" | Out-File -FilePath $reportPath -Append -Encoding utf8

Get-Content "..\data\log-he-thong.log" | Select-String "CRITICAL", "ERROR" | Out-File -FilePath $reportPath -Append -Encoding utf8
"" | Out-File -FilePath $reportPath -Append -Encoding utf8

$errorCount = (Get-Content "..\data\log-he-thong.log" | Select-String "CRITICAL", "ERROR").Count
"TONG SO SU CO:" | Out-File -FilePath $reportPath -Append -Encoding utf8
$errorCount | Out-File -FilePath $reportPath -Append -Encoding utf8