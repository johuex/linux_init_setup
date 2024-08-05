TMP_DIR="tmp"
GNOME_EXT=()

on_exit() {
    rm -rf ${TMP_DIR}
}

log() {
    printf "$(date '+%Y-%m-%d %T.%6N') ${1}\n"
}

trap on_exit EXIT

mkdir $TMP_DIR

if [[ $EUID -ne 0 ]]; then
    echo "Please run script as root"
    exit 0
fi
