local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'nvim-lua/plenary.nvim'} -- Common utilities
  use {'EdenEast/nightfox.nvim'} -- Color scheme

  -- Icons
  use {'kyazdani42/nvim-web-devicons'}

  -- Statusline
  use {'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  
  -- tab
  use {'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- lsp
  use {'neovim/nvim-lspconfig'} -- Configurations for Nvim LSP
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}

  -- autopair
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end
  })

  -- auto cmp
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-path'}


  -- surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  -- colorizer
  use {'brenoprata10/nvim-highlight-colors'}


  if packer_bootstrap then
    require('packer').sync()
  end
end)


