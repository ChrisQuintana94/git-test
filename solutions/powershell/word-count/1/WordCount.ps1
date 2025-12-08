<#
    Programmer : Christopher Quintana
    Date       : 12/07/2025
    Description: This program takes a text phrase and returns a hashtable showing how many times each unique word appears

#>

Function Get-WordCount() {
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )

    # lowercase
    $text = $Phrase.ToLower()

    $cleanedText = $text -replace '[^a-z0-9'']', ' '
    
    # Step 2
    $cleanedText = $cleanedText -replace "^\s*''|''\s*$", ''

    # Step 3: Consolidate multiple spaces into single spaces
    $cleanedText = $cleanedText -replace '\s+', ' '

    # Step 4: Split on space and filter out
    $words = $cleanedText -split ' ' | Where-Object { $_ -ne "" }

    $counts = @{}
    foreach ($word in $words) {

        $cleanWord = $word.Trim("'")

        if ($cleanWord -ne "") {
            if ($counts.ContainsKey($cleanWord)) {
                $counts[$cleanWord]++
            } else {
                $counts[$cleanWord] = 1
            }
        }
    }
    return $counts
}