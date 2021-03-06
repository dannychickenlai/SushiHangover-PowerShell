function Get-CurrentToken {    
    <#
    .Synopsis
        Gets the current token within a file
    .Description
        Gets the current token within a file
    .Example
        Get-CurrentToken
    #>
    param(
    # The tokens for the file
    $tokens = (Get-CurrentOpenedFileToken),    
    # The line within the file
    $line = ($psise.CurrentFile.Editor.CaretLine),
    # The column within the file
    $column = ($psise.CurrentFile.Editor.CaretColumn)
    )
    
    foreach ($t in $tokens) {
        if ($t.StartLine -eq $line -and
            $t.EndLine -eq $line) {
            if ($t.StartColumn -le $column -and
                $t.EndColumn -ge $column) {
                return $t
            }
        }
        $lastT =$t
    }
}
