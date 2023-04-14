if [[ -s "/usr/local/sdkman/bin/sdkman-init.sh" ]]
then
    _uname="$(stat --format '%U' /usr/local/sdkman)"
    if [[ "x${_uname}" != "x${USER}" ]]
    then
        sudo chown -R ${USER} /usr/local/sdkman
    fi
    source "/usr/local/sdkman/bin/sdkman-init.sh"
fi
