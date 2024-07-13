### Passo 1: Criar o Diretório de Trabalho

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
docker run --rm -v $(pwd)/medias:/medias converter-mpeg-mp3
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
