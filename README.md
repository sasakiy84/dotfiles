# dotfiles
## セットアップ
```bash
$ git clone https://github.com/sasakiy84/dotfiles.git
$ bash ~/setup_shell.sh
$ exec $SHELL -l
```

## aquaによるパッケージの追加
```bash
$ aqua g -i
$ aqua i --all --only-link
$ config add -u
$ config commit -m "add package"
$ config push
```

## 設定ファイルの追加
```bash
# 適切なファイルを追加したあとに
$ config add file_path
$ config commit -m "add settings"
$ config push
```

## TODOs
- [ ] aquaを利用してバージョンアップに追従する

# 参考
- [How to Store Dotfiles - A Bare Git Repository | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
