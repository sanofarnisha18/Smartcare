# Get the directory where this script is executed
$BASE_DIR = $PSScriptRoot

Write-Host "Starting Smart Care full-stack services..." -ForegroundColor Green

# 1. Start Auth Service
Write-Host "Launching Auth Service on Port 8081..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$BASE_DIR\auth-service'; & '..\maven\apache-maven-3.9.8\bin\mvn.cmd' spring-boot:run"

# 2. Start Health Service
Write-Host "Launching Health Service on Port 8082..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$BASE_DIR\health-service'; & '..\maven\apache-maven-3.9.8\bin\mvn.cmd' spring-boot:run"

# 3. Start Frontend
Write-Host "Launching React Frontend (Vite)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$BASE_DIR\project'; npm run dev"

Write-Host "All services have been launched in separate terminal windows." -ForegroundColor Green
