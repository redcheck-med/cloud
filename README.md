# Serviço de FTP RedCheck

## Configuração

- [Servidor](./servidor/README.md)
- [Cliente](./cliente/README.md)

> [!IMPORTANT]
> Para que o sistema funciona como previsto, o cliente deve realizar a separar os
> arquivos em pastas por tipo de exame configuração, e fazer o mapeamento dessas pastas
> na plataforma da RedCheck.

## Busca dos arquivos na plataforma

> [!WARNING]
> Para que a busca dos arquivos funciona na plataforma, nomes dos arquivos devem seguir a padronização:
> `<Nome Sobrenome>_<LATERALIDADE>_<Data de nascimento>.ext`.
>
> Onde:
>
> - `<Nome Sobrenome>`: nome e sobrenomes do paciente separados por espaço, conforme cadastrado na plataforma;
> - `<LATERALIDADE>`: lateralidade do arquivo, ou seja, `OD` ou `OE`;
> - `<Data de nascimento>`: data de nascimento do paciente deve estar no formato: `YYYYMMDD`,
> ou seja, 4 dígitos para o ano, seguidos de 2 dígitos para o mês, e 2 dígitos para o dia.
>
> 💡 Para arquivos DICOM, isso pode ser depensado caso estas informações dados estejam presentes nos metadados do arquivo.
