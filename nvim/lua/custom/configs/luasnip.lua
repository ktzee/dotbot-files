local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

luasnip.filetype_extend("templ", {"html"})
luasnip.filetype_extend("svelte", {"html"})
