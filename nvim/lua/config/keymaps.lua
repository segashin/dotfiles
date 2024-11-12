local keymap = vim.keymap

-- set the leader key
vim.g.mapleader = ';'

-- jj to exit insert mode
keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })
-- ECS twice to stop highlight
keymap.set('n', '<ESC><ESC>', ':<C-u>call clearmatches()<CR><ESC>:<C-u>nohlsearch<CR><ESC>',
    { noremap = true, silent = true })

-- Space twice to highlight cword
vim.cmd('highlight cword ctermbg=blue guibg=DodgerBlue4')
keymap.set(
    'n',
    '<Space><Space>',
    [[':<C-u>match ' . 'cword /' . expand('<cword>') . '/ <CR>']],
    { noremap = true, silent = false, expr = true }
)

-- Leader + num to highlight cword
local function highlightCword(groupNum, ctermbgColor, guibgColor, cWORD)
    local groupName = "cword" .. groupNum
    local cword
    if cWORD then cword = 'cWORD' else cword = 'cword' end
    vim.cmd("highlight " .. groupName .. " ctermbg=" .. ctermbgColor .. " guibg=" .. guibgColor)
    keymap.set(
        'n',
        '<Leader>' .. groupNum,
        [[":<C-u>call matchadd(']] .. groupName .. [[', '" . expand("<]] .. cword .. [[>") . "') <CR>"]],
        { noremap = true, silent = false, expr = true }
    )
end

highlightCword(1, 'red', 'VioletRed4', false)
highlightCword(2, 'green', 'DarkOliveGreen', false)
highlightCword(3, 'yellow', 'gold4', false)
highlightCword(4, 'white', 'LemonChiffon1', false)
highlightCword(5, 'black', 'bisque4', false)

-- marker
keymap.set('n', '<Leader>n', ':<C-U>BufferPrevious<CR>')
keymap.set('n', '<Leader>m', ':<C-U>BufferNext<CR>')

-- write and quit
keymap.set('n', '<Leader>ww', ':<C-u>w<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>wq', ':<C-u>wq<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>qq', ':<C-u>q<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>qa', ':<C-u>qa<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>bd', ':<C-u>bd<CR>', { noremap = true, silent = true })

-- wincmd moving cursor
keymap.set('n', '<Leader>h', ':<C-u>wincmd h<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>j', ':<C-u>wincmd j<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>k', ':<C-u>wincmd k<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>l', ':<C-u>wincmd l<CR>', { noremap = true, silent = true })

-- wincmd split window
keymap.set('n', '<Leader>ss', ':<C-u>wincmd s<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>vs', ':<C-u>wincmd v<CR>', { noremap = true, silent = true })

-- wincmd manage window
keymap.set('n', '<Leader>oo', ':<C-u>wincmd o<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>wr', ':<C-u>wincmd r<CR>', { noremap = true, silent = true })
-- keymap.set('n', '<Leader>wj', ':<C-u>wincmd J<CR>', { noremap = true, silent = true })
-- keymap.set('n', '<Leader>wh', ':<C-u>wincmd H<CR>', { noremap = true, silent = true })

-- tab
-- keymap.set('n', '}', 'gt', {noremap = true, silent = true})
-- keymap.set('n', '{', 'gT', {noremap = true, silent = true})
keymap.set('n', '}', ':<C-u>BufferNext<CR>', { noremap = true, silent = true })
keymap.set('n', '{', ':<C-u>BufferPrevious<CR>', { noremap = true, silent = true })
keymap.set('n', 'gt', ':<C-u>BufferNext<CR>', { noremap = true, silent = true })
keymap.set('n', 'gT', ':<C-u>BufferPrevious<CR>', { noremap = true, silent = true })

-- wincmd change window size
keymap.set('n', '(', ':<C-u>vertical resize -5<CR>', { noremap = true, silent = true })
keymap.set('n', ')', ':<C-u>vertical resize +5<CR>', { noremap = true, silent = true })
keymap.set('n', '+', ':<C-u>res +5<CR>', { noremap = true, silent = true })
keymap.set('n', '-', ':<C-u>res -5<CR>', { noremap = true, silent = true })

-- lsp
keymap.set('n', '<Leader>aa',
    ':<C-u>lua vim.diagnostic.open_float(nil, {close_events = {"CursorMoved" , "InsertLeave"}})<CR>',
    { noremap = true, silent = true })
keymap.set('n', '<Leader>gc', vim.lsp.buf.code_action, { noremap = true, silent = true }) -- to action
keymap.set('n', '<Leader>gg', vim.lsp.buf.hover, { noremap = true, silent = true })
keymap.set('n', '<Leader>gr', vim.lsp.buf.references, { noremap = true, silent = true })
keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, { noremap = true, silent = true }) -- to def
keymap.set("n", "<Leader>gf", vim.lsp.buf.format, {})

-- -- interfere's with leader + j
-- -- jumps
keymap.set('n', '<Leader>as', '<cmd>ju<CR>', {noremap = true, silent = true}) -- show jump list
keymap.set('n', '<Leader>nn', '<C-O>', {noremap = true, silent = true}) -- next
keymap.set('n', '<Leader>mm', '<C-I>', {noremap = true, silent = true}) -- back
keymap.set('n', '<Leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true, silent = true}) -- to next issue
keymap.set('n', '<Leader>gm', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true, silent = true}) -- to prev issue

-- terminal
keymap.set('n', '<Leader>tt', ':<C-u>terminal<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>td', ':<C-u>bd!<CR>', { noremap = true, silent = true })
keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap.set('t', 'jj', '<C-\\><C-n>', { noremap = true, silent = true })

-- aerial
-- Check lua/plugins/aerial.lua
-- vim.keymap.set("n", "[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
-- vim.keymap.set("n", "]", "<cmd>AerialNext<CR>", { buffer = bufnr })
-- vim.keymap.set("n", "ae", "<cmd>AerialToggle<CR>", { buffer = bufnr })
-- vim.keymap.set("n", "fa", "<cmd>Telescope aerial<CR>")

-- lazygit
-- Check lua/plugins/lazygit.lua
-- { "<leader>tg", "<cmd>LazyGit<cr>", desc = "LazyGit" }

-- neotree
-- Check lua/plugins/neotree.lua
-- vim.keymap.set('n', '<leader>ft', ':Neotree filesystem toggle<CR>', {})
