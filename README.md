# vimrc

包含 ``` go python html ``` 三种语言的配置

- 需要 ```curl``` 安装 ```vim-plug``` 需要，否则需要自己安装该插件

- 其中 ```go```  依赖于插件 ```vim-go```

- 支持异步语法检错，基于语义的补全

- 需要 ```power-line``` 字体


### 建议先阅读最后一部分关于代理设置的内容，加快安装速度


** 请执行以下命令进行安装 **

```
git clone https://github.com/floatval/vimrc
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

然后在 vim 中执行 ```:PlugInstall```
enjoy it!


** 注意！因为众所周知的原因，插件中的 ```YCM``` 以及 ```Vim-go``` 可能安装很慢
建议执行脚本之前临时为 git 设置代理 **

设置方法如下：(ps: 此设置适用于ssr等前向代理)

```
git config --global https.proxy 'socks5://127.0.0.1:1080'

git config --global https.proxy 'socks5://127.0.0.1:1080'

git config --global --unset http.proxy

git config --global --unset https.proxy

npm config delete proxy
```

** 此脚本适用于 Arch, Centos, Ubuntu  其余用户可手动安装 **
