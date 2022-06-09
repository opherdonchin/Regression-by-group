$env_file = $args[0]

# Stop if no arguments
if ($args.Length -ne 1 -Or $args[0].GetType().Name -ne 'String') {
    Write-Host "Please provide one argument: the path to an environment.yml file." -BackgroundColor DarkYellow -ForegroundColor White
    exit
}
# Stop if file does not exist
if (Test-Path $env_file -PathType Leaf) { }
else {
    Write-Host "$env_file does not exist" -BackgroundColor DarkYellow -ForegroundColor White
    exit
}
# Get the environment name
$first_line = Get-Content -Head 1 $env_file  # This returns "name: conda_env_name"
$env_name = $first_line.Split(": ")[-1]  # This splits it into an array of [name, : , conda_env_name] and takes the last element

# Check if it already exists
$environments_file = "$Env:USERPROFILE\.conda\environments.txt"
$all_environments = Get-Content $environments_file | Where-Object { $_ -iMatch 'envs' } | ForEach-Object { $($_ -Split '\\')[-1] }

if ($env_name -in $all_environments) {
    Write-Host "A conda environment with the name $env_name already exists." -BackgroundColor DarkYellow -ForegroundColor White
    exit
}

# Create an empty conda environment, activate and install with mamba for speed
Write-Output "Creating empty environment $env_name"
conda create --name $env_name --no-default-packages -y | Out-Null
conda activate $env_name
Write-Output "Installing requested packages with mamba"
mamba env update --name $env_name --file $env_file