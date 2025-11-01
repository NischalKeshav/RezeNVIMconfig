local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- JavaScript/TypeScript snippets
ls.add_snippets("javascript", {
  s("cl", {
    t("console.log("),
    i(1),
    t(");"),
  }),
  s("fn", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2),
    t(") {"),
    t({"", "  "}),
    i(3),
    t({"", "}"}),
  }),
  s("af", {
    t("const "),
    i(1, "name"),
    t(" = ("),
    i(2),
    t(") => {"),
    t({"", "  "}),
    i(3),
    t({"", "};"}),
  }),
  s("raf", {
    t("const "),
    i(1, "Component"),
    t(" = () => {"),
    t({"", "  return (", "    "}),
    i(2),
    t({"", "  );", "};", "", "export default "}),
    ls.function_node(function(args) return args[1][1] end, {1}),
    t(";"),
  }),
})

-- Copy JS snippets to TypeScript and React
ls.add_snippets("typescript", ls.get_snippets("javascript"))
ls.add_snippets("typescriptreact", ls.get_snippets("javascript"))
ls.add_snippets("javascriptreact", ls.get_snippets("javascript"))

-- HTML snippets
ls.add_snippets("html", {
  s("html5", {
    t({"<!DOCTYPE html>", "<html lang=\"en\">", "<head>", "  <meta charset=\"UTF-8\">", 
       "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
       "  <title>"}),
    i(1, "Document"),
    t({"</title>", "</head>", "<body>", "  "}),
    i(2),
    t({"", "</body>", "</html>"}),
  }),
  s("div", {
    t("<div class=\""),
    i(1),
    t({"\">", "  "}),
    i(2),
    t({"", "</div>"}),
  }),
  s("link", {
    t("<link rel=\"stylesheet\" href=\""),
    i(1, "style.css"),
    t("\">"),
  }),
  s("script", {
    t("<script src=\""),
    i(1, "script.js"),
    t("\"></script>"),
  }),
})

-- CSS snippets
ls.add_snippets("css", {
  s("flex", {
    t({"display: flex;", "justify-content: "}),
    i(1, "center"),
    t({";", "align-items: "}),
    i(2, "center"),
    t(";"),
  }),
  s("grid", {
    t({"display: grid;", "grid-template-columns: "}),
    i(1, "repeat(3, 1fr)"),
    t({";", "gap: "}),
    i(2, "1rem"),
    t(";"),
  }),
  s("media", {
    t("@media (max-width: "),
    i(1, "768px"),
    t({") {", "  "}),
    i(2),
    t({"", "}"}),
  }),
})

-- Python snippets
ls.add_snippets("python", {
  s("def", {
    t("def "),
    i(1, "function_name"),
    t("("),
    i(2),
    t({"):", "    "}),
    i(3, "pass"),
  }),
  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({":", "    def __init__(self"}),
    i(2),
    t({"):", "        "}),
    i(3, "pass"),
  }),
  s("if", {
    t("if "),
    i(1, "condition"),
    t({":", "    "}),
    i(2),
  }),
})

-- C/C++ snippets
ls.add_snippets("c", {
  s("main", {
    t({"int main() {", "    "}),
    i(1),
    t({"", "    return 0;", "}"}),
  }),
  s("for", {
    t("for (int "),
    i(1, "i"),
    t(" = "),
    i(2, "0"),
    t("; "),
    ls.function_node(function(args) return args[1][1] end, {1}),
    t(" < "),
    i(3, "n"),
    t("; "),
    ls.function_node(function(args) return args[1][1] end, {1}),
    t({"++) {", "    "}),
    i(4),
    t({"", "}"}),
  }),
})

ls.add_snippets("cpp", ls.get_snippets("c"))
