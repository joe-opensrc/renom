#!/bin/bash

_renom(){
  local regmodsDir=~/.config/renom/regmods
  local cur prev words cword;
  _init_completion || return;

  case "${prev}" in
    "renom") COMPREPLY=("-R");;
    "-R") COMPREPLY=(
            $( compgen -W "$( find . ${regmodsDir} -mindepth 1 -type f -name '*.rxs' -printf '%p\n' )" -- ${cur} ) );;
    *) _comp_compgen_filedir; return;;
  esac
}

complete -F _renom renom
