local M = {}

M.truzen = {
   n = {
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "= truzen ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "= truzen minimal" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "= truzen focus" },
   },
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

return M

