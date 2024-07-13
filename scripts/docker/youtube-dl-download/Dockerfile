# Use a imagem base oficial do Python
FROM python:3.9-slim

# Instale yt-dlp e ffmpeg
RUN apt-get update && apt-get install -y ffmpeg && pip install yt-dlp

# Crie um diretório para os arquivos de música
RUN mkdir /musicas

# Defina o diretório de trabalho
WORKDIR /app

# Copie o script para o contêiner
COPY baixar_musicas.sh .

# Torne o script executável
RUN chmod +x baixar_musicas.sh

# Comando para executar o script
CMD ["./baixar_musicas.sh"]
