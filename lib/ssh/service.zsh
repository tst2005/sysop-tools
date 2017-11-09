ssh/service/known () (
    # $host is the name of the service
    sed -rn '/^ *(host|IdentityFile) +/p' |
        %- { read $k <<< $v }

    # read keys of the file as variables
    # this would set $host and $IdentityFile

    # read settings for connection to $host
    #
    ssh -G $host |
        sed -rn '/^ *identityfile +/p' |
            %- { read $k <<< $v }
    [[ $~identityfile == $~IdentityFile ]] )


