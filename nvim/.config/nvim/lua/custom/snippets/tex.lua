local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('fig', {
    t '\\begin{figure}[H]\n\\centering\n\\includegraphics[width=\\textwidth]{',
    i(1, 'path/to/image'),
    t '}\n\\caption{',
    i(2, 'Caption'),
    t '}\n\\label{fig:',
    i(3, 'label'),
    t '}\n\\end{figure}\n',
  }),
}
