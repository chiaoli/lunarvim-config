# LunarVim 配置

## 套件配置
### TPM 安裝 vim-tmux-navigator
TPM（Tmux Plugin Manager）提供了一種簡潔的方式來安裝和管理 tmux 套件，包括 vim-tmux-navigator。以下是使用 TPM 安裝 vim-tmux-navigator 的步驟和相關說明：
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
4. 在 tmux 會話中按 prefix + I（大寫 i）來安裝套件。
#### 配置選項
vim-tmux-navigator 提供了一些配置選項，可以通過 TPM 的設置來自定義：
```
set -g @vim_navigator_mapping_left "C-Left C-h"
set -g @vim_navigator_mapping_right "C-Right C-l"
set -g @vim_navigator_mapping_up "C-k"
set -g @vim_navigator_mapping_down "C-j"
set -g @vim_navigator_mapping_prev ""
```
這些設定允許你自訂導航鍵。例如，C-Left C-h 表示可以使用 Ctrl+左箭頭 或 Ctrl+h 來向左導航。
如果不想自動映射 <prefix> C-l 到 send C-l（用於恢復清屏功能），可以加入：
```
set -g @vim_navigator_prefix_mapping_clear_screen ""
```
## 完整套件列表

此配置總共整合了 **15個套件**，按功能分類如下：

### 🤖 AI 開發輔助
- **claudecode.nvim** (`coder/claudecode.nvim`)
  - Claude Code AI 編程助手整合
  - 依賴：`folke/snacks.nvim`
  - 按鍵前綴：`<leader>a`
  - 功能：程式碼生成、重構、問答、差異管理

### 🚀 Go 開發環境
- **vim-go** (`fatih/vim-go`)
  - 完整的 Go 語言支援，替代 go.nvim
  - 自動格式化：gofumpt + goimport
  - 語法高亮：類型、函數、操作符等
  - 測試工具和構建支援
- **nvim-dap-go** (`leoluz/nvim-dap-go`)
  - Go 調試器整合
  - 依賴：`mfussenegger/nvim-dap`
  - 支援斷點、變數檢查等

### ⚡ 導航和編輯增強
- **hop.nvim** (`phaazon/hop.nvim`)
  - 快速跳轉，替代 EasyMotion
  - 按鍵：`s`(字符)、`S`(單詞)、`f/F/t/T`(行內)
- **vim-tmux-navigator** (`christoomey/vim-tmux-navigator`)
  - Vim 和 tmux 窗格間無縫導航
  - 按鍵：`<C-h/j/k/l>`、`<C-\>`
- **nvim-surround** (`kylechui/nvim-surround`)
  - 文本包圍操作 (引號、括號、標籤等)
  - 操作：`ys`(添加)、`ds`(刪除)、`cs`(修改)
- **treesj** (`Wansmer/treesj`)
  - 智慧程式碼分割/合併 (單行↔多行)
  - 按鍵：`<leader>j`
  - 最大合併長度：120字符
- **cutlass.nvim** (`gbprod/cutlass.nvim`)
  - 改進的剪切行為，避免意外覆蓋暫存器

### 🎨 用戶體驗增強
- **todo-comments.nvim** (`folke/todo-comments.nvim`)
  - TODO、FIXME、NOTE 等註釋高亮
  - 自動檢測和美化顯示
- **persistence.nvim** (`folke/persistence.nvim`)
  - 會話管理和自動恢復
  - 按鍵：`<leader>S*` (詳見 which-key)
- **trouble.nvim** (`folke/trouble.nvim`)
  - 診斷、引用、快速修復列表的美化界面
  - 按鍵：`<leader>t*` (詳見 which-key)
- **nvim-ufo** (`kevinhwang91/nvim-ufo`)
  - 增強的程式碼摺疊功能
  - 依賴：`kevinhwang91/promise-async`
  - 提供器：treesitter + indent
- **neoscroll.nvim** (`karb94/neoscroll.nvim`)
  - 平滑滾動動畫效果
  - 映射：`<C-u/d/b/f/y/e>` 等滾動鍵
- **nvim-ts-autotag** (`windwp/nvim-ts-autotag`)
  - HTML/XML 標籤自動配對和重命名

### 🔧 語言支援
- **vim-helm** (`towolf/vim-helm`)
  - Kubernetes Helm 模板語法支援

## 主要按鍵映射

### Claude Code (AI 助手)
| 按鍵 | 功能 | 模式 |
|------|------|------|
| `<leader>ac` | 開關 Claude Code | Normal |
| `<leader>af` | 聚焦 Claude Code | Normal |
| `<leader>ar` | 恢復會話 | Normal |
| `<leader>aC` | 繼續會話 | Normal |
| `<leader>ab` | 添加當前緩衝區 | Normal |
| `<leader>as` | 發送選中內容 | Visual |
| `<leader>aa` | 接受差異 | Normal |
| `<leader>ad` | 拒絕差異 | Normal |

### 導航和跳轉
| 按鍵 | 功能 | 套件 |
|------|------|------|
| `s` | 單字符跳轉 | hop.nvim |
| `S` | 單詞跳轉 | hop.nvim |
| `f/F` | 行內字符跳轉 | hop.nvim |
| `<C-h/j/k/l>` | tmux 窗格導航 | vim-tmux-navigator |
| `<leader>j` | 代碼分割/合併 | treesj |

### 會話和工具
| 按鍵 | 功能 | 套件 |
|------|------|------|
| `<leader>Ss` | 重載目錄會話 | persistence.nvim |
| `<leader>Sl` | 恢復最後會話 | persistence.nvim |
| `<leader>SQ` | 退出不保存會話 | persistence.nvim |
| `<leader>tt` | 切換 Trouble | trouble.nvim |
| `<leader>tw` | 工作區診斷 | trouble.nvim |
| `<leader>td` | 文檔診斷 | trouble.nvim |

## 特色功能

### 🎯 智慧編輯
- **文本包圍**：快速添加/修改/刪除括號、引號、標籤
- **程式碼摺疊**：基於 treesitter 的智能折疊
- **分割合併**：單行函數調用 ↔ 多行格式化
- **平滑滾動**：舒適的視覺體驗

### 🔍 導航增強  
- **精準跳轉**：字符級、單詞級快速定位
- **跨窗格導航**：Vim 和 tmux 的統一操作
- **會話恢復**：自動保存和恢復工作狀態

### 🛠️ 開發支援
- **Go 優化**：完整的語言支援和調試功能
- **Helm 支援**：Kubernetes 模板開發
- **AI 輔助**：Claude Code 智能編程助手

