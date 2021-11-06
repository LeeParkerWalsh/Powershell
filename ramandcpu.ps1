$totalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum
for ($loop=1; $loop -le 10; $loop++) {
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $cpuTime = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    $availMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
    $date + ' ==> CPU used: ' + $cpuTime.ToString("#,0.000") + '%, Memory used: (' + (100 - (104857600 * $availMem / $totalRam)).ToString("#,0.0") + '%)'
    Start-Sleep -s 1}