local options = {

    base46 = {
      integrations = {
        "blankline",
        "cmp",
        "defaults",
        "devicons",
        "git",
        "lsp",
        "mason",
        "nvcheatsheet",
        "nvdash",
        "nvimtree",
        "statusline",
        "syntax",
        "tbline",
        "telescope",
        "treesitter",
        "rainbowdelimiters",
        "todo",
      },
    }

    ui = {
      theme = "gruvchad",

        -- hl_override = {
        -- 	Comment = { italic = true },
        -- 	["@comment"] = { italic = true },
        -- },

      transparency = true,
      statusline = {
        -- default/vscode/vscode_colored/minimal
        theme = "default",
        -- default/round/block/arrow (separators work only for "default" statusline theme;
        -- round and block will work for the minimal theme only)
        separator_style = "arrow",
        overriden_modules = nil,
      },
    }

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = true,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
    },

    mason = {
      cmd = true,
      pkgs = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev stuff
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "deno",
      "prettier",

      -- c/cpp stuff
      "clangd",
      "clang-format",
      "omnisharp@v1.39.8",

      -- python
      "black",
      "flake8",
      "mypy",
      "pyright",

      -- LaTeX
      "texlab",
      "ltex-ls",

      -- rust
      "codelldb",
      "rust_analyzer",
      }
    },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
