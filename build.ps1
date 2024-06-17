Write-Host "Attempting to stop any existing containers"
try {
    docker stop devPostgres
}
catch {
    Write-Host "Container devPostgres has already been stopped or does not exist"
}

Write-Host "Attempting to delete any existing containers"
try {
    docker rm devPostgres
}
catch {
    Write-Host "Container devPostgres does not exist"
}

$imageHash = $null
Write-Host "Creating docker image"
try {
    $imageHash = docker build . --quiet
}
catch {
    Write-Host "Failed to create docker image"
}

Start-Sleep -Seconds 5

Write-Host "Starting docker container"
try {
    docker run -d --name devPostgres -p 5432:5432 -e POSTGRES_PASSWORD=start123 $imageHash
}
catch {
    Write-Host "Failed to start docker container"
}

Start-Sleep -Seconds 5

Write-Host "Execute Liquibase Commands"
try {
    $containerIp = docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' devPostgres
    cd liquibase

    ./liquibase update --driver=org.postgresql.Driver --url=jdbc:postgresql://$containerIp:5432/liquibased1?currentSchema=lqbexample --username=postgres --password=start123 --classpath=postgresql-42.5.1.jar --changelog-file=../changelog/Data_Architecture/versions/2024-06-14-v1.0.0/Schemas/lqbexample/db.changelog.lqbexample-v1.0.0.sql


}
catch {
    Write-Host "Failed to execute liquibase commands"
}

Write-Host "devPostgres container initialized"
