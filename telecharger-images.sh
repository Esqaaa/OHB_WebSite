#!/bin/bash
# ============================================================
# ORCHESTRE D'HARMONIE DE BEINHEIM
# Script de téléchargement des images depuis le site Wix
# ============================================================
# UTILISATION :
#   1. Placez ce fichier à la RACINE du projet (ohb-v2/)
#   2. Rendez-le exécutable : chmod +x telecharger-images.sh
#   3. Lancez-le            : ./telecharger-images.sh
# ============================================================

set -e  # Arrêt si une commande échoue

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=====================================================${NC}"
echo -e "${BLUE}  OHB — Téléchargement des images en local${NC}"
echo -e "${BLUE}=====================================================${NC}"
echo ""

# Vérification que curl est installé
if ! command -v curl &> /dev/null; then
    echo -e "${RED}ERREUR : curl n'est pas installé.${NC}"
    echo "  Installez-le avec : sudo apt install curl  (Linux)"
    echo "  ou                : brew install curl       (Mac)"
    exit 1
fi

# Création du dossier photos et sous-dossiers
echo -e "${YELLOW}→ Création de l'arborescence photos/...${NC}"
mkdir -p photos/logo
mkdir -p photos/hero
mkdir -p photos/concerts
mkdir -p photos/galerie
mkdir -p photos/animations
echo -e "${GREEN}  ✓ Dossiers créés${NC}"
echo ""

# Compteur
TOTAL=0
OK=0
FAIL=0

download() {
    local URL="$1"
    local DEST="$2"
    local NOM="$3"
    TOTAL=$((TOTAL + 1))
    printf "  Téléchargement %-45s → %s " "$NOM" "$DEST"
    if curl -s --max-time 30 --retry 3 -L "$URL" -o "$DEST" && [ -s "$DEST" ]; then
        echo -e "${GREEN}✓${NC}"
        OK=$((OK + 1))
    else
        echo -e "${RED}✗ ÉCHEC${NC}"
        FAIL=$((FAIL + 1))
        rm -f "$DEST"
    fi
}

# ─── LOGO ───────────────────────────────────────────────────
echo -e "${YELLOW}→ Logo...${NC}"
download \
  "https://static.wixstatic.com/media/7abdd3_f5e968ae54484f5da1b83e605621e318~mv2.png/v1/fill/w_200,h_200,al_c,q_85,enc_avif,quality_auto/Logo%20OHB%20transparent%20blanc.png" \
  "photos/logo/logo-ohb.png" \
  "logo-ohb.png"

# ─── HERO / GRANDES PHOTOS ──────────────────────────────────
echo ""
echo -e "${YELLOW}→ Photos Hero (grandes bannières)...${NC}"
download \
  "https://static.wixstatic.com/media/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg/v1/fill/w_1920,h_1080,al_c,q_90,enc_avif,quality_auto/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg" \
  "photos/hero/hero-accueil.jpg" \
  "hero-accueil.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg" \
  "photos/hero/hero-a-propos.jpg" \
  "hero-a-propos.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg" \
  "photos/hero/hero-concerts.jpg" \
  "hero-concerts.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg" \
  "photos/hero/hero-galerie.jpg" \
  "hero-galerie.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_69efb9e188ae461297e960d146829512~mv2.jpeg/v1/fill/w_1920,h_1080,q_90,enc_avif,quality_auto/7abdd3_69efb9e188ae461297e960d146829512~mv2.jpeg" \
  "photos/hero/hero-contact.jpg" \
  "hero-contact.jpg"

# ─── CONCERTS ───────────────────────────────────────────────
echo ""
echo -e "${YELLOW}→ Photos Concerts...${NC}"
download \
  "https://static.wixstatic.com/media/7abdd3_8d856f646ed24e83960fa86aa96aa875~mv2.jpeg/v1/fill/w_1280,h_854,q_90,enc_avif,quality_auto/7abdd3_8d856f646ed24e83960fa86aa96aa875~mv2.jpeg" \
  "photos/concerts/concert-01.jpg" \
  "concert-01.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_818d14797b51493bbc09fe3dfe8f4389~mv2.jpg/v1/fill/w_1280,h_854,q_90,enc_avif,quality_auto/7abdd3_818d14797b51493bbc09fe3dfe8f4389~mv2.jpg" \
  "photos/concerts/concert-02.jpg" \
  "concert-02.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg/v1/fill/w_1280,h_854,q_90,enc_avif,quality_auto/7abdd3_639256011caf413188eb936fc9fd2e39~mv2.jpeg" \
  "photos/concerts/concert-03.jpg" \
  "concert-03.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg/v1/fill/w_1280,h_854,q_90,enc_avif,quality_auto/7abdd3_3648ea0d90014177b4c6ad55369d2e65~mv2.jpg" \
  "photos/concerts/concert-04.jpg" \
  "concert-04.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg/v1/fill/w_1280,h_720,q_90,enc_avif,quality_auto/7abdd3_4987b3bdafb74f0a85320cef9ed26d5c~mv2.jpg" \
  "photos/concerts/concert-05.jpg" \
  "concert-05.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_b35ff88a2b38429daf96ecce031060e5~mv2.jpg/v1/fill/w_960,h_642,q_90,enc_avif,quality_auto/7abdd3_b35ff88a2b38429daf96ecce031060e5~mv2.jpg" \
  "photos/concerts/concert-06.jpg" \
  "concert-06.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_fd07ff2543204a7384147ddd19e1b19a~mv2.jpeg/v1/fill/w_960,h_638,q_90,enc_avif,quality_auto/7abdd3_fd07ff2543204a7384147ddd19e1b19a~mv2.jpeg" \
  "photos/concerts/concert-07.jpg" \
  "concert-07.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg/v1/fill/w_1280,h_854,q_90,enc_avif,quality_auto/7abdd3_05e049ca6ee6434d8933fdf03211a8a7~mv2.jpg" \
  "photos/concerts/concert-08.jpg" \
  "concert-08.jpg"

# ─── GALERIE ────────────────────────────────────────────────
echo ""
echo -e "${YELLOW}→ Photos Galerie...${NC}"
download \
  "https://static.wixstatic.com/media/7abdd3_2ef0b0fbf2594ad28193e58fba477ebc~mv2.jpeg/v1/fill/w_960,h_640,q_90,enc_avif,quality_auto/7abdd3_2ef0b0fbf2594ad28193e58fba477ebc~mv2.jpeg" \
  "photos/galerie/galerie-01.jpg" \
  "galerie-01.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_68884329b4f244bd8346d57b1f81fb8a~mv2.jpg/v1/fill/w_960,h_642,q_90,enc_avif,quality_auto/7abdd3_68884329b4f244bd8346d57b1f81fb8a~mv2.jpg" \
  "photos/galerie/galerie-02.jpg" \
  "galerie-02.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_fd3e67e5e2654118af6ecbbf799e7beb~mv2.jpg/v1/fill/w_960,h_640,q_90,enc_avif,quality_auto/7abdd3_fd3e67e5e2654118af6ecbbf799e7beb~mv2.jpg" \
  "photos/galerie/galerie-03.jpg" \
  "galerie-03.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_9ed5c188aa954f158e3922b74ce7f812~mv2.jpeg/v1/fill/w_960,h_638,q_90,enc_avif,quality_auto/7abdd3_9ed5c188aa954f158e3922b74ce7f812~mv2.jpeg" \
  "photos/galerie/galerie-04.jpg" \
  "galerie-04.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_924cad3c876c47fb8a18df29e4de078a~mv2.jpg/v1/fill/w_960,h_638,q_90,enc_avif,quality_auto/7abdd3_924cad3c876c47fb8a18df29e4de078a~mv2.jpg" \
  "photos/galerie/galerie-05.jpg" \
  "galerie-05.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_736df37704dc4ab79ce21ed73d40d512~mv2.jpg/v1/fill/w_960,h_722,q_90,enc_avif,quality_auto/7abdd3_736df37704dc4ab79ce21ed73d40d512~mv2.jpg" \
  "photos/galerie/galerie-06.jpg" \
  "galerie-06.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_299104bb28e64ac697f83d2d34afa4ef~mv2.jpg/v1/fill/w_960,h_638,q_90,enc_avif,quality_auto/7abdd3_299104bb28e64ac697f83d2d34afa4ef~mv2.jpg" \
  "photos/galerie/galerie-07.jpg" \
  "galerie-07.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_9ced687013e8419d948c105c4a41959d~mv2.jpg/v1/fill/w_960,h_640,q_90,enc_avif,quality_auto/7abdd3_9ced687013e8419d948c105c4a41959d~mv2.jpg" \
  "photos/galerie/galerie-08.jpg" \
  "galerie-08.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg/v1/fill/w_960,h_444,q_90,enc_avif,quality_auto/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg" \
  "photos/galerie/galerie-09.jpg" \
  "galerie-09.jpg"

# ─── ANIMATIONS ─────────────────────────────────────────────
echo ""
echo -e "${YELLOW}→ Photos Animations / À propos...${NC}"
download \
  "https://static.wixstatic.com/media/7abdd3_b30b64fc08a24caa9a4c68a097d36576~mv2.jpg/v1/fill/w_960,h_720,q_90,enc_avif,quality_auto/7abdd3_b30b64fc08a24caa9a4c68a097d36576~mv2.jpg" \
  "photos/animations/animation-01.jpg" \
  "animation-01.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_4fcb2b52beb74d5cb47f2fcff20245e4~mv2.jpg/v1/fill/w_960,h_640,q_90,enc_avif,quality_auto/7abdd3_4fcb2b52beb74d5cb47f2fcff20245e4~mv2.jpg" \
  "photos/animations/animation-02.jpg" \
  "animation-02.jpg"

download \
  "https://static.wixstatic.com/media/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg/v1/fill/w_960,h_444,q_90,enc_avif,quality_auto/7abdd3_7fcfd168cf1940e399616206022864a3~mv2.jpg" \
  "photos/animations/animation-03.jpg" \
  "animation-03.jpg"

# ─── BILAN ──────────────────────────────────────────────────
echo ""
echo -e "${BLUE}=====================================================${NC}"
echo -e "  Bilan : ${GREEN}${OK} réussies${NC}  /  ${RED}${FAIL} échouées${NC}  /  ${TOTAL} total"
echo -e "${BLUE}=====================================================${NC}"
echo ""

if [ $OK -gt 0 ]; then
    echo -e "${GREEN}✓ Images téléchargées dans le dossier photos/${NC}"
    echo ""
    echo -e "${YELLOW}ÉTAPE SUIVANTE : lancez le script update-paths.sh${NC}"
    echo "  pour mettre à jour automatiquement les chemins dans le HTML."
fi

if [ $FAIL -gt 0 ]; then
    echo -e "${RED}⚠ ${FAIL} image(s) n'ont pas pu être téléchargées.${NC}"
    echo "  Vérifiez votre connexion internet et relancez le script."
fi
