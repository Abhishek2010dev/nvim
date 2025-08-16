return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup{
      size = 20,
      open_mapping = [[<c-\>]],  -- default shortcut to open terminal
      direction = "float",
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
    }

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    -- Global shortcuts to open terminals in different directions
    vim.keymap.set('n', '<leader>tf', function()
      require("toggleterm.terminal").Terminal:new({direction = "float"}):toggle()
    end, {desc = "Toggle floating terminal"})

    vim.keymap.set('n', '<leader>th', function()
      require("toggleterm.terminal").Terminal:new({direction = "horizontal"}):toggle()
    end, {desc = "Toggle horizontal terminal"})

    vim.keymap.set('n', '<leader>tv', function()
      require("toggleterm.terminal").Terminal:new({direction = "vertical"}):toggle()
    end, {desc = "Toggle vertical terminal"})
  end
}

