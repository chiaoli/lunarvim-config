# lunarvim-config

## Plugin
### TPM 安裝 vim-tmux-navigator
TPM（Tmux Plugin Manager）提供了一種簡單的方式來安裝和管理 tmux 插件，包括 vim-tmux-navigator。以下是使用 TPM 安裝 vim-tmux-navigator 的步驟和相關說明：
#### 安裝步驟
1. 在 ~/.tmux.conf 文件中添加以下行：
```
set -g @plugin 'christoomey/vim-tmux-navigator'
```
2. 確保在 ~/.tmux.conf 文件的底部有以下行：
```
run '~/.tmux/plugins/tpm/tpm'
```
3. 重新加載 tmux 配置或重啟 tmux。
4. 在 tmux 會話中按 prefix + I（大寫 i）來安裝插件。
#### 配置選項
vim-tmux-navigator 提供了一些配置選項，可以通過 TPM 的設置來自定義：
```
set -g @vim_navigator_mapping_left "C-Left C-h"
set -g @vim_navigator_mapping_right "C-Right C-l"
set -g @vim_navigator_mapping_up "C-k"
set -g @vim_navigator_mapping_down "C-j"
set -g @vim_navigator_mapping_prev ""
```
這些設置允許你自定義導航鍵。例如，C-Left C-h 表示可以使用 Ctrl+左箭頭 或 Ctrl+h 來向左導航。
如果不想自動映射 <prefix> C-l 到 send C-l（用於恢復清屏功能），可以添加：
```
set -g @vim_navigator_prefix_mapping_clear_screen ""
```
