#!/bin/bash

# 依赖项自动安装
## curl 安装
### Centos
echo -e "你使用的是 Centos 么？(y/n)"
read answer
if [ "$answer" = "y" ]
  then
    echo "请安装redhat-lsb"
    sudo yum install redhat-lsb
fi

## curl 安装
## 字体安装'
if (which curl)
then
  echo "你的系统已经安装过 curl 将自动进行下一步安装"
else
  echo "你的系统未安装 curl 下面将进行安装： curl"
  sys=$( lsb_release -a | awk NR==3'{print $2}' )
  if [ "$sys" = "Arch" ]
    then
      sudo pacman -S curl
      echo -e "你是否已经安装过 power-line 字体？(y/n)"
      read answer
      if [ "$answer" = "n" ]
        then
          git clone https://github.com/powerline/fonts.git --depth=1
          cd fonts
          ./install.sh
          rm -rf fonts
      fi
  echo "好啦，需要手动确认的已经全部完成了， 下面脚本会自动进行安装！ enjoy it！"
  elif [ "$sys" = "Ubuntu" ]
    then
      sudo apt install curl
      echo -e "你是否已经安装过 power-line 字体？(y/n)"
      read answer
      if [ "$answer" = "n" ]
        then
          sudo apt-get install fonts-powerline
      fi
  echo "好啦，需要手动确认的已经全部完成了， 下面脚本会自动进行安装！ enjoy it！"
  elif [ "$sys" = "CentOS" ]
    then
       sudo yum install curl
      echo -e "你是否已经安装过 power-line 字体？(y/n)"
      read answer
      if [ "$answer" = "n" ]
        then
          git clone https://github.com/powerline/fonts.git --depth=1
          cd fonts
          ./install.sh
          rm -rf fonts
      fi
  echo "好啦，需要手动确认的已经全部完成了， 下面脚本会自动进行安装！ enjoy it！"
  fi
fi


# 根据是否已经开启 socks5 代理来自动配置git通过代理下载
# 下载完成后自动重置代理

# TODO

# vim 安装目录配置
vimHome="$HOME/.vim"
if [ -e $vimHome ]
then
  echo "注意，下面的操作将会删除你的 $HOME/.vim 目录，请做好备份"
  echo -e "请问你是否已完成备份？(y/n)"
  read answer
  if [ "$answer" = "y" ]
    then
      rm -rf $HOME/.vim
  else
    exit
  fi
  git clone https://github.com/floatval/vimrc $vimHome
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  mkdir -p $vimHome
  git clone https://github.com/floatval/vimrc $vimHome
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# 插件安装:
vim -c :PlugInstall
