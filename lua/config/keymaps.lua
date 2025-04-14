-- Set up gruvbox theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Key mappings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { silent = true })

-- Go specific key mappings
vim.keymap.set("n", "<leader>gr", "<cmd>GoRun<CR>", { silent = true })
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { silent = true })
vim.keymap.set("n", "<leader>gi", "<cmd>GoImport<CR>", { silent = true })
vim.keymap.set("n", "<leader>gd", "<cmd>GoDef<CR>", { silent = true })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>buffers<CR>", { silent = true, desc = "List all buffers" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { silent = true, desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { silent = true, desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { silent = true, desc = "Close current split" })

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { silent = true, desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { silent = true, desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { silent = true, desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { silent = true, desc = "Previous tab" })

-- Quick save and quit
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { silent = true, desc = "Quit all" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { silent = true, desc = "Save and quit" })

-- Quick select all
vim.keymap.set("n", "<leader>sa", "ggVG", { silent = true, desc = "Select all" })

-- Terminal
vim.keymap.set("n", "<leader>tt", "<cmd>terminal<CR>", { silent = true, desc = "Open terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })

-- Git integration (requires vim-fugitive)
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { silent = true, desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { silent = true, desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { silent = true, desc = "Git push" })
vim.keymap.set("n", "<leader>gl", "<cmd>Git log<CR>", { silent = true, desc = "Git log" })
vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<CR>", { silent = true, desc = "Git diff" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { silent = true, desc = "Git blame" })

-- LSP enhancements
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true, desc = "Format code" })
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true, desc = "Rename symbol" })
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, desc = "Code action" })
vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, desc = "Go to definition" })
vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, desc = "Hover information" })
vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true, desc = "Signature help" })
vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true, desc = "Go to implementation" })
vim.keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true, desc = "Type definition" })
vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true, desc = "Find references" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true, desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true, desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>", { silent = true, desc = "Diagnostic list" })

-- Additional Go specific mappings
vim.keymap.set("n", "<leader>gf", "<cmd>GoFillStruct<CR>", { silent = true, desc = "Fill struct" })
vim.keymap.set("n", "<leader>ga", "<cmd>GoAddTags<CR>", { silent = true, desc = "Add tags to struct" })
vim.keymap.set("n", "<leader>gm", "<cmd>GoModTidy<CR>", { silent = true, desc = "Go mod tidy" })
vim.keymap.set("n", "<leader>gg", "<cmd>GoGenerate<CR>", { silent = true, desc = "Go generate" })
vim.keymap.set("n", "<leader>gc", "<cmd>GoCoverage<CR>", { silent = true, desc = "Show coverage" })
vim.keymap.set("n", "<leader>gI", "<cmd>GoImpl<CR>", { silent = true, desc = "Generate interface implementation" })
vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", { silent = true, desc = "Add if err check" })

-- Toggle useful features
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { silent = true, desc = "Toggle word wrap" })
vim.keymap.set("n", "<leader>tc", "<cmd>set cursorline!<CR>", { silent = true, desc = "Toggle cursor line" })
vim.keymap.set("n", "<leader>tr", "<cmd>set relativenumber!<CR>", { silent = true, desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<CR>", { silent = true, desc = "Toggle spell check" })
vim.keymap.set("n", "<leader>th", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- Text manipulation
vim.keymap.set("n", "<leader>j", "mzJ`z", { silent = true, desc = "Join lines without moving cursor" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines up" })
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace word under cursor" })

-- Quick navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })