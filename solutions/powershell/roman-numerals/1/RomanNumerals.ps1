<#
    Programmer : Christopher Quintana
    Date       : 12/07/2025
    Description: This program It converts a regular number into a Roman numeral

#>

Function Get-RomanNumerals {
    [CmdletBinding()]
    Param(
        [int]$Number
    )

    if ($Number -lt 1 -or $Number -gt 3999) {
        throw "Number has to be positive integer in range of 1-3999."
    }

    $map = @(
        @{ Value = 1000; Symbol = "M"  }
        @{ Value = 900;  Symbol = "CM" }
        @{ Value = 500;  Symbol = "D"  }
        @{ Value = 400;  Symbol = "CD" }
        @{ Value = 100;  Symbol = "C"  }
        @{ Value = 90;   Symbol = "XC" }
        @{ Value = 50;   Symbol = "L"  }
        @{ Value = 40;   Symbol = "XL" }
        @{ Value = 10;   Symbol = "X"  }
        @{ Value = 9;    Symbol = "IX" }
        @{ Value = 5;    Symbol = "V"  }
        @{ Value = 4;    Symbol = "IV" }
        @{ Value = 1;    Symbol = "I"  }
    )

    $result = ""

    foreach ($item in $map) {
        while ($Number -ge $item.Value) {
            $result += $item.Symbol
            $Number -= $item.Value
        }
    }

    $result
}
