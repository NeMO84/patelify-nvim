# Portable docker image of neo-VIM
#
# This will allow a consistent usage of nvim across all my systems.
#
# Currently installs nvim

FROM ubuntu
MAINTAINER Nirmit Patel

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install software-properties-common curl wget python-dev python-pip python3-dev python3-pip
RUN add-apt-repository -y ppa:neovim-ppa/stable && apt-get -y update && apt-get -y install neovim
# RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && \
    # update-alternatives --config vi && \
    # update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && \
    # update-alternatives --config vim && \
    # update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && \
    # update-alternatives --config editor

RUN apt-get -y install git
RUN mkdir -p ~/.config/nvim && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN wget https://raw.githubusercontent.com/NeMO84/dotfiles/master/.nvimrc -O ~/.config/nvim/init.vim
RUN nvim -c 'PlugInstall' --headless +qall

CMD ["echo", "'Use: docker run -it -v (pwd):/workspace patelify/vim /usr/bin/nvim /workspace/<file_folder>'"]

