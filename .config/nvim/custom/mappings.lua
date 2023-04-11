local M = {}

M.truzen = {
   n = {
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "= truzen ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "= truzen minimal" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "= truzen focus" },
   },
}

M.sniprun = {
  v = {
    ["<leader>sr"] = { "<cmd> SnipRun <CR>", "Run the highlighted code block"}
  }
}
M.treesitter = {
   n = {
      ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "= find media" },
   },
}

M.trouble = {
  n = {
    ["<leader>tr"] = { "<cmd> TroubleToggle <CR>", "= trouble toggle"}
  }
}

M.symbols = {
  n = {
    ["<leader>ts"] = { "<cmd> SymbolsOutline <CR>", "= symbols outline"}
  }
}

M.todo = {
  n = {
    ["<leader>td"] = { "<cmd> TodoTrouble <CR>", " = views todo in trouble "}
  }
}

M.exit = {
  i = {
    ["jk"] = { "<ESC>", " = exit insert mode"}
  }
}

M.formatting = {
  n = {
    ["<leader>fm"] = { "<cmd> Neoformat black <CR>", " = format current python file using black"},
    ["<leader>fmy"] = { "<cmd> Neoformat yapf <CR>", " = format current python file using yapf"}
  }
}

M.markdown = {
  n = {
    ["<leader>md"] = { "<cmd> MarkdownPreview <CR>", " = start a markdown preview session"}
  }
}

M.blame = {
  n = {
    ["<leader>oc"] = { "<cmd> GitBlameOpenCommitURL <CR>", " = open the commit url"}
  }
}

M.lazy = {
  n = {
    ["<leader>lg"] = { "<cmd> LazyGit <CR>", " = open lazy git"}
  }
}

return M

