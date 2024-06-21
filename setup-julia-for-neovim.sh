#!/bin/bash

function msg() {
	echo -e "[$0] \033[0;34m$1\033[0m"
}

# Install Julia LSP
JULIA_LSP_PATH="$HOME/.julia/environments/nvim-lspconfig"
if [ ! -f "$JULIA_LSP_PATH/Project.toml" ]; then
	msg "Installing LanguageServer.jl on $JULIA_LSP_PATH"
	julia --project="$JULIA_LSP_PATH" -e 'using Pkg; Pkg.add("LanguageServer")'
else
	msg "LanguageServer.jl is installed at $JULIA_LSP_PATH"
fi

# Downloading Fredrik Ekre's Makefile
if [ ! -f "$JULIA_LSP_PATH/Makefile" ]; then
	msg "Downloading Julia LSP Makefile to $JULIA_LSP_PATH"
	curl https://raw.githubusercontent.com/fredrikekre/.dotfiles/master/.julia/environments/nvim-lspconfig/Makefile >"$JULIA_LSP_PATH/Makefile"
else
	msg "Julia LSP Makefile is already present at $JULIA_LSP_PATH"
fi

msg "Go to $JULIA_LSP_PATH and run make. Follow instructions"
