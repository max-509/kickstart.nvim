return {

  { -- Linting
    'mfussenegger/nvim-lint',
    dependencies = {
      -- Installs the linters for you
      'williamboman/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mason').setup()

      local linters = {
        'markdownlint',
      }
      require('mason-tool-installer').setup {
        ensure_installed = linters,
      }

      local lint = require 'lint'
      local clangd_clangtidy_func = function()
        local pattern = [[([^:]*):(%d+):(%d+): (%w+): ([^[]+)]]
        local groups = { 'file', 'lnum', 'col', 'severity', 'message' }

        local severity_map = {
          ['error'] = vim.diagnostic.severity.ERROR,
          ['warning'] = vim.diagnostic.severity.WARN,
          ['information'] = vim.diagnostic.severity.INFO,
          ['hint'] = vim.diagnostic.severity.HINT,
          ['note'] = vim.diagnostic.severity.HINT,
        }

        return {
          name = 'clangd_clangtidy',
          cmd = 'clangd',
          args = { '--clang-tidy' },
          stdin = false,
          ignore_exitcode = true,
          parser = require('lint.parser').from_pattern(pattern, groups, severity_map,
            { ['source'] = 'clangd_clangtidy' })
        }
      end

      lint.linters.clangd_clangtidy = clangd_clangtidy_func()
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        -- cpp = { 'clangd_clangtidy_func' },
        -- c = { 'clangd_clangtidy_func' },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
