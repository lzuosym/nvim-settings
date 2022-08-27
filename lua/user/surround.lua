local status_ok, surround = pcall(require, "surround")
if not status_ok then
  vim.notify("plugin surround not found")
end

surround.setup({
  context_offset = 100,
  load_autogroups = false,
  mappings_style = "sandwich",
  map_insert_mode = true,
  quotes = { "'", '"', "*" },
  brackets = { "(", '{', '[' },
  space_on_closing_char = false,
  pairs = {
    nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
    linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' }, s = { '*', '*' } },
  },
  prefix = "s",
})
