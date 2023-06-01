### Made by FilipooSVK ###

Write-Host "Script for add/remove user to/from Local Group"
$option = Read-Host "Enter A to add a user or R to remove a user from the local group"
$username = Read-Host "Enter your GlobalID"
$groupNames = (Get-LocalGroup).Name | Sort-Object
$groupName = Read-Host "Select the local group name:`n$($groupNames -join "`n")"

if ($username.StartsWith("x")) {
    $usernameSuffix = "add your domain"
} elseif ($username.StartsWith("p")) {
    $usernameSuffix = "add your domain"
} else {
    $usernameSuffix = "add your domain"
}

$fullUsername = "AzureAD\$username$usernameSuffix"

if ($option -eq "A") {
    Add-LocalGroupMember -Group $groupName -Member $fullUsername
    Write-Host "$fullUsername has been added to $groupName"
} elseif ($option -eq "R") {
    Remove-LocalGroupMember -Group $groupName -Member $fullUsername
    Write-Host "$fullUsername has been removed from $groupName"
} else {
    Write-Host "Invalid option selected. Please enter A or R."
}

$continue = "Y"
while ($continue -eq "Y") {
    $username = Read-Host "Enter your GlobalID"
    $groupNames = (Get-LocalGroup).Name | Sort-Object
    $groupName = Read-Host "Select the local group name:`n$($groupNames -join "`n")"

    if ($username.StartsWith("x")) {
        $usernameSuffix = "add your domain"
    } elseif ($username.StartsWith("p")) {
        $usernameSuffix = "add your domain"
    } else {
        $usernameSuffix = "add your domain"
    }

    $fullUsername = "AzureAD\$username$usernameSuffix"

    $action = Read-Host "Do you want to add or remove the user from the local group? (A)dd/(R)emove"
    if ($action -eq "A") {
        Add-LocalGroupMember -Group $groupName -Member $fullUsername
    } elseif ($action -eq "R") {
        Remove-LocalGroupMember -Group $groupName -Member $fullUsername
    } else {
        Write-Host "Invalid action."
    }

    $continue = Read-Host "Do you want to continue with another action? (Y)es/(N)o"
}

Write-Host "Exiting script."
