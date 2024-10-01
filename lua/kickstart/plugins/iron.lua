return {
  'Vigemus/iron.nvim',
  keys = {
    { "<leader>ic",       function() require("iron.core").run_motion("send_motion") end,  desc = "[I]ron Send Motion" },
    { "<leader>im",       function() require("iron.core").send_mark() end,                desc = "[I]ron Send Mark" },
    { "<leader>il",       function() require("iron.core").send_line() end,                desc = "[I]ron Send Line" },
    { "<leader>iu",       function() require("iron.core").send_until_cursor() end,        desc = "[I]ron Send Until Cursor" },
    { "<leader>if",       function() require("iron.core").send_file() end,                desc = "[I]ron Send File" },
    { "<leader>ip",       function() require("iron.core").send_paragraph() end,           desc = "[I]ron Send Paragraph" },
    { "<leader>imc",      function() require("iron.core").run_motion("mark_motion") end,  desc = "[I]ron Mark Motion" },
    { "<leader>imd",      function() require("iron.core").remove_mark() end,              desc = "[I]ron Remove Mark" },
    { "<leader>i<cr>",    function() require("iron.core").send(nil, string.char(13)) end, desc = "[I]ron CR" },
    { "<leader>i<space>", function() require("iron.core").send(nil, string.char(03)) end, desc = "[I]ron Interrupt" },
    { "<leader>iq",       function() require("iron.core").close_repl() end,               desc = "[I]ron Exit" },
    { "<leader>ix",       function() require("iron.core").send(nil, string.char(12)) end, desc = "[I]ron Clear" },
    { "<leader>is",       '<cmd>IronRepl<cr>',                                            desc = "[I]ron Repl" },
    { "<leader>ir",       '<cmd>IronRestart<cr>',                                         desc = "[I]ron Restart" },
    { "<leader>if",       '<cmd>IronFocus<cr>',                                           desc = "[I]ron Focus" },
    { "<leader>ih",       '<cmd>IronHide<cr>',                                            desc = "[I]ron Hide" },
  },
  config = function()
    -- { "v", "<leader>imc",      function() require("iron.core").mark_visual() end,              desc = "[I]ron Mark Visual" },
    -- { "v", "<leader>ic",       function() require("iron.core").visual_send() end,              desc = "[I]ron Visual Send" },
    local view = require("iron.view")
    require('iron.core').setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a string or a table with two string elements
            command = { 'bash' },
          },
          python = {
            command = { "ipython" },

          }
        },

        repl_open_cmd = view.split.vertical.botright(0.5),

        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        -- keymaps = {
        --   send_motion = "<space>ic",
        --   visual_send = "<space>ic",
        --   send_file = "<space>if",
        --   send_line = "<space>il",
        --   send_mark = "<space>im",
        --   mark_motion = "<space>imc",
        --   mark_visual = "<space>imc",
        --   remove_mark = "<space>imd",
        --   cr = "<space>i<cr>",
        --   interrupt = "<space>i<space>",
        --   exit = "<space>iq",
        --   clear = "<space>ix",
        -- },
      }
    })
  end
}
