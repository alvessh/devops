# script desenvolvido na formação de TI credip/dotum

Função para checar se um programa já está instalado
function Verificar-Instalacao {
    param ($nomePrograma)
    $app = Get-Command $nomePrograma -ErrorAction SilentlyContinue
    if ($app) {
        Write-Output "$nomePrograma já está instalado."
        return $true
    }
    return $false
}

#Instalação do Visual Studio Code
function Instalar-VSCode {
    if (!(Verificar-Instalacao "code")) {
        Write-Output "Instalando Visual Studio Code..."
        $vscodeUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
        $vscodeInstaller = "$env:TEMP\VSCodeSetup.exe"
        Invoke-WebRequest -Uri $vscodeUrl -OutFile $vscodeInstaller -UseBasicParsing
        Start-Process -FilePath $vscodeInstaller -ArgumentList "/silent" -Wait
        Remove-Item $vscodeInstaller
        Write-Output "Visual Studio Code instalado com sucesso!"
    }
}

#Instalação do Apache Hop (usando Docker)
function Instalar-ApacheHop {
    if (!(Verificar-Instalacao "docker")) {
        Write-Output "Docker não encontrado. Por favor, instale o Docker antes de prosseguir com o Apache Hop."
        return
    }
    
    Write-Output "Instalando Apache Hop usando Docker..."
    docker run -d --name apache-hop -p 8080:8080 apache/hop
    Write-Output "Apache Hop instalado com sucesso e em execução na porta 8080!"
}

Instalar-VSCode
Instalar-ApacheHop