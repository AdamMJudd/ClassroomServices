# Change the list of paths below.
$scanPaths = "S:\Checkpoint",
             "S:\Cisco",
             "S:\Comptia",
             "S:\Defence",
             "S:\ECCouncil",
             "S:\Lotus",
             "S:\Microsoft",
             "S:\VMWare"
                

"Getting .gho Ghost file list..."
$gho = Get-ChildItem -Path $scanPaths -Filter *.gho -Recurse
$compatible = "This image is compatible with the Win2016 base image."
$compatibleFlag = "_YES-"
$compatibleCount = 0
$notCompatible = "This image is NOT compatible with the Win2016 base image."
$notCompatibleFlag = "_NO-"
$notCompatibleCount = 0

"Scanning images..."
foreach ($file in $gho) {
    "Inpecting: " + $file.FullName
    $fullPath = $file.FullName
    Start-Process -FilePath 'C:\Scripts\Ghostexp.exe' -ArgumentList '-tv',"`"$fullPath`"" -Wait
    $parent = Split-Path -Path $file.FullName -Parent
    $leaf = Split-Path -Path $file.FullName -Leaf
    $txtFile = $file.FullName.Substring(0, $file.FullName.LastIndexOf('.'))
    $txtFile += '.txt'
    if (Select-String -Path $txtFile -Pattern '.exp$' -Quiet) {
        $notCompatible
        $notCompatibleCount++
        $flagFile = Join-Path -Path $parent -ChildPath ($notCompatibleFlag + $leaf + '.txt')
        Set-Content -Path $flagFile -Value $notCompatible
    } else {
        $compatible
        $compatibleCount++
        $flagFile = Join-Path -Path $parent -ChildPath ($compatibleFlag + $leaf + '.txt')
        Set-Content -Path $flagFile -Value $compatible
    }
   Remove-Item -Path $txtFile -Force -ErrorAction SilentlyContinue
}
"Script complete."
"Compatible: " + $compatibleCount
"Not Compatible: " + $notCompatibleCount