return {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    { "<leader>jj",  function() require("notebook-navigator").move_cell "d" end,     desc = "[J]Notebook Move Cell Down" },
    { "<leader>jk",  function() require("notebook-navigator").move_cell "u" end,     desc = "[J]Notebook Move Cell Up" },
    { "<leader>jsj", function() require("notebook-navigator").swap_cell "d" end,     desc = "[J]Notebook Swap Cell Down" },
    { "<leader>jsk", function() require("notebook-navigator").swap_cell "u" end,     desc = "[J]Notebook Swap Cell Up" },
    { "<leader>jmj", function() require("notebook-navigator").merge_cell "d" end,    desc = "[J]Notebook Merge Cell Down" },
    { "<leader>jmk", function() require("notebook-navigator").merge_cell "u" end,    desc = "[J]Notebook Merge Cell Up" },
    { "<leader>jrX", "<cmd>lua require('notebook-navigator').run_cell()<cr>",        desc = "[J]Notebook Run Cell" },
    { "<leader>jrx", "<cmd>lua require('notebook-navigator').run_and_move()<cr>",    desc = "[J]Notebook Run And Move" },
    { "<leader>jra", "<cmd>lua require('notebook-navigator').run_all_cells()<cr>",   desc = "[J]Notebook Run All Cells" },
    { "<leader>jrb", "<cmd>lua require('notebook-navigator').run_cells_below()<cr>", desc = "[J]Notebook Run Cells Below" },
    { "<leader>ja",  "<cmd>lua require('notebook-navigator').add_cell_below()<cr>",  desc = "[J]Notebook Add Cell Below" },
    { "<leader>jb",  "<cmd>lua require('notebook-navigator').add_cell_above()<cr>",  desc = "[J]Notebook Add Cell Above" },
    { "<leader>jc",  "<cmd>lua require('notebook-navigator').comment_cell()<cr>",    desc = "[J]Notebook Comment Cell" },
    { "<leader>jS",  "<cmd>lua require('notebook-navigator').split_cell()<cr>",    desc = "[J]Notebook Split Cell" },
  },
  dependencies = {
    "echasnovski/mini.comment",
    "Vigemus/iron.nvim", -- repl provider
    -- "akinsho/toggleterm.nvim", -- alternative repl provider
    -- "benlubas/molten-nvim", -- alternative repl provider
    "anuvyklack/hydra.nvim",
  },
  event = "VeryLazy",
  config = function()
    local nn = require "notebook-navigator"
    nn.setup({ activate_hydra_keys = "<leader>h" })
  end,
}
