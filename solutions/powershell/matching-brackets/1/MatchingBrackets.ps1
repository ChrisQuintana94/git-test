<#
    Programmer : Christopher Quintana
    Date       : 12/07/2025
    Description: This program It checks whether brackets in a string are balanced and nested correctly.

#>

Function Test-MatchingBrackets() {
    [CmdletBinding()]
    Param(
        [string]$Text
    )

    # Stack to hold opening brackets
    $stack = [System.Collections.Stack]::new()

    foreach ($ch in $Text.ToCharArray()) {
        switch ($ch) {
            # Opening brackets: push onto stack
            '(' { $stack.Push('(') }
            '[' { $stack.Push('[') }
            '{' { $stack.Push('{') }

            # Closing parenthesis
            ')' {
                if ($stack.Count -eq 0 -or $stack.Pop() -ne '(') {
                    return $false
                }
            }

            # Closing square bracket
            ']' {
                if ($stack.Count -eq 0 -or $stack.Pop() -ne '[') {
                    return $false
                }
            }

            # Closing brace
            '}' {
                if ($stack.Count -eq 0 -or $stack.Pop() -ne '{') {
                    return $false
                }
            }

            default {
                # Ignore all non-bracket characters
            }
        }
    }

    # Valid only if no unmatched opening brackets remain
    return ($stack.Count -eq 0)
}
