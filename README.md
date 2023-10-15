# dotfiles
## セットアップ
以下のコマンドをプロンプトに張り付けて実行する
```bash
cat << "EOF" | bash
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

EOF
```

その後、以下を実行
```bash
$ chmod +x setup_shell.sh && ./setup_shell.sh
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

# WSLで新しい環境を作る
windowsユーザーの場合、WSLを利用して新しい環境を気軽に作成できる。以下、ubuntuの例で説明する。
適当な場所に`wsl`フォルダを作成し、コマンドライン上でそのなかに入る。
また、[ここ](https://cloud-images.ubuntu.com/wsl/)から、ubuntuのファイルをダウンロードして`wsl`フォルダのなかに入れておく。22.04は、`ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz`というファイル。

その後、以下のようなコマンドを実行すれば環境が作成される。
```
wsl --import ubuntu22.04-test ./ubuntu22.04-test ./ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz
```

`wsl -l -v`で作成された環境を確認できる。また、`wsl -d ubuntu22.04-test`でログインできる。

削除方法は以下の通り
```
wsl --unregister ubuntu22.04-test
```

# 参考
- [How to Store Dotfiles - A Bare Git Repository | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
