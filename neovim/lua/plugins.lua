# bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "phaazon/hop.nvim", branch = "v2" },
  "Vonr/align.nvim",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  "kyazdani42/nvim-web-devicons",
}
local neovim_plugins = {
  {
    "neoclide/coc.nvim",
    branch = "release",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
  },

  {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    -- dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    -- },
  },
  "lervag/vimtex",
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = "typst"
    version = "1.*",
    build = function() require "typst-preview".update() end,
  },

  -- "shaunsingh/nord.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "numToStr/Comment.nvim",
    "nvim-lualine/lualine.nvim",
    "lambdalisue/suda.vim",
    "akinsho/bufferline.nvim",
    "jlanzarotta/bufexplorer",
    "rcarriga/nvim-notify",
    "kyazdani42/nvim-tree.lua",
    "akinsho/toggleterm.nvim",
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disable_mouse = false,
      max_time = 750,
      disabled_keys = {
        ["<Left>"] = false, ["<Right>"] = false,
        ["<Up>"] = false, ["<Down>"] = false,
      },
    },
  },
}

local plugin_files = {
  "hop", "align",
}
local neovim_plugin_files = {
  "coc-nvim", "dap",
  "treesitter", "vimtex",
  "nvim-tree", "lualine", "bufferline", "notify",
  "toggleterm", "Comment",
}

if not vim.g.vscode then
  vim.list_extend(plugins, neovim_plugins)
  vim.list_extend(plugin_files, neovim_plugin_files)
end

require("lazy").setup(plugins)
-- Add lualine only when not in VSCode

for i = 1, #plugin_files do
  local plugin = plugin_files[i]
  -- print("Load plugin config file: "..plugin)
  require("plugin_config/" .. plugin)
end
