-- NeoTree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")
-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- Focus switching
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- Bufferline
vim.keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>")
vim.keymap.set("n", "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>")
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<leader>c", function() require("mini.bufremove").delete(0, false) end)
vim.keymap.set("n", "<leader>C", function() require("mini.bufremove").delete(0, true) end)
-- ToggleTerm
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>")
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>")
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
-- Aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle! right<cr>")
-- Comment
-- TODO
-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})
-- Moving single lines
vim.keymap.set('n', '<A-j>', ':m +1<CR>')
vim.keymap.set('n', '<A-k>', ':m -2<CR>')
-- Moving multiple lines
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
