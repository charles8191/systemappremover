[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$package = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the package name/Google Play Store link:", "Package Name")
if ($package -like "*play.google.com/store/apps/details*") {
    $package += "&dummy=1"
    $id = $package -split "\?id="
    $id = $id[1] -split "\&"
    $id = $id[0]
    $package = $id
    adb shell pm uninstall --user 0 $package
}
else {
    adb shell pm uninstall --user 0 $package
}