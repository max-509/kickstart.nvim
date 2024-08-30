return {
  'CRAG666/code_runner.nvim',
  dependencies = { "ThePrimeagen/harpoon" },
  config = function()
    require('code_runner').setup({
      float = {
        close_key = "<ESC>",
        -- Window border (see ':h nvim_open_win')
        border = "none",

        -- Num from `0 - 1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Transparency (see ':h winblend')
        blend = 0,
      },
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt"
        },
        c = function()
          local c_base = {
            "cd $dir &&",
            "gcc $fileName -o",
            "/tmp/$fileNameWithoutExt",
          }
          local c_exec = {
            "&& /tmp/$fileNameWithoutExt &&",
            "rm /tmp/$fileNameWithoutExt",
          }
          vim.ui.input({ prompt = "Add more args:" }, function(input)
            c_base[4] = input
            vim.print(vim.tbl_extend("force", c_base, c_exec))
            require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
          end)
        end,
        sh = "./$fileName",
        go = "go run",
      },
    })

    vim.keymap.set('n', '<leader>Rc', ':RunCode<CR>', { desc = "[R]un Code", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>Rf', ':RunFile<CR>', { desc = "[R]un File", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>Rft', ':RunFile tab<CR>', { desc = "[R]un File Tab", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>Rp', ':RunProject<CR>', { desc = "[R]un Project", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>RC', ':RunClose<CR>', { desc = "[R]un Close", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>CRf', ':CRFiletype<CR>', { desc = "C[R]Filetype", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>CRp', ':CRProjects<CR>', { desc = "C[R]Projects", noremap = true, silent = false })

    -- require("harpoon.term").sendCommand(1, require("code_runner.commands").get_filetype_command() .. "\n")
  end
}
