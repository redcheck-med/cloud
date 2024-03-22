# Sincronização com servidor FTP RedCheck

Para sincronização de pastas em computadores Windows recomendamos o uso do [WinSCP](https://winscp.net/eng/download.php).

## 1. Configuration WinSCP

## Dados do servidor FTP

Configuração do WinSCP:
    - Host: `ftp.redcheck.com.br`
    - Porta: 21
    - Usuário: ...
    - Senha: ...
    - Encriptação: selecionar a opção "Sem criptografia"

Conforme figura abaixo:

![WinSCP login](./assets/winscp_login.png)

### 2. Sincronização automática

1. Verifique os valores da variáveis no script de sincronização [sync_ftp.cmd](./sync_ftp.cmd).
2. Execute o script.

## Executar sincronização da inicialização do sistema

Crie um link para o arquivo [run_sync.vbs](./run_sync.vbs) e coloque-o em `%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`.

## Referências

- <https://superuser.com/questions/954950/run-a-script-on-start-up-on-windows-10>
- <https://windowsloop.com/run-powershell-script-on-startup>
