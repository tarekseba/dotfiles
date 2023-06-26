local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings2 = {
  D = {
    name = "JAJA",
    o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "JOKE IS ON YOU" },
  },
}

which_key.register(mappings2, opts)

