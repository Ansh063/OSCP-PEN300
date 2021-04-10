$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain() $PDC = ($domainObj.PdcRoleOwner).Name

$SearchString = "LDAP://"

$SearchString += $PDC + "/"

$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"

$SearchString += $DistinguishedName

$SearchString

$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString) 

$objDomain = New-Object System.DirectoryServices.DirectoryEntry

$Searcher.SearchRoot = $objDomain

$Searcher.filter="(name=Secret_Group)"

$Result = $Searcher.FindAll()

Foreach($obj in $Result)
{
	$obj.Properties.member
}
 

# This Script enumerate all the user in Secret_group

$Searcher.filter="(name=Nested_Group)" use this line for enumeration of users in Nested_Groups

$Searcher.filter="(name=Another_Nested_Group)" use this line for enumeration of users in Another_Nested_Groups



