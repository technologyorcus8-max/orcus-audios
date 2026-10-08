# Biblioteca de Voces ORCUS

Archivo central de audios de los proyectos de ORCUS Technology, servido gratis por GitHub Pages:

- Página de la biblioteca: https://technologyorcus8-max.github.io/orcus-audios/
- Catálogo que leen las apps: https://technologyorcus8-max.github.io/orcus-audios/catalogo.json

## Estructura

```
catalogo.json                 Lista de proyectos y pistas (lo leen las apps)
index.html                    Página para explorar y escuchar la biblioteca
proyectos/<id-proyecto>/      Un folder por proyecto con sus MP3
herramientas/preparar-audio.sh  Convierte cualquier grabación a MP3 liviano y normalizado
```

## Cada pista en `catalogo.json`

| Campo | Qué es |
|---|---|
| `id` | Identificador que usa la app (ej. `estacion-01`) |
| `titulo`, `narrador`, `duracion` | Datos que se muestran |
| `archivo` | Ruta del MP3 dentro de este repositorio |
| `estado` | `pendiente` (sin grabar) o `publicado` (la app lo reproduce) |
| `consentimiento` | `true` solo si hay consentimiento firmado de uso de voz |

Mientras una pista esté `pendiente`, la app de Memorias Vivas lee la transcripción con la voz del
teléfono, marcada como **voz sintética de demostración**.

## Agregar una grabación

```bash
./herramientas/preparar-audio.sh grabacion.m4a proyectos/memorias-vivas-mumbu/estacion-01.mp3
# editar catalogo.json -> "estado": "publicado", "consentimiento": true
git add -A && git commit -m "Audio estación 01" && git push
```

Formato recomendado: MP3 mono 64 kbps (2:30 min ≈ 1,2 MB).

## Agregar un proyecto nuevo

1. Cree `proyectos/<id-proyecto>/`.
2. Agregue un objeto en `proyectos` dentro de `catalogo.json` con su `id`, `nombre` y `pistas`.
3. En la app del proyecto, apunte a `https://technologyorcus8-max.github.io/orcus-audios/` y use su `id`.

## Límites de GitHub Pages
100 MB por archivo y alrededor de 1 GB por repositorio; suficiente para cientos de relatos en MP3 de 64 kbps.
Si la biblioteca crece más, se puede mover a Cloudflare R2 o Firebase Storage cambiando solo la dirección base en cada app.
