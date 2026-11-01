# macOS 配置

zsh、Starship、VS Code 使用软链接；Terminal 使用 plist 导入/导出。

适用于 Apple Silicon，需先安装 Homebrew。执行前备份原配置并退出 VS Code；仓库位置不同时修改下方路径。

```sh
brew install starship zsh-autosuggestions zsh-syntax-highlighting

DOTFILES_MAC="$HOME/Documents/Dotfiles/mac"
mkdir -p "$HOME/.config" "$HOME/Library/Application Support/Code/User"
ln -sfn "$DOTFILES_MAC/zsh/.zprofile" "$HOME/.zprofile"
ln -sfn "$DOTFILES_MAC/zsh/.zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILES_MAC/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "$DOTFILES_MAC/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -sfn "$DOTFILES_MAC/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
```

重新打开终端和 VS Code 即可生效。软链接建立后，请保留仓库原位置。

退出 Terminal App 后，在 VS Code 集成终端中导入设置（会覆盖现有偏好）：

```sh
defaults import com.apple.Terminal "$HOME/Documents/Dotfiles/mac/terminal/com.apple.Terminal.plist"
```

修改 Terminal 设置后，导出回仓库：

```sh
defaults export com.apple.Terminal "$HOME/Documents/Dotfiles/mac/terminal/com.apple.Terminal.plist"
```
