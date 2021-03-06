function Get-WindowsEdition
{
    <#
    .Synopsis
    Gets the operating system edition.

    .Description
    The Get-WindowsEdition function gets the edition of the operating
    system on the local computer. This function has no parameters.

    .Notes
    Get-WindowsEdition gets its data from the "Net Config Workstation" command. Then
    it uses the RemoveEmptyEntries option of the StringSplitOptions method to parse
    the returned string.

    .Example
    Get-WindowsEdition        
    #>
    param()
    switch -Regex ((net config workstation)) 
    {
        version { 
            $t = $switch.current.Split(" ", [StringSplitOptions]"RemoveEmptyEntries")
            $oldofs = $ofs
            $ofs = " "
            $t[2..$t.Count] -as [string]
            $ofs = $oldOfs    
        }  
    }
}
