# Baixar Músicas com Docker

Este projeto utiliza Docker para baixar músicas do YouTube usando `yt-dlp` e `ffmpeg`. As músicas são baixadas no formato MP3 e salvas em um diretório local especificado.

## Pré-requisitos

- Docker instalado na sua máquina.

## Instruções

### Passo 1: Clonar o Repositório

Clone este repositório para o seu diretório local:

```bash
git clone https://github.com/seu-usuario/baixar-musicas.git
cd baixar-musicas
```

### Passo 2: Atualizar URLs das Músicas

No arquivo [`baixar_musicas.sh`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2FUsers%2Fpedrowesley%2FDocuments%2FScripts%2Fyoutube-dl-download%2Fbaixar_musicas.sh%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%5D "/Users/pedrowesley/Documents/Scripts/youtube-dl-download/baixar_musicas.sh"), atualize as URLs com os endereços reais das músicas que deseja baixar do YouTube:

```sh
#!/bin/bash

# URLs das músicas no YouTube
declare -A songs=(
  ["04_isadora_pompeo-hey_pai"]="URL_1"
  ["05_aline_barros-autor_da_minha_vida"]="URL_2"
  # Adicione ou atualize as entradas conforme necessário
)

# Diretório de destino
DEST_DIR="/musicas"

# Baixar as músicas
for song in "${!songs[@]}"; do
  echo "Baixando: $song"
  yt-dlp -x --audio-format mp3 -o "$DEST_DIR/%(title)s.%(ext)s" "${songs[$song]}"
done

echo "Download concluído!"
```

### Passo 3: Construir a Imagem Docker

Construa a imagem Docker com o seguinte comando:

```bash
docker build -t baixar-musicas .
```

### Passo 4: Executar o Contêiner Docker

Execute o contêiner Docker para iniciar o download das músicas:

```bash
docker run --rm -v $(pwd)/musicas:/musicas baixar-musicas
```

### Passo 5: Verificar os Arquivos Baixados

As músicas baixadas estarão disponíveis no diretório `musicas` no seu sistema de arquivos local.

## Estrutura do Projeto

```
baixar-musicas/
├── Dockerfile
├── README.md
└── baixar_musicas.sh
```

## Notas

- Substitua os placeholders das URLs no script `baixar_musicas.sh` pelos URLs reais das músicas desejadas.
- O `ffmpeg` é utilizado para a conversão de vídeo para áudio e é instalado automaticamente pelo Dockerfile.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.
