return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
    dependencies = 'neovim/nvim-lspconfig',
  },
  -- {
  --   'rust-lang/rust.vim',
  --   ft = 'rust',
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end,
  -- },
}
