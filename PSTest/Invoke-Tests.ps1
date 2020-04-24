[CmdletBinding()]
param (
    # URI To test
    [Parameter(Mandatory=$true,HelpMessage="Base URI to test")]
    [string]
    $URI
)
#Check for Pester being installed, install if it's not
if ($null -eq (Get-Module Pester -ListAvailable)){ 
    Install-Module Pester
}
#Remove trailing / if passed
if ($URI.Substring($URI.Length - 1) -eq "/") {
    $URI = $URI.Substring(0,$URI.Length -1) 
}
Describe "Check for server online"{
    Context "Ping Check"{
        It "Primary app is online"{
            $testuri = "$($URI)/ping"
            Write-Host $testuri
            Invoke-RestMethod $testuri | Should -Be "pong"
        }
        It "Calc Router is Online"{
            $testuri = "$($URI)/calc/ping"
            Invoke-RestMethod $testuri | Should -Be "pong"
        }
        It "Weather Router is Online"{
            $testuri = "$($URI)/weather/ping"
            Invoke-RestMethod $testuri | Should -Be "pong"
        }
        It "Greet Router is Online"{
            $testuri = "$($URI)/greet/ping"
            Invoke-RestMethod $testuri | Should -Be "pong"
        }
    }
}
Describe "Calc API Tests" -Tags "API"{
    Context "Calc Tests"{
        It "Adds 5+5"{
            $testURI = "$($URI)/calc/add?number1=5&number2=5"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Be (@{result = 10} | ConvertTo-Json)
        }
        It "Subtract 20-10"{
            $testURI = "$($URI)/calc/subtract?number1=20&number2=10"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Be (@{result = 10} | ConvertTo-Json)
        }
        It "Multiply 2*5"{
            $testURI = "$($URI)/calc/multiply?number1=2&number2=5"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Be (@{result = 10} | ConvertTo-Json)
        }
        It "Divide 100/10"{
            $testURI = "$($URI)/calc/divide?number1=100&number2=10"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Be (@{result = 10} | ConvertTo-Json)
        }
        It "Expo 5^5"{
            $testURI = "$($URI)/calc/expo?number1=5&number2=5"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Be (@{result = 3125} | ConvertTo-Json)
        }
        It "Calc JSON Post / Adding 5+15"{
            $testURI = "$($URI)/calc/calc"
            $body = @{
                op = 'add'
                number1 = 5
                number2 = 15
            }
            (Invoke-RestMethod -Method POST -Body ($body | ConvertTo-Json) -Uri $testURI | ConvertTo-Json) | Should -Be (@{result = 20} | ConvertTo-Json)
        }
    }
}

Describe "Weather Checks"{
    Context "Weather API Checks" {
        It "Reston returns data"{
            $testURI = "$($URI)/weather/reston"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Not -BeNullOrEmpty
        }
        It "Atlanta returns data"{
            $testURI = "$($URI)/weather/atlanta"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Not -BeNullOrEmpty
        }
        It "St. Louis returns data"{
            $testURI = "$($URI)/weather/stlouis"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Not -BeNullOrEmpty
        }
        It "Seattle returns data"{
            $testURI = "$($URI)/weather/ksea"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Not -BeNullOrEmpty
        }
    }
}
Describe "Greet Checks"{
    Context "Greet API Checks" {
        It "Returns Hello "{
            $testURI = "$($URI)/greet/hello/Pester"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Be (@{Salutation = 'Hello Pester'} | ConvertTo-Json)
        }
        It "Returns Goodbye "{
            $testURI = "$($URI)/greet/goodbye/Pester"
            (Invoke-RestMethod $testURI | ConvertTo-Json) | Should -Be (@{Salutation = 'Goodbye Pester'} | ConvertTo-Json)
        }
    }
}



