#!/bin/bash
# Corrige o diretório para /medias
MEDIA_DIR="/medias"
echo "Iniciando a conversão de arquivos MPEG para MP3..."

# Encontra todos os arquivos .mpeg no diretório
shopt -s nullglob
mpeg_files=("$MEDIA_DIR"/*.mpeg)

# Verifica se existem arquivos .mpeg para processar
if [ ${#mpeg_files[@]} -eq 0 ]; then
  echo "Nenhum arquivo MPEG encontrado em $MEDIA_DIR para conversão."
else
  # Processa cada arquivo .mpeg encontrado
  for file in "${mpeg_files[@]}"; do
    if [ -f "$file" ]; then
      name_with_extension="${file##*/}"
      base_name="${name_with_extension%.mpeg}"
      echo "Convertendo: $file para ${base_name}.mp3"
      # Adiciona verificação de erro
      if ! ffmpeg -i "$file" "$MEDIA_DIR/${base_name}.mp3" 2>/dev/null; then
        echo "Erro ao converter $file"
      fi
    else
      echo "Arquivo não encontrado: $file"
    fi
  done
  echo "Conversão concluída!"
fi