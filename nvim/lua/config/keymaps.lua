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
keymap.set('n', '<Leader>ss', ':<C-u>wincmd v<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>sS', ':<C-u>wincmd s<CR>', { noremap = true, silent = true })

-- wincmd manage window
keymap.set('n', '<Leader>oo', ':<C-u>wincmd o<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>wr', ':<C-u>wincmd r<CR>', { noremap = true, silent = true })
-- keymap.set('n', '<Leader>wj', ':<C-u>wincmd J<CR>', { noremap = true, silent = true })
-- keymap.set('n', '<Leader>wh', ':<C-u>wincmd H<CR>', { noremap = true, silent = true })

-- Buffer
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
keymap.set('n', '<Leader>gs',
    ':<C-u>lua vim.diagnostic.open_float(nil, {close_events = {"CursorMoved" , "InsertLeave"}})<CR>',
    { noremap = true, silent = true })                                                    -- g + s (show)
keymap.set('n', '<Leader>ga', vim.lsp.buf.code_action, { noremap = true, silent = true }) -- g + a (action)
keymap.set('n', '<Leader>gg', vim.lsp.buf.hover, { noremap = true, silent = true })       -- g + g (google)
keymap.set("n", "<Leader>gf", vim.lsp.buf.format, {})                                     -- g + f (format)
-- keymap.set('n', '<Leader>gr', vim.lsp.buf.references, { noremap = true, silent = true })
-- keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, { noremap = true, silent = true }) -- to def

-- jumps
-- keymap.set('n', '<Leader>nn', '<cmd>ju<CR>', { noremap = true, silent = true })                             -- show jump list
-- keymap.set('n', '<Leader>nh', '<C-O>', { noremap = true, silent = true })                                   -- next
-- keymap.set('n', '<Leader>nj', '<C-I>', { noremap = true, silent = true })                                   -- back
-- keymap.set('n', '<Leader>mh', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true }) -- to next issue
-- keymap.set('n', '<Leader>mj', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true }) -- to prev issue

-- Telescope
local tele_builtin = require('telescope.builtin')
local utils = require('config.utils')
-- Telescope - find  - f (find)
keymap.set('n', '<leader>fc', tele_builtin.resume, {})  -- f + c (continue)
keymap.set('n', '<leader>fC', tele_builtin.pickers, {}) -- f + C (CONTINUE)

keymap.set('n', '<leader>ff', tele_builtin.find_files, {})
keymap.set('n', '<leader>fg', tele_builtin.live_grep, {})
keymap.set('n', '<leader>fb', tele_builtin.buffers, {})

keymap.set('n', '<leader>f/', tele_builtin.search_history, {})
-- keymap.set('n', '<leader>fr', tele_builtin.lsp_references, {}) -- not working
keymap.set('n', '<leader>fw', tele_builtin.treesitter, {})

-- Telescope - git - v (version)
keymap.set('n', '<leader>vo', tele_builtin.git_commits, {})
keymap.set('n', '<leader>vp', tele_builtin.git_branches, {})

-- Telescope - file browser
keymap.set('n', '<leader>fv', ':<C-u>Telescope file_browser path=%:p:h slsect_buffer=true<CR>', {})

-- Neotree
keymap.set('n', '<leader>tt', ':Neotree filesystem toggle<CR>', {})

-- Diffview
keymap.set('n', '<leader>vq', ':DiffviewClose<CR>', {})  -- version quit

keymap.set('n', '<leader>vv', ':DiffviewToggle<CR>', {}) -- verion view
keymap.set('n', '<leader>vg', utils.plugin_commands_picker, {}) -- plugin commands (git, tree, etc)
keymap.set('n', '<leader>vt', tele_builtin.commands, {})
keymap.set('n', '<leader>vm', tele_builtin.keymaps, {})
keymap.set('n', '<leader>vn', tele_builtin.pickers, {})
keymap.set('n', '<leader>vl', utils.telescope_to_diffview(tele_builtin.git_commits, '^!', {
    git_command = { 'git', 'log', '--pretty=%h - %s <%an> (%ar)', '--date=relative', '--', '.' }
}), {}) -- version list
keymap.set('n', '<leader>v;', utils.telescope_to_diffview(tele_builtin.git_branches, '', {
    git_command = { 'git', 'branch', '--sort=-committerdate', '--format=%(refname:short)' },
    preview = {
        preview_command = { 'git', 'log', '--graph', '--pretty=%h - %s <%an> (%ar)', '--date=relative', '--color=always' }
    }
}), {})                                                       -- version branch
keymap.set('n', '<leader>vh', ':DiffviewFileHistory %<CR>', {}) -- version history (current file)
keymap.set('n', '<leader>vj', utils.file_picker_to_diffview_history(tele_builtin.find_files, {}), {}) -- version file history (pick file)
keymap.set('n', '<leader>vk', utils.file_browser_to_diffview_history({}), {}) -- version file history (file browser)

keymap.set('n', '<leader>nn', ':NoNeckPain<CR>', {}) -- version file history (file browser)
