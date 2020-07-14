#!/usr/bin/env bats

load test_helper

@test "./lab.sh without arguments will print usage and exit 1." {
    run ./lab.sh
    [ "$status" -eq 1 ]
    [ "${lines[0]}" = 'Usage: lab.sh [OPTIONS]' ]
}

@test "./lab.sh -h|--help will print help and exit 0." {
    run ./lab.sh -h
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = 'Usage: lab.sh [OPTIONS]' ]
    run ./lab.sh --help
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = 'Usage: lab.sh [OPTIONS]' ]
}

@test "./lab.sh -i|--info" {
    _stopLab

    run ./lab.sh -i
    [ "$status" -eq 0 ]
    [ "${lines[-1]}" = 'Pentesting lab seems not to be up.' ]
    run ./lab.sh --info
    [ "$status" -eq 0 ]
    [ "${lines[-1]}" = 'Pentesting lab seems not to be up.' ]

    _startLab

    run ./lab.sh -i
    [ "$status" -eq 0 ]
    [ "${lines[10]}" = 'The lab is up and running. Have fun.' ]
    run ./lab.sh --info
    [ "$status" -eq 0 ]
    [ "${lines[10]}" = 'The lab is up and running. Have fun.' ]

    _stopLab
}

@test "./lab.sh -o|--overwiew TEXT" {
    run ./lab.sh -o
    [ "$status" -eq 1 ]
    [[ "${output}" =~ Error ]]
    run ./lab.sh --overview
    [ "$status" -eq 1 ]
    [[ "${output}" =~ Error ]]

}
