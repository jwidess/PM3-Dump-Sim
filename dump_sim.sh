#!/data/data/com.termux/files/usr/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

cd /data/data/com.termux/files/home/proxmark3/client || exit

# Prompt user to begin
echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}Ready card and submit Enter to begin...${NC}"
read

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}[*] Dumping card...${NC}\n"
proxmark3 tcp:localhost:8080 -c "hf mfu dump"

DUMP_FILE=$(ls -t ~/hf-mfu-*-dump*.bin 2>/dev/null | head -n 1)

if [[ -z "$DUMP_FILE" ]]; then
  echo -e "${RED}========================================${NC}"
  echo -e "${RED}[!] No dump file found.${NC}"
  echo -e "${RED}========================================${NC}"
  exit 1
fi

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}[*] Loading dump file '$DUMP_FILE' into emulator...${NC}\n"
proxmark3 tcp:localhost:8080 -c "hf mfu eload -f $DUMP_FILE -v"
rm -f "$DUMP_FILE" "${DUMP_FILE%.bin}.json"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}[*] Reading memory with eview...${NC}\n"
proxmark3 tcp:localhost:8080 -c "hf mfu eview"

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}Press Enter to start emulation...${NC}\n"
read

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}[*] Starting emulation...${NC}\n"
proxmark3 tcp:localhost:8080 -c "hf mfu sim -t 2"
