# ==========================================
# DEPLOY TI - PREFEITURA DE OLINDA
# VERSÃO 1.0
# ==========================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ==========================================
# FORMULÁRIO
# ==========================================

$form = New-Object System.Windows.Forms.Form
$form.Text = "DEPLOY TI - PREFEITURA DE OLINDA"
$form.Size = New-Object System.Drawing.Size(700,650)
$form.StartPosition = "CenterScreen"
$form.BackColor = "#1e1e1e"
$form.ForeColor = "White"
$form.Font = New-Object System.Drawing.Font("Segoe UI",10)

# ==========================================
# TÍTULO
# ==========================================

$title = New-Object System.Windows.Forms.Label
$title.Text = "DEPLOY TI - PREFEITURA DE OLINDA"
$title.AutoSize = $true
$title.Font = New-Object System.Drawing.Font("Segoe UI",16,[System.Drawing.FontStyle]::Bold)
$title.Location = New-Object System.Drawing.Point(150,20)
$form.Controls.Add($title)

# ==========================================
# SECRETARIAS
# ==========================================

$secretarias = @{
    "SEFAZ" = "S1"
    "SGPA" = "S2"
    "SEGOV" = "S3"
    "SEDEIT" = "S4"
    "PGM" = "S5"
}

# ==========================================
# SETORES
# ==========================================

$setores = @{
    "ALMOXARIFADO" = "S1"
    "CGI" = "S2"
    "DPSA" = "S3"
    "DGAF" = "S4"
}

# ==========================================
# EQUIPAMENTOS
# ==========================================

$equipamentos = @{
    "PC" = "PC"
    "NOTEBOOK" = "NTBK"
    "IMPRESSORA" = "PRT"
    "SMARTPHONE" = "STPH"
    "TABLET" = "TBLT"
}

# ==========================================
# IMPRESSORAS
# ==========================================


# ==========================================
# DRIVERS DE IMPRESSORA
# ==========================================

$impressoras = @(
    "OKI ES4172",
    "OKI ES5112",
    "KYOCERA M3550",
    "KYOCERA M2040",
    "KYOCERA M2640",
    "KYOCERA M2035"
)


# ==========================================
# FUNCAO LABEL
# ==========================================

function New-Label {
    param($text,$x,$y)

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $text
    $label.Location = New-Object System.Drawing.Point($x,$y)
    $label.AutoSize = $true
    $form.Controls.Add($label)
}

# ==========================================
# FUNCAO COMBOBOX
# ==========================================

function New-ComboBox {
    param($x,$y,$items)

    $combo = New-Object System.Windows.Forms.ComboBox
    $combo.Location = New-Object System.Drawing.Point($x,$y)
    $combo.Size = New-Object System.Drawing.Size(250,30)
    $combo.DropDownStyle = "DropDownList"

foreach($item in $items){
    [void]$combo.Items.Add($item)
}

    $form.Controls.Add($combo)

    return $combo
}

# ==========================================
# CAMPOS
# ==========================================

New-Label "Secretaria:" 40 90
$comboSecretaria = New-ComboBox 200 85 $secretarias.Keys

New-Label "Setor:" 40 140
$comboSetor = New-ComboBox 200 135 $setores.Keys

New-Label "Equipamento:" 40 190
$comboEquipamento = New-ComboBox 200 185 $equipamentos.Keys

New-Label "Tipo:" 40 240

$comboTipo = New-Object System.Windows.Forms.ComboBox
$comboTipo.Location = New-Object System.Drawing.Point(200,235)
$comboTipo.Size = New-Object System.Drawing.Size(250,30)
$comboTipo.DropDownStyle = "DropDownList"
[void]$comboTipo.Items.Add("LOCADO")
[void]$comboTipo.Items.Add("PROPRIO")
$form.Controls.Add($comboTipo)

New-Label "Numero:" 40 290

$txtNumero = New-Object System.Windows.Forms.TextBox
$txtNumero.Location = New-Object System.Drawing.Point(200,285)
$txtNumero.Size = New-Object System.Drawing.Size(250,30)
$form.Controls.Add($txtNumero)


# ==========================================
# IMPRESSORA
# ==========================================

New-Label "Driver Impressora:" 40 340
$comboImpressora = New-ComboBox 200 335 $impressoras

# ==========================================
# IP DA IMPRESSORA
# ==========================================

New-Label "IP Impressora:" 40 390

$txtIPImpressora = New-Object System.Windows.Forms.TextBox
$txtIPImpressora.Location = New-Object System.Drawing.Point(200,385)
$txtIPImpressora.Size = New-Object System.Drawing.Size(250,30)
$form.Controls.Add($txtIPImpressora)


# ==========================================
# DOM�NIO
# ==========================================

New-Label "Usu�rio AD:" 40 450

$txtUser = New-Object System.Windows.Forms.TextBox
$txtUser.Location = New-Object System.Drawing.Point(200,445)
$txtUser.Size = New-Object System.Drawing.Size(250,30)
$form.Controls.Add($txtUser)

New-Label "Senha:" 40 500

$txtPass = New-Object System.Windows.Forms.TextBox
$txtPass.Location = New-Object System.Drawing.Point(200,495)
$txtPass.Size = New-Object System.Drawing.Size(250,30)
$txtPass.UseSystemPasswordChar = $true
$form.Controls.Add($txtPass)


# ==========================================
# NOME GERADO
# ==========================================

$lblNome = New-Object System.Windows.Forms.Label
$lblNome.Location = New-Object System.Drawing.Point(40,500)
$lblNome.Size = New-Object System.Drawing.Size(600,30)
$lblNome.Font = New-Object System.Drawing.Font("Segoe UI",12,[System.Drawing.FontStyle]::Bold)
$form.Controls.Add($lblNome)

# ==========================================
# BOTÃO GERAR
# ==========================================

$btnGerar = New-Object System.Windows.Forms.Button
$btnGerar.Text = "GERAR NOME"
$btnGerar.Location = New-Object System.Drawing.Point(500,85)
$btnGerar.Size = New-Object System.Drawing.Size(140,40)
$form.Controls.Add($btnGerar)

$btnGerar.Add_Click({

    $sec = $secretarias[$comboSecretaria.SelectedItem]
    $set = $setores[$comboSetor.SelectedItem]
    $equip = $equipamentos[$comboEquipamento.SelectedItem]

    if($comboTipo.SelectedItem -eq "LOCADO"){
        $tipo = "1"
    } else {
        $tipo = "2"
    }

    $numero = $txtNumero.Text

    $global:nomePC = "$sec$set$equip$tipo" + "N$numero"

    $lblNome.Text = "Nome gerado: $global:nomePC"
})

# ==========================================
# BOTÃO IMPLANTAR
# ==========================================

$btnImplantar = New-Object System.Windows.Forms.Button
$btnImplantar.Text = "IMPLANTAR"
$btnImplantar.Location = New-Object System.Drawing.Point(500,140)
$btnImplantar.Size = New-Object System.Drawing.Size(140,60)
$btnImplantar.BackColor = "#0078D7"
$form.Controls.Add($btnImplantar)

$btnImplantar.Add_Click({

    try {

        # ==========================================
        # RENOMEAR COMPUTADOR
        # ==========================================

        Rename-Computer -NewName $global:nomePC -Force

        # ==========================================
        # INSTALAR CHROME
        # ==========================================

        Start-Process ".\Apps\ChromeSetup.exe" -ArgumentList "/silent /install" -Wait

        # ==========================================
        # JAVA
        # ==========================================

        Start-Process "msiexec.exe" -ArgumentList '/i ".\Apps\Java.msi" /quiet' -Wait

        # ==========================================
        # LIBREOFFICE
        # ==========================================

        Start-Process "msiexec.exe" -ArgumentList '/i ".\Apps\LibreOffice.msi" /quiet' -Wait

        # ==========================================
        # GLPI AGENT
        # ==========================================

        Start-Process "msiexec.exe" -ArgumentList '/i ".\Apps\GLPI-Agent-1.7.1-x64.msi" /quiet RUNNOW=1 SERVER=http://192.168.8.100/front/inventory.php' -Wait

        # ==========================================
        # ANYDESK
        # ==========================================

        Start-Process ".\Apps\AnyDesk.exe" -ArgumentList "--install `"C:\Program Files (x86)\AnyDesk`" --silent" -Wait

        # ==========================================
        # GOOGLE DRIVE
        # ==========================================

        Start-Process ".\Apps\GoogleDriveSetup.exe" -ArgumentList "--silent" -Wait

        # ==========================================
        # SMB SCAN
        # ==========================================

        New-Item -Path "C:\SCAN" -ItemType Directory -Force

        New-SmbShare -Name "SCAN" -Path "C:\SCAN" -FullAccess "Everyone"

        Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

        # ==========================================
        # IMPRESSORA
        # ==========================================

        $printerName = $comboImpressora.SelectedItem
        $printerIP = $txtIPImpressora.Text

        Add-PrinterPort -Name "IP_$printerIP" -PrinterHostAddress $printerIP

        # ==========================================
        # DOMÍNIO
        # ==========================================

        $securePassword = ConvertTo-SecureString $txtPass.Text -AsPlainText -Force

        $cred = New-Object System.Management.Automation.PSCredential(
            $txtUser.Text,
            $securePassword
        )

        Add-Computer `
            -DomainName "olinda.internal.pe.gov.br" `
            -Credential $cred `
            -Force

        # ==========================================
        # FINAL
        # ==========================================

        [System.Windows.Forms.MessageBox]::Show(
            "Implantação concluída com sucesso.`nO computador será reiniciado.",
            "SUCESSO"
        )

        Restart-Computer -Force

    }
    catch {

        [System.Windows.Forms.MessageBox]::Show(
            $_.Exception.Message,
            "ERRO"
        )
    }
})

# ==========================================
# ABRIR
# ==========================================

$form.Topmost = $true
$form.Add_Shown({$form.Activate()})

[void] $form.ShowDialog()