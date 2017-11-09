infect_enveloppe_begin() {
    echo '
    set -e
    cd ${~INFECTDIR:=$( mktemp -d ${~INFFECTTMPL:=/tmp/infect.XXXXXXXXXX} )}
    tar xf - <<\\0db3972a-7ab7-4b4e-a327-db8096e1b726 && '${*:-. ./bootstrap}
}

infect_enveloppe_end() { echo 0db3972a-7ab7-4b4e-a327-db8096e1b726; }

infect__with__command() { "$@"; }
infect__with__tar() { tar hcf - "$@"; }
infect_with() {
    infect_enveloppe_begin
    infect__with__"$@"
    infect_enveloppe_end
}
infect() {
	local cmd="$1";shift;
	local sub="${sub:-false}"
	"infect__$cmd" "$@";
}
