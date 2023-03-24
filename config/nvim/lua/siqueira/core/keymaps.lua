-- set leader key to space
vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Easy buffer navigation using TAB
keymap.set("n", "<Tab>", ":bn<CR>") --  go to next buffer
keymap.set("n", "<S-Tab>", ":bp<CR>") --  go to previous buffer


-- Visual shifting (does not exit Visual mode)
keymap.set("v", "<", "<gv", {noremap = true})
keymap.set("v", ">", ">gv", {noremap = true})

-- Paste without overwriting the register
keymap.set("x", "<leader>p", "pgvy", {noremap = true})

-- Format using lsp
keymap.set("v", "<leader>F", "<cmd>lua vim.lsp.buf.format({timeout_ms=120000})<CR>", {noremap = true, silent = true})
keymap.set("n", "<leader>F", "<cmd>lua vim.lsp.buf.format({timeout_ms=120000})<CR>", {noremap = true, silent = true})

-- Jumps navigation
keymap.set("n", "<leader><leader>", "<C-o>", {noremap = true, silent = true})
keymap.set("n", "<leader>.", "<C-i>", {noremap = true, silent = true})

-- Shortcut to command
keymap.set("n", ";", ":")
keymap.set("n", ";;", ";", {noremap = true})

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>") -- Find current file

-- telescope
keymap.set("n", "<leader>o", ":Telescope live_grep<cr>")
keymap.set("n", "<leader>b", ":Telescope buffers<cr>")
keymap.set("n", "<leader>l", ":Telescope current_buffer_fuzzy_find<cr>")
keymap.set("n", "<C-p>", ":Telescope find_files<cr>")
keymap.set("n", "<F3>", ":Telescope grep_string<cr>")

keymap.set("n", "<leader>x", ":BD<cr>")

-- bufonly
keymap.set("n", "<C-q>", ":BufOnly<cr>:bn<cr>") -- Remove all other buffers (bn to update list)

-- fugitive
keymap.set("n", "<leader>gb", ":Git blame<cr>", {noremap=true, silent=true}) -- Git blame



-- ouroboros
keymap.set("n", "<A-o>", ":call HeaderToggle()<cr>", {noremap=true, silent=true}) --Toggle header and source
