#!/bin/bash

# URLs das músicas no YouTube
declare -A songs=(
  # ["04_isadora_pompeo-hey_pai"]="https://www.youtube.com/watch?v=YL_U6blwqyk"
  # ["05_aline_barros-autor_da_minha_vida"]="https://www.youtube.com/watch?v=4DFBOuQQi1s"
  # ["06_isaias_saad-bondade"]="https://www.youtube.com/watch?v=mZ9yZYo9Mmk"
  # ["07_cancao_e_louvor-sossega"]="https://www.youtube.com/watch?v=d8qRZpRTtA0"
  # ["08_fernandinho-galileu"]="https://www.youtube.com/watch?v=Vx5OQsP9lJM"
  ["09_isadora_pompeo-sao_bencaos"]="https://www.youtube.com/watch?v=Xq_07hEF2AQ"
  # ["10_casa_worship-a_casa_e_sua"]="https://www.youtube.com/watch?v=5QHF5OQeFOs"
  # ["11_casa_worship-eu_te_vejo_em_tudo"]="https://www.youtube.com/watch?v=SFiu3KLNd34"
  # ["12_bianca_e_fernandinho-yeshua"]="https://www.youtube.com/watch?v=5z28salONNg"
  # ["13_anderson_freire-raridade"]="https://www.youtube.com/watch?v=WdYO0JtOm0A"
  # ["14_saulo_holz-acalma_o_meu_coracao"]="https://www.youtube.com/watch?v=hKSmr_vuewQ"
  # ["15_jaiser_maia-espirito_enche_a_minha_vida"]="https://www.youtube.com/watch?v=cTTS8ZaBxYg"
  # ["16_stella-carta_de_deus"]="https://www.youtube.com/watch?v=TBX8d_7M4_A"
  # ["17_isadora_pompeo-ovelhinha"]="https://www.youtube.com/watch?v=OEDQj7XucHg"
  # ["18_stella-conta_pra_mim"]="https://www.youtube.com/watch?v=l72PWUdEJ2U"
  # ["19_pedro_e_misaias-vai_ser_tao_lindo"]="https://www.youtube.com/watch?v=laerPZDrA7o"
  # ["20_oceanos_instrumental"]="https://www.youtube.com/watch?v=VZ1EUDRZZjE"
  # ["21_so_tu_es_santo_instrumental"]="https://www.youtube.com/watch?v=AihEYOMRcQI"
  # ["22_quem_ja_pisou_instrumental"]="https://www.youtube.com/watch?v=4sFuwh1c_SU"
)

# Diretório de destino
DEST_DIR="/musicas"

# Baixar as músicas
for song in "${!songs[@]}"; do
  echo "Baixando: $song"
  yt-dlp -x --audio-format mp3 -o "$DEST_DIR/$song.%(ext)s" "${songs[$song]}"
done

echo "Download concluído!"