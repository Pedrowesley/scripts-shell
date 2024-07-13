### Passo 1: Criar o Diretório de Trabalho

Crie um novo diretório para este projeto e navegue até ele:

```bash
mkdir converter-mpeg-mp3
cd converter-mpeg-mp3
```

### Passo 2: Criar o Dockerfile

Crie um arquivo chamado `Dockerfile` e adicione o seguinte conteúdo:

```Dockerfile
# Use a imagem base oficial do Python
FROM python:3.9-slim

# Instale ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Crie um diretório para os arquivos
RUN mkdir /media

# Defina o diretório de trabalho
WORKDIR /app

# Copie o script para o contêiner
COPY converter.sh .

# Torne o script executável
RUN chmod +x converter.sh

# Comando para executar o script
CMD ["./converter.sh"]
```

### Passo 3: Criar o Script `converter.sh`

No mesmo diretório, crie um arquivo chamado `converter.sh` e adicione o seguinte conteúdo:

```sh
#!/bin/bash

# Diretório de mídia
MEDIA_DIR="/media"

# Verifique e converta arquivos MPEG para MP3
for file in "$MEDIA_DIR"/*.mpeg; do
  if [ -f "$file" ]; then
    base_name=$(basename "$file" .mpeg)
    ffmpeg -i "$file" "$MEDIA_DIR/${base_name}.mp3"
  fi
done

echo "Conversão concluída!"
```

### Passo 4: Construir a Imagem Docker

No terminal, certifique-se de estar no diretório que contém o `Dockerfile` e o script `converter.sh`. Em seguida, construa a imagem Docker:

```bash
docker build -t converter-mpeg-mp3 .
```

### Passo 5: Executar o Contêiner Docker

Execute o contêiner Docker para converter os arquivos MPEG em MP3. O parâmetro `-v $(pwd):/media` monta o diretório atual no contêiner, para que os arquivos sejam convertidos dentro do seu sistema de arquivos local:

```bash
docker run --rm -v $(pwd)/medias:/medias converter-mpeg-mp3
```

### Passo 6: Verificar os Arquivos Convertidos

Após a execução do contêiner, você encontrará os arquivos MP3 convertidos no diretório atual.

### README.md

Aqui está um exemplo de README para o seu projeto:

````markdown
# Converter MPEG para MP3 com Docker

Este projeto utiliza Docker para converter todos os arquivos MPEG em um diretório em arquivos MP3 usando `ffmpeg`.

## Pré-requisitos

- Docker instalado na sua máquina.

## Instruções

### Passo 1: Clonar o Repositório

Clone este repositório para o seu diretório local:

```bash
git clone https://github.com/seu-usuario/converter-mpeg-mp3.git
cd converter-mpeg-mp3
```
````

### Passo 2: Colocar os Arquivos MPEG no Diretório

Coloque os arquivos MPEG que você deseja converter no diretório clonado.

### Passo 3: Construir a Imagem Docker

Construa a imagem Docker executando o seguinte comando no terminal:

```bash
docker build -t converter-mpeg-mp3 .
```

### Passo 4: Executar o Contêiner Docker

Execute o contêiner Docker para converter os arquivos MPEG em MP3:

```bash
docker run --rm -v $(pwd):/media converter-mpeg-mp3
```

### Passo 5: Verificar os Arquivos Convertidos

Após a execução do contêiner, você encontrará os arquivos MP3 convertidos no diretório atual.

## Estrutura do Projeto

```
converter-mpeg-mp3/
├── Dockerfile
├── README.md
└── converter.sh
```

## Notas

- Certifique-se de colocar os arquivos MPEG no diretório clonado antes de executar o contêiner Docker.
- O `ffmpeg` é utilizado para a conversão de vídeo para áudio e é instalado automaticamente pelo Dockerfile.

## Contribuição

Sinta-se à vontade para abrir problemas (issues) ou enviar pull requests para melhorias.

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para mais detalhes.