#!/bin/bash
PATH='/bin:/sbin:/usr/bin:/usr/sbin'

BLUE='\033[0;34m'
GRAY='\033[0;37m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

USAGE="
${GRAY}===================${NC}usage\n
${YELLOW}setup ${BLUE}COMMAND ${GREEN}[options]${NC}\n
\n
COMMAND:\n
\t  ${BLUE}install${NC}:\n
\t  - From a resource directory.\n
\t  - Install or update targets specified in *.list files.\n
\t  - Swap targets specified in .swap files.\n
\t  ${BLUE}restore${NC}:\n
\t  - From a backup directory.\n
\t  - Perform backup using diff file.\n
\n
[options]:\n
\t  ${GREEN}-u, --user USER${NC}\n
\t  Setup for the specified user's home directory.\n
\t  ${GREEN}-p, --path PATH${NC}\n
\t  Specify a path to the resource or backup directory.\n
\t  Default is ~/.local/share/setup/(resource|backup)\n
\t  ${GREEN}-e, --exclude DIR[S]${NC}\n
\t  When ${BLUE}install${NC}, exclude the specified directories.\n
\t  ${GREEN}-s, --silent${NC}\n
\t  Run in silent mode.\n
\t  ${GREEN}-n, --ninja${NC}\n
\t  When ${BLUE}install${NC}, do not read *.list files.\n
\t  ${GREEN}--no-apt${NC}\n
\t  When ${BLUE}install${NC}, do not read apt.list files.\n
\t  ${GREEN}--no-web${NC}\n
\t  When ${BLUE}install${NC}, do not read web.list files.\n
\t  ${GREEN}--no-backup${NC}\n
\t  When ${BLUE}install${NC}, do not create backup directory.\n
\n
"
ft_echo() {
    if [ -z "$SILENT" ]; then
        echo -ne "$@"
    fi
}
