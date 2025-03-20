#!/bin/bash
# Script para configurar ambiente de desenvolvimento no Ubuntu Server Minimal
# Pacotes: curl, git, micro, zsh, build-essential, uv (se disponível) e oh-my-zsh

# Atualizar repositórios e instalar pacotes básicos
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y curl git micro zsh build-essential

# Instalar o pacote 'uv'
# Caso o pacote não esteja disponível nos repositórios oficiais,
# remova ou adapte esta linha conforme sua necessidade.
sudo apt-get install -y uv

# Instalar o Oh-My-Zsh (instalação não-interativa)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Instalando o Oh-My-Zsh..."
  # A instalação padrão do oh-my-zsh tenta mudar o shell, mas estamos fazendo isso manualmente
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Alterar o shell padrão para zsh para o usuário atual
chsh -s "$(which zsh)"

echo "Ambiente de desenvolvimento instalado com sucesso!"
