function iterm2\_print\_user\_vars() {
  iterm2\_set\_user\_var gitProject $(basename $(git rev-parse --show-toplevel 2> /dev/null) 2> /dev/null)
}

function convert_cr2_to_jpeg() {
    DIR="JPEG"
    if [ ! -d "${DIR}" ]; then mkdir "${DIR}"; fi
    for i in *.CR2; do sips -s format jpeg $i --out "${DIR}/$i.jpg";done
}

function mkcd() {
  mkdir -p "$@" && cd "$_"
}
