local nvim_lsp = require('lspconfig')
local completion = require('completion')
local lsp_status = require('lsp-status')

lsp_status.register_progress()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  completion.on_attach(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_command('autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 500)')
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_command('autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 500)')
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold gui=bold
      hi LspReferenceText cterm=bold gui=bold
      hi LspReferenceWrite cterm=bold gui=bold
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
  vim.api.nvim_command('autocmd CursorHold,CursorHoldI,CursorMoved *.rs :lua require\'lsp_extensions\'.inlay_hints{ prefix = " » ", highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }')
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "bashls", "cssls", "dockerls", "gopls", "html", "tsserver", "pyls", "terraformls", "vimls", "yamlls", "sumneko_lua" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { 
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
  }
end

require'lspconfig'.jsonls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
  settings = {
    cmd = { "json-languageserver", "--stdio" }
  },
})

require'lspconfig'.svelte.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
})

require'lspconfig'.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
  settings = {
    ["rust-analyzer"] = {
      --checkOnSave = { enable = false },
      --procMacro = { enable = true },
      diagnostics = {
        enable = true,
        disabled = {"unresolved-proc-macro"},
        enableExperimental = true,
      },
    }
  }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
