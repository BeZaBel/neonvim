return {
  "HakonHarnes/img-clip.nvim",
  cmd = "PasteImage",
  opts = {
    dir_path = "assets",
    filee_name = "%Y-%m-%d-%H-%M",
    use_absolute_path = false,
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
}
