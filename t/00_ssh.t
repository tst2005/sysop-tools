service_to_install=t/ssh_config/service

# mock ssh command
ssh_config=/tmp/test_ssh_config_installation
cp t/ssh_config/original $ssh_config
alias ssh="ssh -F $ssh_config"

uze TAP :all
uze ssh/service

ssh_service_installation () {
    ssh/service/known < $service_to_install
    not_ok "ssh service not installed yet"
    < $service_to_install >> $ssh_config
    ssh/service/known < $service_to_install
    ok "ssh service installed"
}

TAP/prove ssh_service_installation



