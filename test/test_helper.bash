#!/usr/bin/env bash

_startLab() {
    ./lab.sh --up || true
}

_stopLab() {
    ./lab.sh --down || true
}
