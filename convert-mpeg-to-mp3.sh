#!/bin/bash

# Define o diretório de origem e o diretório de destino
diretorio_origem="$HOME/Downloads/musica"
diretorio_destino="$HOME/Downloads/musica-convertida"

# Navega até o diretório de origem
cd "$diretorio_origem"

# Loop através de todos os arquivos .mpeg no diretório de origem
for arquivo in *.mpeg; do
    # Extrai o nome do arquivo sem a extensão .mpeg
    nome_arquivo="${arquivo%.*}"

    # Define o nome do arquivo MP3 de saída
    arquivo_saida="$diretorio_destino/$nome_arquivo.mp3"

    # Executa a conversão do arquivo MPEG para MP3 usando o FFmpeg
    ffmpeg -i "$arquivo" -vn -acodec libmp3lame "$arquivo_saida"
done

echo "Conversão concluída!"
