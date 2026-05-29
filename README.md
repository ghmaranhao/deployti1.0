# DeployTI

Sistema de implantação automatizada para computadores Windows utilizando PowerShell e Provisioning Package (.ppkg).

O objetivo do projeto é padronizar a preparação de computadores em ambientes públicos, corporativos e empresariais, automatizando tarefas como:

- Renomear computadores
- Instalar programas padrão
- Entrar no domínio Active Directory
- Configurar SMB Scan
- Preparar instalação de impressoras TCP/IP
- Instalar GLPI Agent
- Reduzir tempo de implantação

--------------------------------------------------

# Funcionalidades

## Interface gráfica

O sistema possui interface gráfica desenvolvida em PowerShell Windows Forms.

Permite selecionar:

- Secretaria, empresa ou departamento
- Setor
- Tipo de equipamento
- Tipo do patrimônio
- Número do equipamento
- Driver/modelo da impressora
- IP da impressora
- Usuário do Active Directory

--------------------------------------------------

# Geração automática de nome do computador

Exemplo:

S1S2PC1N14

Estrutura:

S1  = Secretaria/Empresa
S2  = Setor
PC  = Tipo do equipamento
1   = Tipo do patrimônio
N14 = Número do equipamento

--------------------------------------------------

# Instalação automática de softwares

O sistema instala automaticamente:

- Google Chrome
- Java
- GLPI Agent
- AnyDesk
- LibreOffice
- Google Drive

--------------------------------------------------

# Active Directory

Integração com domínio AD:

- Renomeia computador
- Entra no domínio
- Utiliza credenciais informadas pelo técnico

--------------------------------------------------

# SMB Scan

Configura automaticamente:

- Pasta C:\SCAN
- Compartilhamento SMB
- Firewall para compartilhamento

--------------------------------------------------

# Impressoras TCP/IP

Compatível com impressoras:

- OKI ES4172LP
- OKI ES5112
- KYOCERA M3550
- KYOCERA M2040
- KYOCERA M2640
- KYOCERA M2035dn

--------------------------------------------------

# Estrutura do Projeto

DEPLOY-TI/
│
├── DeployTI.ps1
├── IniciarDeploy.bat
│
├── Apps/
│   ├── ChromeSetup.exe
│   ├── Java.msi
│   ├── AnyDesk.exe
│   ├── LibreOffice.msi
│   ├── GoogleDriveSetup.exe
│   └── GLPI-Agent-1.7.1-x64.msi

--------------------------------------------------

# Como usar

## 1. Preparar o pendrive

Formatar preferencialmente em:

FAT32

ou

NTFS

--------------------------------------------------

## 2. Colocar os arquivos

Copiar toda a estrutura do projeto para o pendrive.

--------------------------------------------------

## 3. Instalar o Windows

Instalar normalmente o Windows 10 ou Windows 11.

--------------------------------------------------

## 4. Executar o DeployTI

Após entrar na área de trabalho:

Abrir a pasta:

DEPLOY-TI

Executar:

IniciarDeploy.bat

--------------------------------------------------

# O que o sistema fará

Automaticamente:

- Abre PowerShell como administrador
- Libera execução temporária de scripts
- Executa o DeployTI.ps1
- Abre interface gráfica

Após clicar em IMPLANTAR:

- Renomeia computador
- Instala aplicativos
- Configura SMB Scan
- Instala GLPI Agent
- Entra no domínio
- Reinicia o computador

--------------------------------------------------

# Requisitos

- Windows 10 ou Windows 11
- PowerShell
- Permissão administrativa
- Conexão de rede
- Instaladores dos aplicativos na pasta Apps

--------------------------------------------------

# Objetivo do Projeto

Este projeto foi desenvolvido para:

- Reduzir tempo de implantação
- Padronizar computadores
- Automatizar tarefas repetitivas
- Facilitar trabalho da equipe de TI
- Diminuir erros manuais

--------------------------------------------------

# Observações

Este projeto está em desenvolvimento contínuo e foi criado inicialmente com foco em automação de implantação de computadores em ambientes públicos.

Apesar disso, o sistema pode ser facilmente adaptado para:

- Empresas privadas
- Ambientes corporativos
- Escritórios
- Laboratórios
- Escolas
- Redes empresariais
- Pequenas e grandes organizações

Toda a estrutura do projeto foi desenvolvida de forma modular justamente para permitir personalizações conforme a necessidade de cada ambiente.

O código está totalmente aberto para modificações e adaptações.

Você pode facilmente:

- Adicionar novos aplicativos
- Remover programas
- Alterar comandos de instalação
- Modificar padrões de nomenclatura
- Adicionar novos setores
- Integrar novos sistemas
- Personalizar a interface gráfica
- Adaptar para outros domínios Active Directory
- Criar novos perfis de implantação
- Adaptar para qualquer estrutura organizacional

O objetivo do projeto é servir como uma base para automação de implantação Windows em diversos ambientes.

--------------------------------------------------

# Sobre as Impressoras

Na versão atual (V1.0), o script ainda NÃO realiza a instalação completa das impressoras automaticamente.

Apesar da interface já possuir a opção de seleção de drivers/modelos de impressora e campo para informar IP manualmente, a instalação automática dos drivers e configuração total da impressora ainda está em desenvolvimento.

Atualmente, o sistema:

- Seleciona o modelo/driver da impressora
- Permite informar IP manualmente
- Prepara a estrutura para futura automação

Porém, a instalação completa do driver ainda não está funcional nesta versão.

A implementação completa das impressoras será adicionada em futuras versões do projeto.

--------------------------------------------------

# Melhorias Futuras

- Instalação automática de drivers
- Barra de progresso
- Logs detalhados
- Integração com inventário
- Integração Zabbix
- Perfis por setor
- Instalação automática de impressoras
- Provisionamento via .ppkg
- Integração MDT/WDS

--------------------------------------------------

# Contribuições

Sugestões, melhorias e adaptações são bem-vindas.

O projeto foi desenvolvido com estrutura modular justamente para facilitar futuras implementações e customizações.

--------------------------------------------------

# Aviso

Este projeto foi desenvolvido para ambientes públicos, corporativos e laboratórios de TI.

Recomenda-se sempre testar em ambiente de homologação antes de utilizar em produção.

--------------------------------------------------

# Licença

Projeto de uso educacional e corporativo.
