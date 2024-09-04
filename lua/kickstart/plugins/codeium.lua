return {
  "Exafunction/codeium.vim",
  event = 'BufEnter',
  config = function()
    vim.keymap.set('i', '<M-w><Tab>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true, desc = '[W]odeium Accept' })
    vim.keymap.set('i', '<M-w>n', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true, desc = '[W]odeium [N]ext Suggestion' })
    vim.keymap.set('i', '<M-w>p', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true, desc = '[W]odeium [P]revious Suggestion' })
    vim.keymap.set('i', '<M-w>c', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true, desc = '[W]odeium [C]lear Suggestion' })
    vim.keymap.set('i', '<M-w>w', function()
      return vim.fn['codeium#AcceptNextWord']()
    end, { expr = true, silent = true, desc = '[W]odeium Accept Next [W]ord' })
    vim.keymap.set('i', '<M-w>L', function()
      return vim.fn['codeium#AcceptNextLine']()
    end, { expr = true, silent = true, desc = '[W]odeium Accept Next [L]ine' })
    vim.keymap.set('n', '<M-w>s', function()
      return vim.fn['codeium#Chat']()
    end, { desc = '[W]odeium [S]tart Chat' })

    vim.g.codeium_disable_bindings = 1
  end
}
