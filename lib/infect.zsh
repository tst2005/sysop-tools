infect/enveloppe/begin () {
    echo '
    set -e
    cd ${~INFECTDIR:=$( mktemp -d ${~INFFECTTMPL:=/tmp/infect.XXXXXXXXXX} )}
    tar xf - <<\\0db3972a-7ab7-4b4e-a327-db8096e1b726 && '${*:-. ./bootstrap}
}

infect/enveloppe/end () { echo 0db3972a-7ab7-4b4e-a327-db8096e1b726 }
infect/tar () { tar hcf - "$@" }
infect/with () {
    # TODO: parameters for begin after --
    infect/enveloppe/begin
    "$@"
    infect/enveloppe/end }

