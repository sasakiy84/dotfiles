# dotfiles
## セットアップ
以下のコマンドを`temp.sh`として保存し、`bash temp.sh`を実行する
```bash
#!/bin/bash
git clone --bare https://github.com/sasakiy84/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

その後、以下を実行
```bash
$ chmod +x setup_shell.sh && ./setup_shell.sh
$ aqua i --all --only-link
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
