return {
  'CRAG666/code_runner.nvim',
  dependencies = { "ThePrimeagen/harpoon" },
  config = function()
    require('code_runner').setup({
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
      },
    })

    vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { desc = "[R]un Code", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { desc = "[R]unFile", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { desc = "[R]un File Tab", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { desc = "[R]un Project", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { desc = "[R]un Close", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { desc = "C[R]Filetype", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { desc = "C[R]Projects", noremap = true, silent = false })

    -- require("harpoon.term").sendCommand(1, require("code_runner.commands").get_filetype_command() .. "\n")
  end
}
