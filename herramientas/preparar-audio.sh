#!/usr/bin/env bash
# Convierte cualquier grabación (m4a, WhatsApp .opus, wav, mp3) en un MP3
# liviano y con volumen uniforme, listo para la biblioteca.
# Uso:  ./herramientas/preparar-audio.sh entrada.m4a proyectos/memorias-vivas-mumbu/estacion-01.mp3
# Requiere ffmpeg.
set -euo pipefail
in="$1"; out="$2"
ffmpeg -hide_banner -loglevel error -y -i "$in" \
  -af "highpass=f=80,loudnorm=I=-16:TP=-1.5:LRA=11,silenceremove=start_periods=1:start_threshold=-50dB" \
  -ac 1 -ar 44100 -codec:a libmp3lame -b:a 64k "$out"
d=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$out")
echo "Listo: $out ($(( $(stat -c%s "$out") / 1024 )) KB, ${d%.*} s)"
