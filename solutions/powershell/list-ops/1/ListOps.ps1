<#
    Programmer : Christopher Quintana
    Date       : 12/07/2025
    Description: This program defines PowerShell functions that re-create common list operations using only loops.

#>

Function Invoke-Append {
    [CmdletBinding()]
    Param(
        [object[]]$List1,
        [object[]]$List2
    )

    $result = @()

    foreach ($item in $List1) {
        $result += ,$item         
    }

    foreach ($item in $List2) {
        $result += ,$item
    }

    $result
}

Function Invoke-Concatenate {
    [CmdletBinding()]
    Param(
        [object[]]$Lists
    )

    $result = @()

    foreach ($list in $Lists) {
        foreach ($item in $list) {
            $result += ,$item     
        }
    }

    $result
}

Function Invoke-Filter {
    [CmdletBinding()]
    Param(
        [object[]]$List,
        [scriptblock]$Predicate
    )

    $result = @()

    foreach ($item in $List) {
        if (& $Predicate $item) {
            $result += ,$item
        }
    }

    $result
}

Function Get-Length {
    [CmdletBinding()]
    Param(
        [object[]]$List
    )

    $count = 0
    foreach ($item in $List) {
        $count++
    }

    $count
}

Function Invoke-Map {
    [CmdletBinding()]
    Param(
        [object[]]$List,
        [scriptblock]$Function
    )

    $result = @()

    foreach ($item in $List) {
        $mapped = & $Function $item
        $result += ,$mapped        
    }

    $result
}

Function Invoke-Foldl {
    [CmdletBinding()]
    Param(
        [scriptblock]$Function,
        [object[]]$List,
        [object]$Accumulator
    )

    $acc = $Accumulator

    foreach ($item in $List) {
        
        $acc = & $Function $acc $item
    }

    $acc
}

Function Invoke-Foldr {
    [CmdletBinding()]
    Param(
        [scriptblock]$Function,
        [object[]]$List,
        [object]$Accumulator
    )

    $acc = $Accumulator

    
    for ($i = $List.Count - 1; $i -ge 0; $i--) {
        $acc = & $Function $acc $List[$i]
    }

    $acc
}

Function Invoke-Reverse {
    [CmdletBinding()]
    Param(
        [object[]]$List
    )

    $result = @()

    for ($i = $List.Count - 1; $i -ge 0; $i--) {
        $result += ,$List[$i]     
    }

    $result
}
