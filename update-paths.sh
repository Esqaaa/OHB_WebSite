#!/bin/bash
# ============================================================
# ORCHESTRE D'HARMONIE DE BEINHEIM
# Script de mise à jour des chemins d'images dans le HTML
# (remplace les URLs Wix CDN par les chemins locaux)
# ============================================================
# UTILISATION :
#   Lancez ce script APRÈS telecharger-images.sh
#   Placez-le à la racine du projet (ohb-v2/)
#   chmod +x update-paths.sh && ./update-paths.sh
# ============================================================

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=====================================================${NC}"
echo -e "${BLUE}  OHB — Mise à jour des chemins d'images${NC}"
echo -e "${BLUE}=====================================================${NC}"
echo ""

# Depuis html/, les photos sont à ../photos/
BASE="../photos"

echo -e "${YELLOW}→ Traitement des fichiers HTML...${NC}"

# Fonction de remplacement dans tous les fichiers HTML
replace_in_html() {
    local OLD="$1"
    local NEW="$2"
    local LABEL="$3"
    grep -rl "$OLD" html/*.html > /dev/null 2>&1 && \
        sed -i "s|$OLD|$NEW|g" html/*.html && \
        echo -e "  ${GREEN}✓${NC} $LABEL" || true
}

# ── LOGO ──────────────────────────────────────────────────
replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_f5e968ae54484f5da1b83e605621e318~mv2.png/v1/fill/w_80,h_80,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/Logo%20OHB%20transparent%20blanc.png" \
  "$BASE/logo/logo-ohb.png" \
  "Logo OHB"

# Variantes taille logo footer
replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_f5e968ae54484f5da1b83e605621e318~mv2.png/v1/fill/w_80,h_80,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/Logo%20OHB%20transparent%20blanc.png" \
  "$BASE/logo/logo-ohb.png" \
  "Logo OHB (footer)"

# ── HERO ──────────────────────────────────────────────────
replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg/v1/fill/w_1920,h_1080,al_c,q_90,enc_avif,quality_auto/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg" \
  "$BASE/hero/hero-accueil.jpg" \
  "Hero accueil (CSS background)"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg" \
  "$BASE/hero/hero-a-propos.jpg" \
  "Hero à propos"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg" \
  "$BASE/hero/hero-concerts.jpg" \
  "Hero concerts"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg" \
  "$BASE/hero/hero-galerie.jpg" \
  "Hero galerie"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_69efb9e188ae461297e960d146829512~mv2.jpeg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_69efb9e188ae461297e960d146829512~mv2.jpeg" \
  "$BASE/hero/hero-contact.jpg" \
  "Hero contact"

# ── CONCERTS ──────────────────────────────────────────────
replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_8d856f646ed24e83960fa86aa96aa875~mv2.jpeg/v1/fill/w_960,h_638,q_90,enc_avif,quality_auto/7abdd3_8d856f646ed24e83960fa86aa96aa875~mv2.jpeg" \
  "$BASE/concerts/concert-01.jpg" \
  "Concert 01"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_818d14797b51493bbc09fe3dfe8f4389~mv2.jpg/v1/fill/w_960,h_639,q_90,enc_avif,quality_auto/7abdd3_818d14797b51493bbc09fe3dfe8f4389~mv2.jpg" \
  "$BASE/concerts/concert-02.jpg" \
  "Concert 02"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg/v1/fill/w_960,h_638,q_90,enc_avif,quality_auto/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg" \
  "$BASE/concerts/concert-03.jpg" \
  "Concert 03"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg/v1/fill/w_960,h_642,q_90,enc_avif,quality_auto/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg" \
  "$BASE/concerts/concert-04.jpg" \
  "Concert 04"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg/v1/fill/w_960,h_540,q_90,enc_avif,quality_auto/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg" \
  "$BASE/concerts/concert-05.jpg" \
  "Concert 05"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_b35ff88a2b38429daf96ecce031060e5~mv2.jpg/v1/fill/w_480,h_321,q_90,enc_avif,quality_auto/7abdd3_b35ff88a2b38429daf96ecce031060e5~mv2.jpg" \
  "$BASE/concerts/concert-06.jpg" \
  "Concert 06"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_fd07ff2543204a7384147ddd19e1b19a~mv2.jpeg/v1/fill/w_480,h_319,q_90,enc_avif,quality_auto/7abdd3_fd07ff2543204a7384147ddd19e1b19a~mv2.jpeg" \
  "$BASE/concerts/concert-07.jpg" \
  "Concert 07"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg/v1/fill/w_960,h_640,q_90,enc_avif,quality_auto/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg" \
  "$BASE/concerts/concert-08.jpg" \
  "Concert 08"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_299104bb28e64ac697f83d2d34afa4ef~mv2.jpg/v1/fill/w_480,h_319,q_90,enc_avif,quality_auto/7abdd3_299104bb28e64ac697f83d2d34afa4ef~mv2.jpg" \
  "$BASE/concerts/concert-04.jpg" \
  "Concert 04 (doublon)"

# ── GALERIE ───────────────────────────────────────────────
replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_2ef0b0fbf2594ad28193e58fba477ebc~mv2.jpeg/v1/fill/w_480,h_320,q_90,enc_avif,quality_auto/7abdd3_2ef0b0fbf2594ad28193e58fba477ebc~mv2.jpeg" \
  "$BASE/galerie/galerie-01.jpg" \
  "Galerie 01"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_68884329b4f244bd8346d57b1f81fb8a~mv2.jpg/v1/fill/w_480,h_321,q_90,enc_avif,quality_auto/7abdd3_68884329b4f244bd8346d57b1f81fb8a~mv2.jpg" \
  "$BASE/galerie/galerie-02.jpg" \
  "Galerie 02"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_fd3e67e5e2654118af6ecbbf799e7beb~mv2.jpg/v1/fill/w_480,h_320,q_90,enc_avif,quality_auto/7abdd3_fd3e67e5e2654118af6ecbbf799e7beb~mv2.jpg" \
  "$BASE/galerie/galerie-03.jpg" \
  "Galerie 03"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_9ed5c188aa954f158e3922b74ce7f812~mv2.jpeg/v1/fill/w_480,h_319,q_90,enc_avif,quality_auto/7abdd3_9ed5c188aa954f158e3922b74ce7f812~mv2.jpeg" \
  "$BASE/galerie/galerie-04.jpg" \
  "Galerie 04"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_924cad3c876c47fb8a18df29e4de078a~mv2.jpg/v1/fill/w_480,h_319,q_90,enc_avif,quality_auto/7abdd3_924cad3c876c47fb8a18df29e4de078a~mv2.jpg" \
  "$BASE/galerie/galerie-05.jpg" \
  "Galerie 05"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_736df37704dc4ab79ce21ed73d40d512~mv2.jpg/v1/fill/w_480,h_361,q_90,enc_avif,quality_auto/7abdd3_736df37704dc4ab79ce21ed73d40d512~mv2.jpg" \
  "$BASE/galerie/galerie-06.jpg" \
  "Galerie 06"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_299104bb28e64ac697f83d2d34afa4ef~mv2.jpg/v1/fill/w_480,h_319,q_90,enc_avif,quality_auto/7abdd3_299104bb28e64ac697f83d2d34afa4ef~mv2.jpg" \
  "$BASE/galerie/galerie-07.jpg" \
  "Galerie 07"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_9ced687013e8419d948c105c4a41959d~mv2.jpg/v1/fill/w_480,h_320,q_90,enc_avif,quality_auto/7abdd3_9ced687013e8419d948c105c4a41959d~mv2.jpg" \
  "$BASE/galerie/galerie-08.jpg" \
  "Galerie 08"

replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg/v1/fill/w_480,h_222,q_90,enc_avif,quality_auto/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg" \
  "$BASE/galerie/galerie-09.jpg" \
  "Galerie 09"

# ── À PROPOS ──────────────────────────────────────────────
replace_in_html \
  "https://static.wixstatic.com/media/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg/v1/fill/w_960,h_640,q_90,enc_avif,quality_auto/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg" \
  "$BASE/animations/animation-03.jpg" \
  "À propos photo"

# ─── VÉRIFICATION FINALE ───────────────────────────────────
echo ""
REMAINING=$(grep -r "wixstatic.com" html/*.html 2>/dev/null | wc -l)
if [ "$REMAINING" -eq 0 ]; then
    echo -e "${GREEN}✓ Aucune URL Wix restante — toutes les images sont locales !${NC}"
else
    echo -e "${YELLOW}⚠ ${REMAINING} URL(s) Wix encore présente(s) dans les fichiers HTML.${NC}"
    echo "  Détail :"
    grep -rn "wixstatic.com" html/*.html 2>/dev/null | head -20
fi

echo ""
echo -e "${BLUE}=====================================================${NC}"
echo -e "${GREEN}  Mise à jour terminée.${NC}"
echo -e "${BLUE}=====================================================${NC}"
echo ""
echo "Structure finale du projet :"
find . -type f | grep -v ".sh" | sort | sed 's|./||' | sed 's|^|  |'
