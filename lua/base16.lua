local nvim = require 'nvim'

local function highlight(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
	local parts = {group}
	if guifg then table.insert(parts, "guifg=#"..guifg) end
	if guibg then table.insert(parts, "guibg=#"..guibg) end
	if ctermfg then table.insert(parts, "ctermfg="..ctermfg) end
	if ctermbg then table.insert(parts, "ctermbg="..ctermbg) end
	if attr then
		table.insert(parts, "gui="..attr)
		table.insert(parts, "cterm="..attr)
	end
	if guisp then table.insert(parts, "guisp=#"..guisp) end

	-- nvim.ex.highlight(parts)
	vim.api.nvim_command('highlight '..table.concat(parts, ' '))
end

-- Modified from https://github.com/chriskempson/base16-vim
local function apply_base16_theme(theme, use_256_colorspace)
	-- Terminal color definitions
	local cterm00        = "00"
	local cterm03        = "08"
	local cterm05        = "07"
	local cterm07        = "15"
	local cterm08        = "01"
	local cterm0A        = "03"
	local cterm0B        = "02"
	local cterm0C        = "06"
	local cterm0D        = "04"
	local cterm0E        = "05"

	local cterm01, cterm02, cterm04, cterm06, cterm09, cterm0F

	if use_256_colorspace then
		cterm01 = "18"
		cterm02 = "19"
		cterm04 = "20"
		cterm06 = "21"
		cterm09 = "16"
		cterm0F = "17"
	else
		cterm01 = "10"
		cterm02 = "11"
		cterm04 = "12"
		cterm06 = "13"
		cterm09 = "09"
		cterm0F = "14"
	end

	-- Neovim terminal colours
	if nvim.fn.has("nvim") then
		nvim.g.terminal_color_0 =  "#"..theme.base00
		nvim.g.terminal_color_1 =  "#"..theme.base08
		nvim.g.terminal_color_2 =  "#"..theme.base0B
		nvim.g.terminal_color_3 =  "#"..theme.base0A
		nvim.g.terminal_color_4 =  "#"..theme.base0D
		nvim.g.terminal_color_5 =  "#"..theme.base0E
		nvim.g.terminal_color_6 =  "#"..theme.base0C
		nvim.g.terminal_color_7 =  "#"..theme.base05
		nvim.g.terminal_color_8 =  "#"..theme.base03
		nvim.g.terminal_color_9 =  "#"..theme.base08
		nvim.g.terminal_color_10 = "#"..theme.base0B
		nvim.g.terminal_color_11 = "#"..theme.base0A
		nvim.g.terminal_color_12 = "#"..theme.base0D
		nvim.g.terminal_color_13 = "#"..theme.base0E
		nvim.g.terminal_color_14 = "#"..theme.base0C
		nvim.g.terminal_color_15 = "#"..theme.base07
		if nvim.o.background == "light" then
			nvim.g.terminal_color_background = "#"..theme.base05
			nvim.g.terminal_color_foreground = "#"..theme.base0B
		else
			nvim.g.terminal_color_background = "#"..theme.base00
			nvim.g.terminal_color_foreground = "#"..theme.base0E
		end
	-- VIM, not NVIM settings
	-- elseif nvim.fn.has("terminal") then
	-- 	nvim.g.terminal_ansi_colors = {
	-- 		theme.base00,
	-- 		theme.base08,
	-- 		theme.base0B,
	-- 		theme.base0A,
	-- 		theme.base0D,
	-- 		theme.base0E,
	-- 		theme.base0C,
	-- 		theme.base05,
	-- 		theme.base03,
	-- 		theme.base08,
	-- 		theme.base0B,
	-- 		theme.base0A,
	-- 		theme.base0D,
	-- 		theme.base0E,
	-- 		theme.base0C,
	-- 		theme.base07,
	-- 	}
	end

	-- TODO
	-- nvim.command "hi clear"
	-- nvim.command "syntax reset"

	-- Vim editor colors
	highlight("Normal",        theme.base05, theme.base00, cterm05, cterm00, nil, nil)
	highlight("Bold",          nil, nil, nil, nil, "bold", nil)
	highlight("Debug",         theme.base08, nil, cterm08, nil, nil, nil)
	highlight("Directory",     theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("Error",         theme.base00, theme.base08, cterm00, cterm08, nil, nil)
	highlight("ErrorMsg",      theme.base08, theme.base00, cterm08, cterm00, nil, nil)
	highlight("Exception",     theme.base08, nil, cterm08, nil, nil, nil)
	highlight("FoldColumn",    theme.base0C, theme.base01, cterm0C, cterm01, nil, nil)
	highlight("Folded",        theme.base03, theme.base01, cterm03, cterm01, nil, nil)
	highlight("IncSearch",     theme.base01, theme.base09, cterm01, cterm09, "none", nil)
	highlight("Italic",        nil, nil, nil, nil, "none", nil)
	highlight("Macro",         theme.base08, nil, cterm08, nil, nil, nil)
	highlight("MatchParen",    nil, theme.base03, nil, cterm03,  nil, nil)
	highlight("ModeMsg",       theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("MoreMsg",       theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("Question",      theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("Search",        theme.base01, theme.base0A, cterm01, cterm0A,  nil, nil)
	highlight("Substitute",    theme.base01, theme.base0A, cterm01, cterm0A, "none", nil)
	highlight("SpecialKey",    theme.base03, nil, cterm03, nil, nil, nil)
	highlight("TooLong",       theme.base08, nil, cterm08, nil, nil, nil)
	highlight("Underlined",    theme.base08, nil, cterm08, nil, nil, nil)
	highlight("Visual",        nil, theme.base02, nil, cterm02, nil, nil)
	highlight("VisualNOS",     theme.base08, nil, cterm08, nil, nil, nil)
	highlight("WarningMsg",    theme.base08, nil, cterm08, nil, nil, nil)
	highlight("WildMenu",      theme.base08, theme.base0A, cterm08, nil, nil, nil)
	highlight("Title",         theme.base0D, nil, cterm0D, nil, "none", nil)
	highlight("Conceal",       theme.base0D, theme.base00, cterm0D, cterm00, nil, nil)
	highlight("Cursor",        theme.base00, theme.base05, cterm00, cterm05, nil, nil)
	highlight("NonText",       theme.base03, nil, cterm03, nil, nil, nil)
	highlight("LineNr",        theme.base03, theme.base01, cterm03, cterm01, nil, nil)
	highlight("SignColumn",    theme.base03, theme.base01, cterm03, cterm01, nil, nil)
	highlight("StatusLine",    theme.base04, theme.base02, cterm04, cterm02, "none", nil)
	highlight("StatusLineNC",  theme.base03, theme.base01, cterm03, cterm01, "none", nil)
	highlight("VertSplit",     theme.base02, theme.base02, cterm02, cterm02, "none", nil)
	highlight("ColorColumn",   nil, theme.base01, nil, cterm01, "none", nil)
	highlight("CursorColumn",  nil, theme.base01, nil, cterm01, "none", nil)
	highlight("CursorLine",    nil, theme.base01, nil, cterm01, "none", nil)
	highlight("CursorLineNr",  theme.base04, theme.base01, cterm04, cterm01, nil, nil)
	highlight("QuickFixLine",  nil, theme.base01, nil, cterm01, "none", nil)
	highlight("PMenu",         theme.base05, theme.base01, cterm05, cterm01, "none", nil)
	highlight("PMenuSel",      theme.base01, theme.base05, cterm01, cterm05, nil, nil)
	highlight("TabLine",       theme.base03, theme.base01, cterm03, cterm01, "none", nil)
	highlight("TabLineFill",   theme.base03, theme.base01, cterm03, cterm01, "none", nil)
	highlight("TabLineSel",    theme.base0B, theme.base01, cterm0B, cterm01, "none", nil)

	-- Standard syntax highlighting
	highlight("Boolean",      theme.base09, nil, cterm09, nil, nil, nil)
	highlight("Character",    theme.base08, nil, cterm08, nil, nil, nil)
	highlight("Comment",      theme.base03, nil, cterm03, nil, "italic", nil)
	highlight("Conditional",  theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("Constant",     theme.base09, nil, cterm09, nil, nil, nil)
	highlight("Define",       theme.base0E, nil, cterm0E, nil, "none", nil)
	highlight("Delimiter",    theme.base0F, nil, cterm0F, nil, nil, nil)
	highlight("Float",        theme.base09, nil, cterm09, nil, nil, nil)
	highlight("Function",     theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("Identifier",   theme.base08, nil, cterm08, nil, "none", nil)
	highlight("Include",      theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("Keyword",      theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("Label",        theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("Number",       theme.base09, nil, cterm09, nil, nil, nil)
	highlight("Operator",     theme.base05, nil, cterm05, nil, "none", nil)
	highlight("PreProc",      theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("Repeat",       theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("Special",      theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("SpecialChar",  theme.base0F, nil, cterm0F, nil, nil, nil)
	highlight("Statement",    theme.base08, nil, cterm08, nil, nil, nil)
	highlight("StorageClass", theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("String",       theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("Structure",    theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("Tag",          theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("Todo",         theme.base0A, theme.base01, cterm0A, cterm01, nil, nil)
	highlight("Type",         theme.base0A, nil, cterm0A, nil, "none", nil)
	highlight("Typedef",      theme.base0A, nil, cterm0A, nil, nil, nil)

	---
	-- Extra definitions
	---

	-- C highlighting
	highlight("cOperator",   theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("cPreCondit",  theme.base0E, nil, cterm0E, nil, nil, nil)

	-- C# highlighting
	highlight("csClass",                 theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("csAttribute",             theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("csModifier",              theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("csType",                  theme.base08, nil, cterm08, nil, nil, nil)
	highlight("csUnspecifiedStatement",  theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("csContextualStatement",   theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("csNewDecleration",        theme.base08, nil, cterm08, nil, nil, nil)

	-- CSS highlighting
	highlight("cssBraces",      theme.base05, nil, cterm05, nil, nil, nil)
	highlight("cssClassName",   theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("cssColor",       theme.base0C, nil, cterm0C, nil, nil, nil)

	-- Diff highlighting
	highlight("DiffAdd",      theme.base0B, theme.base01,  cterm0B, cterm01, nil, nil)
	highlight("DiffChange",   theme.base03, theme.base01,  cterm03, cterm01, nil, nil)
	highlight("DiffDelete",   theme.base08, theme.base01,  cterm08, cterm01, nil, nil)
	highlight("DiffText",     theme.base0D, theme.base01,  cterm0D, cterm01, nil, nil)
	highlight("DiffAdded",    theme.base0B, theme.base00,  cterm0B, cterm00, nil, nil)
	highlight("DiffFile",     theme.base08, theme.base00,  cterm08, cterm00, nil, nil)
	highlight("DiffNewFile",  theme.base0B, theme.base00,  cterm0B, cterm00, nil, nil)
	highlight("DiffLine",     theme.base0D, theme.base00,  cterm0D, cterm00, nil, nil)
	highlight("DiffRemoved",  theme.base08, theme.base00,  cterm08, cterm00, nil, nil)

	-- Git highlighting
	highlight("gitcommitOverflow",       theme.base08, nil, cterm08, nil, nil, nil)
	highlight("gitcommitSummary",        theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("gitcommitComment",        theme.base03, nil, cterm03, nil, "italic", nil)
	highlight("gitcommitUntracked",      theme.base03, nil, cterm03, nil, nil, nil)
	highlight("gitcommitDiscarded",      theme.base03, nil, cterm03, nil, nil, nil)
	highlight("gitcommitSelected",       theme.base03, nil, cterm03, nil, nil, nil)
	highlight("gitcommitHeader",         theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("gitcommitSelectedType",   theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("gitcommitUnmergedType",   theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("gitcommitDiscardedType",  theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("gitcommitBranch",         theme.base09, nil, cterm09, nil, "bold", nil)
	highlight("gitcommitUntrackedFile",  theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("gitcommitUnmergedFile",   theme.base08, nil, cterm08, nil, "bold", nil)
	highlight("gitcommitDiscardedFile",  theme.base08, nil, cterm08, nil, "bold", nil)
	highlight("gitcommitSelectedFile",   theme.base0B, nil, cterm0B, nil, "bold", nil)

	-- GitGutter highlighting
	highlight("GitGutterAdd",     theme.base0B, theme.base01, cterm0B, cterm01, nil, nil)
	highlight("GitGutterChange",  theme.base0D, theme.base01, cterm0D, cterm01, nil, nil)
	highlight("GitGutterDelete",  theme.base08, theme.base01, cterm08, cterm01, nil, nil)
	highlight("GitGutterChangeDelete",  theme.base0E, theme.base01, cterm0E, cterm01, nil, nil)

	-- HTML highlighting
	highlight("htmlArg",     nil, nil, nil, nil, "italic", nil)
	highlight("htmlBold",    theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("htmlItalic",  theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("htmlEndTag",  theme.base05, nil, cterm05, nil, nil, nil)
	highlight("htmlTag",     theme.base05, nil, cterm05, nil, nil, nil)

	-- JavaScript highlighting
	highlight("javaScript",        theme.base05, nil, cterm05, nil, nil, nil)
	highlight("javaScriptBraces",  theme.base05, nil, cterm05, nil, nil, nil)
	highlight("javaScriptNumber",  theme.base09, nil, cterm09, nil, nil, nil)
	-- pangloss/vim-javascript highlighting
	highlight("jsOperator",          theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("jsStatement",         theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("jsReturn",            theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("jsThis",              theme.base08, nil, cterm08, nil, nil, nil)
	highlight("jsClassDefinition",   theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("jsFunction",          theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("jsFuncName",          theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("jsFuncCall",          theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("jsClassFuncName",     theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("jsClassMethodType",   theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("jsRegexpString",      theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("jsGlobalObjects",     theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("jsGlobalNodeObjects", theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("jsExceptions",        theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("jsBuiltins",          theme.base0A, nil, cterm0A, nil, nil, nil)

	-- Mail highlighting
	highlight("mailQuoted1",  theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("mailQuoted2",  theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("mailQuoted3",  theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("mailQuoted4",  theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("mailQuoted5",  theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("mailQuoted6",  theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("mailURL",      theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("mailEmail",    theme.base0D, nil, cterm0D, nil, nil, nil)

	-- Markdown highlighting
	highlight("markdownCode",              theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("markdownError",             theme.base05, theme.base00, cterm05, cterm00, nil, nil)
	highlight("markdownCodeBlock",         theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("markdownHeadingDelimiter",  theme.base0D, nil, cterm0D, nil, nil, nil)

	-- NERDTree highlighting
	highlight("NERDTreeDirSlash",  theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("NERDTreeExecFile",  theme.base05, nil, cterm05, nil, nil, nil)

	-- PHP highlighting
	highlight("phpMemberSelector",  theme.base05, nil, cterm05, nil, nil, nil)
	highlight("phpComparison",      theme.base05, nil, cterm05, nil, nil, nil)
	highlight("phpParent",          theme.base05, nil, cterm05, nil, nil, nil)
	highlight("phpMethodsVar",      theme.base0C, nil, cterm0C, nil, nil, nil)

	-- Python highlighting
	highlight("pythonOperator",  theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("pythonRepeat",    theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("pythonInclude",   theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("pythonStatement", theme.base0E, nil, cterm0E, nil, nil, nil)

	-- Ruby highlighting
	highlight("rubyAttribute",               theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("rubyConstant",                theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("rubyInterpolationDelimiter",  theme.base0F, nil, cterm0F, nil, nil, nil)
	highlight("rubyRegexp",                  theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("rubySymbol",                  theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("rubyStringDelimiter",         theme.base0B, nil, cterm0B, nil, nil, nil)

	-- SASS highlighting
	highlight("sassidChar",     theme.base08, nil, cterm08, nil, nil, nil)
	highlight("sassClassChar",  theme.base09, nil, cterm09, nil, nil, nil)
	highlight("sassInclude",    theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("sassMixing",     theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("sassMixinName",  theme.base0D, nil, cterm0D, nil, nil, nil)

	-- Signify highlighting
	highlight("SignifySignAdd",     theme.base0B, theme.base01, cterm0B, cterm01, nil, nil)
	highlight("SignifySignChange",  theme.base0D, theme.base01, cterm0D, cterm01, nil, nil)
	highlight("SignifySignDelete",  theme.base08, theme.base01, cterm08, cterm01, nil, nil)

	-- Spelling highlighting
	highlight("SpellBad",     nil, nil, nil, nil, "undercurl", theme.base08)
	highlight("SpellLocal",   nil, nil, nil, nil, "undercurl", theme.base0C)
	highlight("SpellCap",     nil, nil, nil, nil, "undercurl", theme.base0D)
	highlight("SpellRare",    nil, nil, nil, nil, "undercurl", theme.base0E)

	-- Startify highlighting
	highlight("StartifyBracket",  theme.base03, nil, cterm03, nil, nil, nil)
	highlight("StartifyFile",     theme.base07, nil, cterm07, nil, nil, nil)
	highlight("StartifyFooter",   theme.base03, nil, cterm03, nil, nil, nil)
	highlight("StartifyHeader",   theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("StartifyNumber",   theme.base09, nil, cterm09, nil, nil, nil)
	highlight("StartifyPath",     theme.base03, nil, cterm03, nil, nil, nil)
	highlight("StartifySection",  theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("StartifySelect",   theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("StartifySlash",    theme.base03, nil, cterm03, nil, nil, nil)
	highlight("StartifySpecial",  theme.base03, nil, cterm03, nil, nil, nil)

	-- Java highlighting
	highlight("javaOperator",     theme.base0D, nil, cterm0D, nil, nil, nil)

	-- IndentBlankline highlighting
	highlight("IndentBlanklineChar",        theme.base01, nil, cterm01, nil, nil, nil)
	highlight("IndentBlanklineContextChar", theme.base02, nil, cterm02, nil, nil, nil)

	-- Cucumber highlighting
	highlight("cucumberBackground",      theme.base0E, nil, cterm0E, nil, "italic", nil)
	highlight("cucumberFeature",         theme.base08, nil, cterm08, nil, "italic", nil)
	highlight("cucumberGiven",           theme.base0E, nil, cterm0E, nil, "italic", nil)
	highlight("cucumberScenario",        theme.base0E, nil, cterm0E, nil, "italic", nil)
	highlight("cucumberScenarioOutline", theme.base0E, nil, cterm0E, nil, "italic", nil)
	highlight("cucumberThen",            theme.base0A, nil, cterm0A, nil, "italic", nil)
	highlight("cucumberWhen",            theme.base0D, nil, cterm0D, nil, "italic", nil)

	-- LSP diagnostics highlighting
	highlight("LspDiagnosticsDefaultHint",        theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("LspDiagnosticsDefaultInformation", theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("LspDiagnosticsDefaultWarning",     theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("LspDiagnosticsDefaultError",       theme.base08, nil, cterm08, nil, nil, nil)

	-- Tree-sitter highlighting (adapted from https://github.com/norcalli/nvim-base16.lua/pull/3 by https://github.com/maisiliym)
	highlight("TSNone",               theme.base05, theme.base00, cterm05, cterm00, nil, nil)
	highlight("TSPunctDelimiter",     theme.base07, nil, cterm07, nil, nil, nil)
	-- PunctBracket and PunctSpecial seemed wrong in the version of TS I was using (e.g. with "#{foo} #{bar}" in ruby)
	-- highlight("TSPunctBracket",       theme.base07, nil, cterm07, nil, nil, nil)
	-- highlight("TSPunctSpecial",       theme.base0F, nil, cterm0F, nil, nil, nil)
	highlight("TSConstant",           theme.base09, nil, cterm0B, nil, nil, nil)
	highlight("TSConstBuiltin",       theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("TSConstMacro",         theme.base0E, nil, cterm0E, nil, "none", nil)
	highlight("TSString",             theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("TSStringRegex",        theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("TSStringEscape",       theme.base0F, nil, cterm0F, nil, nil, nil)
	highlight("TSCharacter",          theme.base08, nil, cterm08, nil, nil, nil)
	highlight("TSNumber",             theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("TSBoolean",            theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("TSFloat",              theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("TSFunction",           theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("TSFuncBuiltin",        theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("TSFuncMacro",          theme.base08, nil, cterm08, nil, nil, nil)
	highlight("TSParameter",          theme.base08, nil, cterm08, nil, "none", nil)
	highlight("TSParameterReference", theme.base08, nil, cterm08, nil, "none", nil)
	highlight("TSMethod",             theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("TSField",              theme.base0A, nil, cterm0A, nil, "none", nil)
	highlight("TSProperty",           theme.base08, nil, cterm08, nil, "none", nil)
	highlight("TSConstructor",        theme.base0C, nil, cterm0C, nil, nil, nil)
	highlight("TSAnnotation",         theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("TSAttribute",          theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("TSNamespace",          theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("TSConditional",        theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("TSRepeat",             theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("TSLabel",              theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("TSOperator",           theme.base07, nil, cterm07, nil, "none", nil)
	highlight("TSKeyword",            theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("TSKeywordFunction",    theme.base0E, nil, cterm0E, nil, nil, nil)
	highlight("TSKeywordOperator",    theme.base05, nil, cterm05, nil, "none", nil)
	highlight("TSException",          theme.base08, nil, cterm08, nil, nil, nil)
	highlight("TSType",               theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("TSTypeBuiltin",        theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("TSInclude",            theme.base0D, nil, cterm0D, nil, nil, nil)
	highlight("TSVariableBuiltin",    theme.base0C, nil, cterm0C, nil, "italic", nil)
	highlight("TSText",               theme.base05, theme.base00, cterm05, cterm00, nil, nil)
	highlight("TSStrong",             theme.base07, theme.base00, cterm07, cterm00, "bold", nil)
	highlight("TSEmphasis",           theme.base06, theme.base00, cterm06, cterm00, "italic", nil)
	highlight("TSUnderline",          theme.base05, theme.base00, cterm05, cterm00, "underline", nil)
	highlight("TSTitle",              theme.base0D, nil, cterm0D, nil, "none", nil)
	highlight("TSLiteral",            theme.base0B, nil, cterm0B, nil, nil, nil)
	highlight("TSURI",                theme.base08, nil, cterm08, nil, nil, nil)
	highlight("TSTag",                theme.base0A, nil, cterm0A, nil, nil, nil)
	highlight("TSTagDelimiter",       theme.base0F, nil, cterm0F, nil, nil, nil)
	highlight("TSDefinitionUsage",    nil, theme.base02, nil, cterm02, nil, nil)
	highlight("TSDefinition",         theme.base01, theme.base0A, cterm01, cterm0A,  nil, nil)
	highlight("TSCurrentScope",       nil, theme.base01, nil, cterm01, "none", nil)

	-- TODO
	-- nvim.command 'syntax on'
end

local themes = {}

themes["3024"] = {
	base00 = "090300"; base01 = "3a3432"; base02 = "4a4543"; base03 = "5c5855";
	base04 = "807d7c"; base05 = "a5a2a2"; base06 = "d6d5d4"; base07 = "f7f7f7";
	base08 = "db2d20"; base09 = "e8bbd0"; base0A = "fded02"; base0B = "01a252";
	base0C = "b5e4f4"; base0D = "01a0e4"; base0E = "a16a94"; base0F = "cdab53";
}
themes["apathy"] = {
	base00 = "031A16"; base01 = "0B342D"; base02 = "184E45"; base03 = "2B685E";
	base04 = "5F9C92"; base05 = "81B5AC"; base06 = "A7CEC8"; base07 = "D2E7E4";
	base08 = "3E9688"; base09 = "3E7996"; base0A = "3E4C96"; base0B = "883E96";
	base0C = "963E4C"; base0D = "96883E"; base0E = "4C963E"; base0F = "3E965B";
}
themes["ashes"] = {
	base00 = "1C2023"; base01 = "393F45"; base02 = "565E65"; base03 = "747C84";
	base04 = "ADB3BA"; base05 = "C7CCD1"; base06 = "DFE2E5"; base07 = "F3F4F5";
	base08 = "C7AE95"; base09 = "C7C795"; base0A = "AEC795"; base0B = "95C7AE";
	base0C = "95AEC7"; base0D = "AE95C7"; base0E = "C795AE"; base0F = "C79595";
}
themes["atelier-cave-light"] = {
	base00 = "efecf4"; base01 = "e2dfe7"; base02 = "8b8792"; base03 = "7e7887";
	base04 = "655f6d"; base05 = "585260"; base06 = "26232a"; base07 = "19171c";
	base08 = "be4678"; base09 = "aa573c"; base0A = "a06e3b"; base0B = "2a9292";
	base0C = "398bc6"; base0D = "576ddb"; base0E = "955ae7"; base0F = "bf40bf";
}
themes["atelier-cave"] = {
	base00 = "19171c"; base01 = "26232a"; base02 = "585260"; base03 = "655f6d";
	base04 = "7e7887"; base05 = "8b8792"; base06 = "e2dfe7"; base07 = "efecf4";
	base08 = "be4678"; base09 = "aa573c"; base0A = "a06e3b"; base0B = "2a9292";
	base0C = "398bc6"; base0D = "576ddb"; base0E = "955ae7"; base0F = "bf40bf";
}
themes["atelier-dune-light"] = {
	base00 = "fefbec"; base01 = "e8e4cf"; base02 = "a6a28c"; base03 = "999580";
	base04 = "7d7a68"; base05 = "6e6b5e"; base06 = "292824"; base07 = "20201d";
	base08 = "d73737"; base09 = "b65611"; base0A = "ae9513"; base0B = "60ac39";
	base0C = "1fad83"; base0D = "6684e1"; base0E = "b854d4"; base0F = "d43552";
}
themes["atelier-dune"] = {
	base00 = "20201d"; base01 = "292824"; base02 = "6e6b5e"; base03 = "7d7a68";
	base04 = "999580"; base05 = "a6a28c"; base06 = "e8e4cf"; base07 = "fefbec";
	base08 = "d73737"; base09 = "b65611"; base0A = "ae9513"; base0B = "60ac39";
	base0C = "1fad83"; base0D = "6684e1"; base0E = "b854d4"; base0F = "d43552";
}
themes["atelier-estuary-light"] = {
	base00 = "f4f3ec"; base01 = "e7e6df"; base02 = "929181"; base03 = "878573";
	base04 = "6c6b5a"; base05 = "5f5e4e"; base06 = "302f27"; base07 = "22221b";
	base08 = "ba6236"; base09 = "ae7313"; base0A = "a5980d"; base0B = "7d9726";
	base0C = "5b9d48"; base0D = "36a166"; base0E = "5f9182"; base0F = "9d6c7c";
}
themes["atelier-estuary"] = {
	base00 = "22221b"; base01 = "302f27"; base02 = "5f5e4e"; base03 = "6c6b5a";
	base04 = "878573"; base05 = "929181"; base06 = "e7e6df"; base07 = "f4f3ec";
	base08 = "ba6236"; base09 = "ae7313"; base0A = "a5980d"; base0B = "7d9726";
	base0C = "5b9d48"; base0D = "36a166"; base0E = "5f9182"; base0F = "9d6c7c";
}
themes["atelier-forest-light"] = {
	base00 = "f1efee"; base01 = "e6e2e0"; base02 = "a8a19f"; base03 = "9c9491";
	base04 = "766e6b"; base05 = "68615e"; base06 = "2c2421"; base07 = "1b1918";
	base08 = "f22c40"; base09 = "df5320"; base0A = "c38418"; base0B = "7b9726";
	base0C = "3d97b8"; base0D = "407ee7"; base0E = "6666ea"; base0F = "c33ff3";
}
themes["atelier-forest"] = {
	base00 = "1b1918"; base01 = "2c2421"; base02 = "68615e"; base03 = "766e6b";
	base04 = "9c9491"; base05 = "a8a19f"; base06 = "e6e2e0"; base07 = "f1efee";
	base08 = "f22c40"; base09 = "df5320"; base0A = "c38418"; base0B = "7b9726";
	base0C = "3d97b8"; base0D = "407ee7"; base0E = "6666ea"; base0F = "c33ff3";
}
themes["atelier-heath-light"] = {
	base00 = "f7f3f7"; base01 = "d8cad8"; base02 = "ab9bab"; base03 = "9e8f9e";
	base04 = "776977"; base05 = "695d69"; base06 = "292329"; base07 = "1b181b";
	base08 = "ca402b"; base09 = "a65926"; base0A = "bb8a35"; base0B = "918b3b";
	base0C = "159393"; base0D = "516aec"; base0E = "7b59c0"; base0F = "cc33cc";
}
themes["atelier-heath"] = {
	base00 = "1b181b"; base01 = "292329"; base02 = "695d69"; base03 = "776977";
	base04 = "9e8f9e"; base05 = "ab9bab"; base06 = "d8cad8"; base07 = "f7f3f7";
	base08 = "ca402b"; base09 = "a65926"; base0A = "bb8a35"; base0B = "918b3b";
	base0C = "159393"; base0D = "516aec"; base0E = "7b59c0"; base0F = "cc33cc";
}
themes["atelier-lakeside-light"] = {
	base00 = "ebf8ff"; base01 = "c1e4f6"; base02 = "7ea2b4"; base03 = "7195a8";
	base04 = "5a7b8c"; base05 = "516d7b"; base06 = "1f292e"; base07 = "161b1d";
	base08 = "d22d72"; base09 = "935c25"; base0A = "8a8a0f"; base0B = "568c3b";
	base0C = "2d8f6f"; base0D = "257fad"; base0E = "6b6bb8"; base0F = "b72dd2";
}
themes["atelier-lakeside"] = {
	base00 = "161b1d"; base01 = "1f292e"; base02 = "516d7b"; base03 = "5a7b8c";
	base04 = "7195a8"; base05 = "7ea2b4"; base06 = "c1e4f6"; base07 = "ebf8ff";
	base08 = "d22d72"; base09 = "935c25"; base0A = "8a8a0f"; base0B = "568c3b";
	base0C = "2d8f6f"; base0D = "257fad"; base0E = "6b6bb8"; base0F = "b72dd2";
}
themes["atelier-plateau-light"] = {
	base00 = "f4ecec"; base01 = "e7dfdf"; base02 = "8a8585"; base03 = "7e7777";
	base04 = "655d5d"; base05 = "585050"; base06 = "292424"; base07 = "1b1818";
	base08 = "ca4949"; base09 = "b45a3c"; base0A = "a06e3b"; base0B = "4b8b8b";
	base0C = "5485b6"; base0D = "7272ca"; base0E = "8464c4"; base0F = "bd5187";
}
themes["atelier-plateau"] = {
	base00 = "1b1818"; base01 = "292424"; base02 = "585050"; base03 = "655d5d";
	base04 = "7e7777"; base05 = "8a8585"; base06 = "e7dfdf"; base07 = "f4ecec";
	base08 = "ca4949"; base09 = "b45a3c"; base0A = "a06e3b"; base0B = "4b8b8b";
	base0C = "5485b6"; base0D = "7272ca"; base0E = "8464c4"; base0F = "bd5187";
}
themes["atelier-savanna-light"] = {
	base00 = "ecf4ee"; base01 = "dfe7e2"; base02 = "87928a"; base03 = "78877d";
	base04 = "5f6d64"; base05 = "526057"; base06 = "232a25"; base07 = "171c19";
	base08 = "b16139"; base09 = "9f713c"; base0A = "a07e3b"; base0B = "489963";
	base0C = "1c9aa0"; base0D = "478c90"; base0E = "55859b"; base0F = "867469";
}
themes["atelier-savanna"] = {
	base00 = "171c19"; base01 = "232a25"; base02 = "526057"; base03 = "5f6d64";
	base04 = "78877d"; base05 = "87928a"; base06 = "dfe7e2"; base07 = "ecf4ee";
	base08 = "b16139"; base09 = "9f713c"; base0A = "a07e3b"; base0B = "489963";
	base0C = "1c9aa0"; base0D = "478c90"; base0E = "55859b"; base0F = "867469";
}
themes["atelier-seaside-light"] = {
	base00 = "f4fbf4"; base01 = "cfe8cf"; base02 = "8ca68c"; base03 = "809980";
	base04 = "687d68"; base05 = "5e6e5e"; base06 = "242924"; base07 = "131513";
	base08 = "e6193c"; base09 = "87711d"; base0A = "98981b"; base0B = "29a329";
	base0C = "1999b3"; base0D = "3d62f5"; base0E = "ad2bee"; base0F = "e619c3";
}
themes["atelier-seaside"] = {
	base00 = "131513"; base01 = "242924"; base02 = "5e6e5e"; base03 = "687d68";
	base04 = "809980"; base05 = "8ca68c"; base06 = "cfe8cf"; base07 = "f4fbf4";
	base08 = "e6193c"; base09 = "87711d"; base0A = "98981b"; base0B = "29a329";
	base0C = "1999b3"; base0D = "3d62f5"; base0E = "ad2bee"; base0F = "e619c3";
}
themes["atelier-sulphurpool-light"] = {
	base00 = "f5f7ff"; base01 = "dfe2f1"; base02 = "979db4"; base03 = "898ea4";
	base04 = "6b7394"; base05 = "5e6687"; base06 = "293256"; base07 = "202746";
	base08 = "c94922"; base09 = "c76b29"; base0A = "c08b30"; base0B = "ac9739";
	base0C = "22a2c9"; base0D = "3d8fd1"; base0E = "6679cc"; base0F = "9c637a";
}
themes["atelier-sulphurpool"] = {
	base00 = "202746"; base01 = "293256"; base02 = "5e6687"; base03 = "6b7394";
	base04 = "898ea4"; base05 = "979db4"; base06 = "dfe2f1"; base07 = "f5f7ff";
	base08 = "c94922"; base09 = "c76b29"; base0A = "c08b30"; base0B = "ac9739";
	base0C = "22a2c9"; base0D = "3d8fd1"; base0E = "6679cc"; base0F = "9c637a";
}
themes["atlas"] = {
	base00 = "002635"; base01 = "00384d"; base02 = "517F8D"; base03 = "6C8B91";
	base04 = "869696"; base05 = "a1a19a"; base06 = "e6e6dc"; base07 = "fafaf8";
	base08 = "ff5a67"; base09 = "f08e48"; base0A = "ffcc1b"; base0B = "7fc06e";
	base0C = "14747e"; base0D = "5dd7b9"; base0E = "9a70a4"; base0F = "c43060";
}
themes["bespin"] = {
	base00 = "28211c"; base01 = "36312e"; base02 = "5e5d5c"; base03 = "666666";
	base04 = "797977"; base05 = "8a8986"; base06 = "9d9b97"; base07 = "baae9e";
	base08 = "cf6a4c"; base09 = "cf7d34"; base0A = "f9ee98"; base0B = "54be0d";
	base0C = "afc4db"; base0D = "5ea6ea"; base0E = "9b859d"; base0F = "937121";
}
themes["black-metal-bathory"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "e78a53"; base0B = "fbcb97";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-burzum"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "99bbaa"; base0B = "ddeecc";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-dark-funeral"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "5f81a5"; base0B = "d0dfee";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-gorgoroth"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "8c7f70"; base0B = "9b8d7f";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-immortal"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "556677"; base0B = "7799bb";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-khold"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "974b46"; base0B = "eceee3";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-marduk"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "626b67"; base0B = "a5aaa7";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-mayhem"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "eecc6c"; base0B = "f3ecd4";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-nile"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "777755"; base0B = "aa9988";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal-venom"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "79241f"; base0B = "f8f7f2";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["black-metal"] = {
	base00 = "000000"; base01 = "121212"; base02 = "222222"; base03 = "333333";
	base04 = "999999"; base05 = "c1c1c1"; base06 = "999999"; base07 = "c1c1c1";
	base08 = "5f8787"; base09 = "aaaaaa"; base0A = "a06666"; base0B = "dd9999";
	base0C = "aaaaaa"; base0D = "888888"; base0E = "999999"; base0F = "444444";
}
themes["brewer"] = {
	base00 = "0c0d0e"; base01 = "2e2f30"; base02 = "515253"; base03 = "737475";
	base04 = "959697"; base05 = "b7b8b9"; base06 = "dadbdc"; base07 = "fcfdfe";
	base08 = "e31a1c"; base09 = "e6550d"; base0A = "dca060"; base0B = "31a354";
	base0C = "80b1d3"; base0D = "3182bd"; base0E = "756bb1"; base0F = "b15928";
}
themes["bright"] = {
	base00 = "000000"; base01 = "303030"; base02 = "505050"; base03 = "b0b0b0";
	base04 = "d0d0d0"; base05 = "e0e0e0"; base06 = "f5f5f5"; base07 = "ffffff";
	base08 = "fb0120"; base09 = "fc6d24"; base0A = "fda331"; base0B = "a1c659";
	base0C = "76c7b7"; base0D = "6fb3d2"; base0E = "d381c3"; base0F = "be643c";
}
themes["brogrammer"] = {
	base00 = "1f1f1f"; base01 = "f81118"; base02 = "2dc55e"; base03 = "ecba0f";
	base04 = "2a84d2"; base05 = "4e5ab7"; base06 = "1081d6"; base07 = "d6dbe5";
	base08 = "d6dbe5"; base09 = "de352e"; base0A = "1dd361"; base0B = "f3bd09";
	base0C = "1081d6"; base0D = "5350b9"; base0E = "0f7ddb"; base0F = "ffffff";
}
themes["brushtrees-dark"] = {
	base00 = "485867"; base01 = "5A6D7A"; base02 = "6D828E"; base03 = "8299A1";
	base04 = "98AFB5"; base05 = "B0C5C8"; base06 = "C9DBDC"; base07 = "E3EFEF";
	base08 = "b38686"; base09 = "d8bba2"; base0A = "aab386"; base0B = "87b386";
	base0C = "86b3b3"; base0D = "868cb3"; base0E = "b386b2"; base0F = "b39f9f";
}
themes["brushtrees"] = {
	base00 = "E3EFEF"; base01 = "C9DBDC"; base02 = "B0C5C8"; base03 = "98AFB5";
	base04 = "8299A1"; base05 = "6D828E"; base06 = "5A6D7A"; base07 = "485867";
	base08 = "b38686"; base09 = "d8bba2"; base0A = "aab386"; base0B = "87b386";
	base0C = "86b3b3"; base0D = "868cb3"; base0E = "b386b2"; base0F = "b39f9f";
}
themes["chalk"] = {
	base00 = "151515"; base01 = "202020"; base02 = "303030"; base03 = "505050";
	base04 = "b0b0b0"; base05 = "d0d0d0"; base06 = "e0e0e0"; base07 = "f5f5f5";
	base08 = "fb9fb1"; base09 = "eda987"; base0A = "ddb26f"; base0B = "acc267";
	base0C = "12cfc0"; base0D = "6fc2ef"; base0E = "e1a3ee"; base0F = "deaf8f";
}
themes["circus"] = {
	base00 = "191919"; base01 = "202020"; base02 = "303030"; base03 = "5f5a60";
	base04 = "505050"; base05 = "a7a7a7"; base06 = "808080"; base07 = "ffffff";
	base08 = "dc657d"; base09 = "4bb1a7"; base0A = "c3ba63"; base0B = "84b97c";
	base0C = "4bb1a7"; base0D = "639ee4"; base0E = "b888e2"; base0F = "b888e2";
}
themes["classic-dark"] = {
	base00 = "151515"; base01 = "202020"; base02 = "303030"; base03 = "505050";
	base04 = "B0B0B0"; base05 = "D0D0D0"; base06 = "E0E0E0"; base07 = "F5F5F5";
	base08 = "AC4142"; base09 = "D28445"; base0A = "F4BF75"; base0B = "90A959";
	base0C = "75B5AA"; base0D = "6A9FB5"; base0E = "AA759F"; base0F = "8F5536";
}
themes["classic-light"] = {
	base00 = "F5F5F5"; base01 = "E0E0E0"; base02 = "D0D0D0"; base03 = "B0B0B0";
	base04 = "505050"; base05 = "303030"; base06 = "202020"; base07 = "151515";
	base08 = "AC4142"; base09 = "D28445"; base0A = "F4BF75"; base0B = "90A959";
	base0C = "75B5AA"; base0D = "6A9FB5"; base0E = "AA759F"; base0F = "8F5536";
}
themes["codeschool"] = {
	base00 = "232c31"; base01 = "1c3657"; base02 = "2a343a"; base03 = "3f4944";
	base04 = "84898c"; base05 = "9ea7a6"; base06 = "a7cfa3"; base07 = "b5d8f6";
	base08 = "2a5491"; base09 = "43820d"; base0A = "a03b1e"; base0B = "237986";
	base0C = "b02f30"; base0D = "484d79"; base0E = "c59820"; base0F = "c98344";
}
themes["cupcake"] = {
	base00 = "fbf1f2"; base01 = "f2f1f4"; base02 = "d8d5dd"; base03 = "bfb9c6";
	base04 = "a59daf"; base05 = "8b8198"; base06 = "72677E"; base07 = "585062";
	base08 = "D57E85"; base09 = "EBB790"; base0A = "DCB16C"; base0B = "A3B367";
	base0C = "69A9A7"; base0D = "7297B9"; base0E = "BB99B4"; base0F = "BAA58C";
}
themes["cupertino"] = {
	base00 = "ffffff"; base01 = "c0c0c0"; base02 = "c0c0c0"; base03 = "808080";
	base04 = "808080"; base05 = "404040"; base06 = "404040"; base07 = "5e5e5e";
	base08 = "c41a15"; base09 = "eb8500"; base0A = "826b28"; base0B = "007400";
	base0C = "318495"; base0D = "0000ff"; base0E = "a90d91"; base0F = "826b28";
}
themes["darktooth"] = {
	base00 = "1D2021"; base01 = "32302F"; base02 = "504945"; base03 = "665C54";
	base04 = "928374"; base05 = "A89984"; base06 = "D5C4A1"; base07 = "FDF4C1";
	base08 = "FB543F"; base09 = "FE8625"; base0A = "FAC03B"; base0B = "95C085";
	base0C = "8BA59B"; base0D = "0D6678"; base0E = "8F4673"; base0F = "A87322";
}
themes["default-dark"] = {
	base00 = "181818"; base01 = "282828"; base02 = "383838"; base03 = "585858";
	base04 = "b8b8b8"; base05 = "d8d8d8"; base06 = "e8e8e8"; base07 = "f8f8f8";
	base08 = "ab4642"; base09 = "dc9656"; base0A = "f7ca88"; base0B = "a1b56c";
	base0C = "86c1b9"; base0D = "7cafc2"; base0E = "ba8baf"; base0F = "a16946";
}
themes["default-light"] = {
	base00 = "f8f8f8"; base01 = "e8e8e8"; base02 = "d8d8d8"; base03 = "b8b8b8";
	base04 = "585858"; base05 = "383838"; base06 = "282828"; base07 = "181818";
	base08 = "ab4642"; base09 = "dc9656"; base0A = "f7ca88"; base0B = "a1b56c";
	base0C = "86c1b9"; base0D = "7cafc2"; base0E = "ba8baf"; base0F = "a16946";
}
themes["dracula"] = {
	base00 = "282936"; base01 = "3a3c4e"; base02 = "4d4f68"; base03 = "626483";
	base04 = "62d6e8"; base05 = "e9e9f4"; base06 = "f1f2f8"; base07 = "f7f7fb";
	base08 = "ea51b2"; base09 = "b45bcf"; base0A = "00f769"; base0B = "ebff87";
	base0C = "a1efe4"; base0D = "62d6e8"; base0E = "b45bcf"; base0F = "00f769";
}
themes["eighties"] = {
	base00 = "2d2d2d"; base01 = "393939"; base02 = "515151"; base03 = "747369";
	base04 = "a09f93"; base05 = "d3d0c8"; base06 = "e8e6df"; base07 = "f2f0ec";
	base08 = "f2777a"; base09 = "f99157"; base0A = "ffcc66"; base0B = "99cc99";
	base0C = "66cccc"; base0D = "6699cc"; base0E = "cc99cc"; base0F = "d27b53";
}
themes["embers"] = {
	base00 = "16130F"; base01 = "2C2620"; base02 = "433B32"; base03 = "5A5047";
	base04 = "8A8075"; base05 = "A39A90"; base06 = "BEB6AE"; base07 = "DBD6D1";
	base08 = "826D57"; base09 = "828257"; base0A = "6D8257"; base0B = "57826D";
	base0C = "576D82"; base0D = "6D5782"; base0E = "82576D"; base0F = "825757";
}
themes["flat"] = {
	base00 = "2C3E50"; base01 = "34495E"; base02 = "7F8C8D"; base03 = "95A5A6";
	base04 = "BDC3C7"; base05 = "e0e0e0"; base06 = "f5f5f5"; base07 = "ECF0F1";
	base08 = "E74C3C"; base09 = "E67E22"; base0A = "F1C40F"; base0B = "2ECC71";
	base0C = "1ABC9C"; base0D = "3498DB"; base0E = "9B59B6"; base0F = "be643c";
}
themes["fruit-soda"] = {
	base00 = "f1ecf1"; base01 = "e0dee0"; base02 = "d8d5d5"; base03 = "b5b4b6";
	base04 = "979598"; base05 = "515151"; base06 = "474545"; base07 = "2d2c2c";
	base08 = "fe3e31"; base09 = "fe6d08"; base0A = "f7e203"; base0B = "47f74c";
	base0C = "0f9cfd"; base0D = "2931df"; base0E = "611fce"; base0F = "b16f40";
}
themes["github"] = {
	base00 = "ffffff"; base01 = "f5f5f5"; base02 = "c8c8fa"; base03 = "969896";
	base04 = "e8e8e8"; base05 = "333333"; base06 = "ffffff"; base07 = "ffffff";
	base08 = "ed6a43"; base09 = "0086b3"; base0A = "795da3"; base0B = "183691";
	base0C = "183691"; base0D = "795da3"; base0E = "a71d5d"; base0F = "333333";
}
themes["google-dark"] = {
	base00 = "1d1f21"; base01 = "282a2e"; base02 = "373b41"; base03 = "969896";
	base04 = "b4b7b4"; base05 = "c5c8c6"; base06 = "e0e0e0"; base07 = "ffffff";
	base08 = "CC342B"; base09 = "F96A38"; base0A = "FBA922"; base0B = "198844";
	base0C = "3971ED"; base0D = "3971ED"; base0E = "A36AC7"; base0F = "3971ED";
}
themes["google-light"] = {
	base00 = "ffffff"; base01 = "e0e0e0"; base02 = "c5c8c6"; base03 = "b4b7b4";
	base04 = "969896"; base05 = "373b41"; base06 = "282a2e"; base07 = "1d1f21";
	base08 = "CC342B"; base09 = "F96A38"; base0A = "FBA922"; base0B = "198844";
	base0C = "3971ED"; base0D = "3971ED"; base0E = "A36AC7"; base0F = "3971ED";
}
themes["grayscale-dark"] = {
	base00 = "101010"; base01 = "252525"; base02 = "464646"; base03 = "525252";
	base04 = "ababab"; base05 = "b9b9b9"; base06 = "e3e3e3"; base07 = "f7f7f7";
	base08 = "7c7c7c"; base09 = "999999"; base0A = "a0a0a0"; base0B = "8e8e8e";
	base0C = "868686"; base0D = "686868"; base0E = "747474"; base0F = "5e5e5e";
}
themes["grayscale-light"] = {
	base00 = "f7f7f7"; base01 = "e3e3e3"; base02 = "b9b9b9"; base03 = "ababab";
	base04 = "525252"; base05 = "464646"; base06 = "252525"; base07 = "101010";
	base08 = "7c7c7c"; base09 = "999999"; base0A = "a0a0a0"; base0B = "8e8e8e";
	base0C = "868686"; base0D = "686868"; base0E = "747474"; base0F = "5e5e5e";
}
themes["greenscreen"] = {
	base00 = "001100"; base01 = "003300"; base02 = "005500"; base03 = "007700";
	base04 = "009900"; base05 = "00bb00"; base06 = "00dd00"; base07 = "00ff00";
	base08 = "007700"; base09 = "009900"; base0A = "007700"; base0B = "00bb00";
	base0C = "005500"; base0D = "009900"; base0E = "00bb00"; base0F = "005500";
}
themes["gruvbox-dark-hard"] = {
	base00 = "1d2021"; base01 = "3c3836"; base02 = "504945"; base03 = "665c54";
	base04 = "bdae93"; base05 = "d5c4a1"; base06 = "ebdbb2"; base07 = "fbf1c7";
	base08 = "fb4934"; base09 = "fe8019"; base0A = "fabd2f"; base0B = "b8bb26";
	base0C = "8ec07c"; base0D = "83a598"; base0E = "d3869b"; base0F = "d65d0e";
}
themes["gruvbox-dark-medium"] = {
	base00 = "282828"; base01 = "3c3836"; base02 = "504945"; base03 = "665c54";
	base04 = "bdae93"; base05 = "d5c4a1"; base06 = "ebdbb2"; base07 = "fbf1c7";
	base08 = "fb4934"; base09 = "fe8019"; base0A = "fabd2f"; base0B = "b8bb26";
	base0C = "8ec07c"; base0D = "83a598"; base0E = "d3869b"; base0F = "d65d0e";
}
themes["gruvbox-dark-pale"] = {
	base00 = "262626"; base01 = "3a3a3a"; base02 = "4e4e4e"; base03 = "8a8a8a";
	base04 = "949494"; base05 = "dab997"; base06 = "d5c4a1"; base07 = "ebdbb2";
	base08 = "d75f5f"; base09 = "ff8700"; base0A = "ffaf00"; base0B = "afaf00";
	base0C = "85ad85"; base0D = "83adad"; base0E = "d485ad"; base0F = "d65d0e";
}
themes["gruvbox-dark-soft"] = {
	base00 = "32302f"; base01 = "3c3836"; base02 = "504945"; base03 = "665c54";
	base04 = "bdae93"; base05 = "d5c4a1"; base06 = "ebdbb2"; base07 = "fbf1c7";
	base08 = "fb4934"; base09 = "fe8019"; base0A = "fabd2f"; base0B = "b8bb26";
	base0C = "8ec07c"; base0D = "83a598"; base0E = "d3869b"; base0F = "d65d0e";
}
themes["gruvbox-light-hard"] = {
	base00 = "f9f5d7"; base01 = "ebdbb2"; base02 = "d5c4a1"; base03 = "bdae93";
	base04 = "665c54"; base05 = "504945"; base06 = "3c3836"; base07 = "282828";
	base08 = "9d0006"; base09 = "af3a03"; base0A = "b57614"; base0B = "79740e";
	base0C = "427b58"; base0D = "076678"; base0E = "8f3f71"; base0F = "d65d0e";
}
themes["gruvbox-light-medium"] = {
	base00 = "fbf1c7"; base01 = "ebdbb2"; base02 = "d5c4a1"; base03 = "bdae93";
	base04 = "665c54"; base05 = "504945"; base06 = "3c3836"; base07 = "282828";
	base08 = "9d0006"; base09 = "af3a03"; base0A = "b57614"; base0B = "79740e";
	base0C = "427b58"; base0D = "076678"; base0E = "8f3f71"; base0F = "d65d0e";
}
themes["gruvbox-light-soft"] = {
	base00 = "f2e5bc"; base01 = "ebdbb2"; base02 = "d5c4a1"; base03 = "bdae93";
	base04 = "665c54"; base05 = "504945"; base06 = "3c3836"; base07 = "282828";
	base08 = "9d0006"; base09 = "af3a03"; base0A = "b57614"; base0B = "79740e";
	base0C = "427b58"; base0D = "076678"; base0E = "8f3f71"; base0F = "d65d0e";
}
themes["harmonic-dark"] = {
	base00 = "0b1c2c"; base01 = "223b54"; base02 = "405c79"; base03 = "627e99";
	base04 = "aabcce"; base05 = "cbd6e2"; base06 = "e5ebf1"; base07 = "f7f9fb";
	base08 = "bf8b56"; base09 = "bfbf56"; base0A = "8bbf56"; base0B = "56bf8b";
	base0C = "568bbf"; base0D = "8b56bf"; base0E = "bf568b"; base0F = "bf5656";
}
themes["harmonic-light"] = {
	base00 = "f7f9fb"; base01 = "e5ebf1"; base02 = "cbd6e2"; base03 = "aabcce";
	base04 = "627e99"; base05 = "405c79"; base06 = "223b54"; base07 = "0b1c2c";
	base08 = "bf8b56"; base09 = "bfbf56"; base0A = "8bbf56"; base0B = "56bf8b";
	base0C = "568bbf"; base0D = "8b56bf"; base0E = "bf568b"; base0F = "bf5656";
}
themes["heetch-light"] = {
	base00 = "feffff"; base01 = "392551"; base02 = "7b6d8b"; base03 = "9c92a8";
	base04 = "ddd6e5"; base05 = "5a496e"; base06 = "470546"; base07 = "190134";
	base08 = "27d9d5"; base09 = "bdb6c5"; base0A = "5ba2b6"; base0B = "f80059";
	base0C = "c33678"; base0D = "47f9f5"; base0E = "bd0152"; base0F = "dedae2";
}
themes["heetch"] = {
	base00 = "190134"; base01 = "392551"; base02 = "5A496E"; base03 = "7B6D8B";
	base04 = "9C92A8"; base05 = "BDB6C5"; base06 = "DEDAE2"; base07 = "FEFFFF";
	base08 = "27D9D5"; base09 = "5BA2B6"; base0A = "8F6C97"; base0B = "C33678";
	base0C = "F80059"; base0D = "BD0152"; base0E = "82034C"; base0F = "470546";
}
themes["helios"] = {
	base00 = "1d2021"; base01 = "383c3e"; base02 = "53585b"; base03 = "6f7579";
	base04 = "cdcdcd"; base05 = "d5d5d5"; base06 = "dddddd"; base07 = "e5e5e5";
	base08 = "d72638"; base09 = "eb8413"; base0A = "f19d1a"; base0B = "88b92d";
	base0C = "1ba595"; base0D = "1e8bac"; base0E = "be4264"; base0F = "c85e0d";
}
themes["hopscotch"] = {
	base00 = "322931"; base01 = "433b42"; base02 = "5c545b"; base03 = "797379";
	base04 = "989498"; base05 = "b9b5b8"; base06 = "d5d3d5"; base07 = "ffffff";
	base08 = "dd464c"; base09 = "fd8b19"; base0A = "fdcc59"; base0B = "8fc13e";
	base0C = "149b93"; base0D = "1290bf"; base0E = "c85e7c"; base0F = "b33508";
}
themes["horizon-dark"] = {
	base00 = "1C1E26"; base01 = "232530"; base02 = "2E303E"; base03 = "676A8D";
	base04 = "CED1D0"; base05 = "CBCED0"; base06 = "DCDFE4"; base07 = "E3E6EE";
	base08 = "E93C58"; base09 = "E58D7D"; base0A = "EFB993"; base0B = "EFAF8E";
	base0C = "24A8B4"; base0D = "DF5273"; base0E = "B072D1"; base0F = "E4A382";
}
themes["ia-dark"] = {
	base00 = "1a1a1a"; base01 = "222222"; base02 = "1d414d"; base03 = "767676";
	base04 = "b8b8b8"; base05 = "cccccc"; base06 = "e8e8e8"; base07 = "f8f8f8";
	base08 = "d88568"; base09 = "d86868"; base0A = "b99353"; base0B = "83a471";
	base0C = "7c9cae"; base0D = "8eccdd"; base0E = "b98eb2"; base0F = "8b6c37";
}
themes["ia-light"] = {
	base00 = "f6f6f6"; base01 = "dedede"; base02 = "bde5f2"; base03 = "898989";
	base04 = "767676"; base05 = "181818"; base06 = "e8e8e8"; base07 = "f8f8f8";
	base08 = "9c5a02"; base09 = "c43e18"; base0A = "c48218"; base0B = "38781c";
	base0C = "2d6bb1"; base0D = "48bac2"; base0E = "a94598"; base0F = "8b6c37";
}
themes["icy"] = {
	base00 = "021012"; base01 = "031619"; base02 = "041f23"; base03 = "052e34";
	base04 = "064048"; base05 = "095b67"; base06 = "0c7c8c"; base07 = "109cb0";
	base08 = "16c1d9"; base09 = "b3ebf2"; base0A = "80deea"; base0B = "4dd0e1";
	base0C = "26c6da"; base0D = "00bcd4"; base0E = "00acc1"; base0F = "0097a7";
}
themes["irblack"] = {
	base00 = "000000"; base01 = "242422"; base02 = "484844"; base03 = "6c6c66";
	base04 = "918f88"; base05 = "b5b3aa"; base06 = "d9d7cc"; base07 = "fdfbee";
	base08 = "ff6c60"; base09 = "e9c062"; base0A = "ffffb6"; base0B = "a8ff60";
	base0C = "c6c5fe"; base0D = "96cbfe"; base0E = "ff73fd"; base0F = "b18a3d";
}
themes["isotope"] = {
	base00 = "000000"; base01 = "404040"; base02 = "606060"; base03 = "808080";
	base04 = "c0c0c0"; base05 = "d0d0d0"; base06 = "e0e0e0"; base07 = "ffffff";
	base08 = "ff0000"; base09 = "ff9900"; base0A = "ff0099"; base0B = "33ff00";
	base0C = "00ffff"; base0D = "0066ff"; base0E = "cc00ff"; base0F = "3300ff";
}
themes["macintosh"] = {
	base00 = "000000"; base01 = "404040"; base02 = "404040"; base03 = "808080";
	base04 = "808080"; base05 = "c0c0c0"; base06 = "c0c0c0"; base07 = "ffffff";
	base08 = "dd0907"; base09 = "ff6403"; base0A = "fbf305"; base0B = "1fb714";
	base0C = "02abea"; base0D = "0000d3"; base0E = "4700a5"; base0F = "90713a";
}
themes["marrakesh"] = {
	base00 = "201602"; base01 = "302e00"; base02 = "5f5b17"; base03 = "6c6823";
	base04 = "86813b"; base05 = "948e48"; base06 = "ccc37a"; base07 = "faf0a5";
	base08 = "c35359"; base09 = "b36144"; base0A = "a88339"; base0B = "18974e";
	base0C = "75a738"; base0D = "477ca1"; base0E = "8868b3"; base0F = "b3588e";
}
themes["materia"] = {
	base00 = "263238"; base01 = "2C393F"; base02 = "37474F"; base03 = "707880";
	base04 = "C9CCD3"; base05 = "CDD3DE"; base06 = "D5DBE5"; base07 = "FFFFFF";
	base08 = "EC5F67"; base09 = "EA9560"; base0A = "FFCC00"; base0B = "8BD649";
	base0C = "80CBC4"; base0D = "89DDFF"; base0E = "82AAFF"; base0F = "EC5F67";
}
themes["material-darker"] = {
	base00 = "212121"; base01 = "303030"; base02 = "353535"; base03 = "4A4A4A";
	base04 = "B2CCD6"; base05 = "EEFFFF"; base06 = "EEFFFF"; base07 = "FFFFFF";
	base08 = "F07178"; base09 = "F78C6C"; base0A = "FFCB6B"; base0B = "C3E88D";
	base0C = "89DDFF"; base0D = "82AAFF"; base0E = "C792EA"; base0F = "FF5370";
}
themes["material-lighter"] = {
	base00 = "FAFAFA"; base01 = "E7EAEC"; base02 = "CCEAE7"; base03 = "CCD7DA";
	base04 = "8796B0"; base05 = "80CBC4"; base06 = "80CBC4"; base07 = "FFFFFF";
	base08 = "FF5370"; base09 = "F76D47"; base0A = "FFB62C"; base0B = "91B859";
	base0C = "39ADB5"; base0D = "6182B8"; base0E = "7C4DFF"; base0F = "E53935";
}
themes["material-palenight"] = {
	base00 = "292D3E"; base01 = "444267"; base02 = "32374D"; base03 = "676E95";
	base04 = "8796B0"; base05 = "959DCB"; base06 = "959DCB"; base07 = "FFFFFF";
	base08 = "F07178"; base09 = "F78C6C"; base0A = "FFCB6B"; base0B = "C3E88D";
	base0C = "89DDFF"; base0D = "82AAFF"; base0E = "C792EA"; base0F = "FF5370";
}
themes["material-vivid"] = {
	base00 = "202124"; base01 = "27292c"; base02 = "323639"; base03 = "44464d";
	base04 = "676c71"; base05 = "80868b"; base06 = "9e9e9e"; base07 = "ffffff";
	base08 = "f44336"; base09 = "ff9800"; base0A = "ffeb3b"; base0B = "00e676";
	base0C = "00bcd4"; base0D = "2196f3"; base0E = "673ab7"; base0F = "8d6e63";
}
themes["material"] = {
	base00 = "263238"; base01 = "2E3C43"; base02 = "314549"; base03 = "546E7A";
	base04 = "B2CCD6"; base05 = "EEFFFF"; base06 = "EEFFFF"; base07 = "FFFFFF";
	base08 = "F07178"; base09 = "F78C6C"; base0A = "FFCB6B"; base0B = "C3E88D";
	base0C = "89DDFF"; base0D = "82AAFF"; base0E = "C792EA"; base0F = "FF5370";
}
themes["mellow-purple"] = {
	base00 = "1e0528"; base01 = "1A092D"; base02 = "331354"; base03 = "320f55";
	base04 = "873582"; base05 = "ffeeff"; base06 = "ffeeff"; base07 = "f8c0ff";
	base08 = "00d9e9"; base09 = "aa00a3"; base0A = "955ae7"; base0B = "05cb0d";
	base0C = "b900b1"; base0D = "550068"; base0E = "8991bb"; base0F = "4d6fff";
}
themes["mexico-light"] = {
	base00 = "f8f8f8"; base01 = "e8e8e8"; base02 = "d8d8d8"; base03 = "b8b8b8";
	base04 = "585858"; base05 = "383838"; base06 = "282828"; base07 = "181818";
	base08 = "ab4642"; base09 = "dc9656"; base0A = "f79a0e"; base0B = "538947";
	base0C = "4b8093"; base0D = "7cafc2"; base0E = "96609e"; base0F = "a16946";
}
themes["mocha"] = {
	base00 = "3B3228"; base01 = "534636"; base02 = "645240"; base03 = "7e705a";
	base04 = "b8afad"; base05 = "d0c8c6"; base06 = "e9e1dd"; base07 = "f5eeeb";
	base08 = "cb6077"; base09 = "d28b71"; base0A = "f4bc87"; base0B = "beb55b";
	base0C = "7bbda4"; base0D = "8ab3b5"; base0E = "a89bb9"; base0F = "bb9584";
}
themes["monokai"] = {
	base00 = "272822"; base01 = "383830"; base02 = "49483e"; base03 = "75715e";
	base04 = "a59f85"; base05 = "f8f8f2"; base06 = "f5f4f1"; base07 = "f9f8f5";
	base08 = "f92672"; base09 = "fd971f"; base0A = "f4bf75"; base0B = "a6e22e";
	base0C = "a1efe4"; base0D = "66d9ef"; base0E = "ae81ff"; base0F = "cc6633";
}
themes["nord"] = {
	base00 = "2E3440"; base01 = "3B4252"; base02 = "434C5E"; base03 = "4C566A";
	base04 = "D8DEE9"; base05 = "E5E9F0"; base06 = "ECEFF4"; base07 = "8FBCBB";
	base08 = "88C0D0"; base09 = "81A1C1"; base0A = "5E81AC"; base0B = "BF616A";
	base0C = "D08770"; base0D = "EBCB8B"; base0E = "A3BE8C"; base0F = "B48EAD";
}
themes["ocean"] = {
	base00 = "2b303b"; base01 = "343d46"; base02 = "4f5b66"; base03 = "65737e";
	base04 = "a7adba"; base05 = "c0c5ce"; base06 = "dfe1e8"; base07 = "eff1f5";
	base08 = "bf616a"; base09 = "d08770"; base0A = "ebcb8b"; base0B = "a3be8c";
	base0C = "96b5b4"; base0D = "8fa1b3"; base0E = "b48ead"; base0F = "ab7967";
}
themes["oceanicnext"] = {
	base00 = "1B2B34"; base01 = "343D46"; base02 = "4F5B66"; base03 = "65737E";
	base04 = "A7ADBA"; base05 = "C0C5CE"; base06 = "CDD3DE"; base07 = "D8DEE9";
	base08 = "EC5f67"; base09 = "F99157"; base0A = "FAC863"; base0B = "99C794";
	base0C = "5FB3B3"; base0D = "6699CC"; base0E = "C594C5"; base0F = "AB7967";
}
themes["one-light"] = {
	base00 = "fafafa"; base01 = "f0f0f1"; base02 = "e5e5e6"; base03 = "a0a1a7";
	base04 = "696c77"; base05 = "383a42"; base06 = "202227"; base07 = "090a0b";
	base08 = "ca1243"; base09 = "d75f00"; base0A = "c18401"; base0B = "50a14f";
	base0C = "0184bc"; base0D = "4078f2"; base0E = "a626a4"; base0F = "986801";
}
themes["onedark"] = {
	base00 = "282c34"; base01 = "353b45"; base02 = "3e4451"; base03 = "545862";
	base04 = "565c64"; base05 = "abb2bf"; base06 = "b6bdca"; base07 = "c8ccd4";
	base08 = "e06c75"; base09 = "d19a66"; base0A = "e5c07b"; base0B = "98c379";
	base0C = "56b6c2"; base0D = "61afef"; base0E = "c678dd"; base0F = "be5046";
}
themes["outrun-dark"] = {
	base00 = "00002A"; base01 = "20204A"; base02 = "30305A"; base03 = "50507A";
	base04 = "B0B0DA"; base05 = "D0D0FA"; base06 = "E0E0FF"; base07 = "F5F5FF";
	base08 = "FF4242"; base09 = "FC8D28"; base0A = "F3E877"; base0B = "59F176";
	base0C = "0EF0F0"; base0D = "66B0FF"; base0E = "F10596"; base0F = "F003EF";
}
themes["papercolor-dark"] = {
	base00 = "1c1c1c"; base01 = "af005f"; base02 = "5faf00"; base03 = "d7af5f";
	base04 = "5fafd7"; base05 = "808080"; base06 = "d7875f"; base07 = "d0d0d0";
	base08 = "585858"; base09 = "5faf5f"; base0A = "afd700"; base0B = "af87d7";
	base0C = "ffaf00"; base0D = "ff5faf"; base0E = "00afaf"; base0F = "5f8787";
}
themes["papercolor-light"] = {
	base00 = "eeeeee"; base01 = "af0000"; base02 = "008700"; base03 = "5f8700";
	base04 = "0087af"; base05 = "878787"; base06 = "005f87"; base07 = "444444";
	base08 = "bcbcbc"; base09 = "d70000"; base0A = "d70087"; base0B = "8700af";
	base0C = "d75f00"; base0D = "d75f00"; base0E = "005faf"; base0F = "005f87";
}
themes["paraiso"] = {
	base00 = "2f1e2e"; base01 = "41323f"; base02 = "4f424c"; base03 = "776e71";
	base04 = "8d8687"; base05 = "a39e9b"; base06 = "b9b6b0"; base07 = "e7e9db";
	base08 = "ef6155"; base09 = "f99b15"; base0A = "fec418"; base0B = "48b685";
	base0C = "5bc4bf"; base0D = "06b6ef"; base0E = "815ba4"; base0F = "e96ba8";
}
themes["phd"] = {
	base00 = "061229"; base01 = "2a3448"; base02 = "4d5666"; base03 = "717885";
	base04 = "9a99a3"; base05 = "b8bbc2"; base06 = "dbdde0"; base07 = "ffffff";
	base08 = "d07346"; base09 = "f0a000"; base0A = "fbd461"; base0B = "99bf52";
	base0C = "72b9bf"; base0D = "5299bf"; base0E = "9989cc"; base0F = "b08060";
}
themes["pico"] = {
	base00 = "000000"; base01 = "1d2b53"; base02 = "7e2553"; base03 = "008751";
	base04 = "ab5236"; base05 = "5f574f"; base06 = "c2c3c7"; base07 = "fff1e8";
	base08 = "ff004d"; base09 = "ffa300"; base0A = "fff024"; base0B = "00e756";
	base0C = "29adff"; base0D = "83769c"; base0E = "ff77a8"; base0F = "ffccaa";
}
themes["pop"] = {
	base00 = "000000"; base01 = "202020"; base02 = "303030"; base03 = "505050";
	base04 = "b0b0b0"; base05 = "d0d0d0"; base06 = "e0e0e0"; base07 = "ffffff";
	base08 = "eb008a"; base09 = "f29333"; base0A = "f8ca12"; base0B = "37b349";
	base0C = "00aabb"; base0D = "0e5a94"; base0E = "b31e8d"; base0F = "7a2d00";
}
themes["porple"] = {
	base00 = "292c36"; base01 = "333344"; base02 = "474160"; base03 = "65568a";
	base04 = "b8b8b8"; base05 = "d8d8d8"; base06 = "e8e8e8"; base07 = "f8f8f8";
	base08 = "f84547"; base09 = "d28e5d"; base0A = "efa16b"; base0B = "95c76f";
	base0C = "64878f"; base0D = "8485ce"; base0E = "b74989"; base0F = "986841";
}
themes["railscasts"] = {
	base00 = "2b2b2b"; base01 = "272935"; base02 = "3a4055"; base03 = "5a647e";
	base04 = "d4cfc9"; base05 = "e6e1dc"; base06 = "f4f1ed"; base07 = "f9f7f3";
	base08 = "da4939"; base09 = "cc7833"; base0A = "ffc66d"; base0B = "a5c261";
	base0C = "519f50"; base0D = "6d9cbe"; base0E = "b6b3eb"; base0F = "bc9458";
}
themes["rebecca"] = {
	base00 = "292a44"; base01 = "663399"; base02 = "383a62"; base03 = "666699";
	base04 = "a0a0c5"; base05 = "f1eff8"; base06 = "ccccff"; base07 = "53495d";
	base08 = "a0a0c5"; base09 = "efe4a1"; base0A = "ae81ff"; base0B = "6dfedf";
	base0C = "8eaee0"; base0D = "2de0a7"; base0E = "7aa5ff"; base0F = "ff79c6";
}
themes["seti"] = {
	base00 = "151718"; base01 = "282a2b"; base02 = "3B758C"; base03 = "41535B";
	base04 = "43a5d5"; base05 = "d6d6d6"; base06 = "eeeeee"; base07 = "ffffff";
	base08 = "Cd3f45"; base09 = "db7b55"; base0A = "e6cd69"; base0B = "9fca56";
	base0C = "55dbbe"; base0D = "55b5db"; base0E = "a074c4"; base0F = "8a553f";
}
themes["shapeshifter"] = {
	base00 = "f9f9f9"; base01 = "e0e0e0"; base02 = "ababab"; base03 = "555555";
	base04 = "343434"; base05 = "102015"; base06 = "040404"; base07 = "000000";
	base08 = "e92f2f"; base09 = "e09448"; base0A = "dddd13"; base0B = "0ed839";
	base0C = "23edda"; base0D = "3b48e3"; base0E = "f996e2"; base0F = "69542d";
}
themes["snazzy"] = {
	base00 = "282a36"; base01 = "34353e"; base02 = "43454f"; base03 = "78787e";
	base04 = "a5a5a9"; base05 = "e2e4e5"; base06 = "eff0eb"; base07 = "f1f1f0";
	base08 = "ff5c57"; base09 = "ff9f43"; base0A = "f3f99d"; base0B = "5af78e";
	base0C = "9aedfe"; base0D = "57c7ff"; base0E = "ff6ac1"; base0F = "b2643c";
}
themes["solarflare"] = {
	base00 = "18262F"; base01 = "222E38"; base02 = "586875"; base03 = "667581";
	base04 = "85939E"; base05 = "A6AFB8"; base06 = "E8E9ED"; base07 = "F5F7FA";
	base08 = "EF5253"; base09 = "E66B2B"; base0A = "E4B51C"; base0B = "7CC844";
	base0C = "52CBB0"; base0D = "33B5E1"; base0E = "A363D5"; base0F = "D73C9A";
}
themes["solarized-dark"] = {
	base00 = "002b36"; base01 = "073642"; base02 = "586e75"; base03 = "657b83";
	base04 = "839496"; base05 = "93a1a1"; base06 = "eee8d5"; base07 = "fdf6e3";
	base08 = "dc322f"; base09 = "cb4b16"; base0A = "b58900"; base0B = "859900";
	base0C = "2aa198"; base0D = "268bd2"; base0E = "6c71c4"; base0F = "d33682";
}
themes["solarized-light"] = {
	base00 = "fdf6e3"; base01 = "eee8d5"; base02 = "93a1a1"; base03 = "839496";
	base04 = "657b83"; base05 = "586e75"; base06 = "073642"; base07 = "002b36";
	base08 = "dc322f"; base09 = "cb4b16"; base0A = "b58900"; base0B = "859900";
	base0C = "2aa198"; base0D = "268bd2"; base0E = "6c71c4"; base0F = "d33682";
}
themes["spacemacs"] = {
	base00 = "1f2022"; base01 = "282828"; base02 = "444155"; base03 = "585858";
	base04 = "b8b8b8"; base05 = "a3a3a3"; base06 = "e8e8e8"; base07 = "f8f8f8";
	base08 = "f2241f"; base09 = "ffa500"; base0A = "b1951d"; base0B = "67b11d";
	base0C = "2d9574"; base0D = "4f97d7"; base0E = "a31db1"; base0F = "b03060";
}
themes["summerfruit-dark"] = {
	base00 = "151515"; base01 = "202020"; base02 = "303030"; base03 = "505050";
	base04 = "B0B0B0"; base05 = "D0D0D0"; base06 = "E0E0E0"; base07 = "FFFFFF";
	base08 = "FF0086"; base09 = "FD8900"; base0A = "ABA800"; base0B = "00C918";
	base0C = "1FAAAA"; base0D = "3777E6"; base0E = "AD00A1"; base0F = "CC6633";
}
themes["summerfruit-light"] = {
	base00 = "FFFFFF"; base01 = "E0E0E0"; base02 = "D0D0D0"; base03 = "B0B0B0";
	base04 = "000000"; base05 = "101010"; base06 = "151515"; base07 = "202020";
	base08 = "FF0086"; base09 = "FD8900"; base0A = "ABA800"; base0B = "00C918";
	base0C = "1FAAAA"; base0D = "3777E6"; base0E = "AD00A1"; base0F = "CC6633";
}
themes["synth-midnight-dark"] = {
	base00 = "040404"; base01 = "141414"; base02 = "242424"; base03 = "61507A";
	base04 = "BFBBBF"; base05 = "DFDBDF"; base06 = "EFEBEF"; base07 = "FFFBFF";
	base08 = "B53B50"; base09 = "E4600E"; base0A = "DAE84D"; base0B = "06EA61";
	base0C = "7CEDE9"; base0D = "03AEFF"; base0E = "EA5CE2"; base0F = "9D4D0E";
}
themes["tomorrow-night-eighties"] = {
	base00 = "2d2d2d"; base01 = "393939"; base02 = "515151"; base03 = "999999";
	base04 = "b4b7b4"; base05 = "cccccc"; base06 = "e0e0e0"; base07 = "ffffff";
	base08 = "f2777a"; base09 = "f99157"; base0A = "ffcc66"; base0B = "99cc99";
	base0C = "66cccc"; base0D = "6699cc"; base0E = "cc99cc"; base0F = "a3685a";
}
themes["tomorrow-night"] = {
	base00 = "1d1f21"; base01 = "282a2e"; base02 = "373b41"; base03 = "969896";
	base04 = "b4b7b4"; base05 = "c5c8c6"; base06 = "e0e0e0"; base07 = "ffffff";
	base08 = "cc6666"; base09 = "de935f"; base0A = "f0c674"; base0B = "b5bd68";
	base0C = "8abeb7"; base0D = "81a2be"; base0E = "b294bb"; base0F = "a3685a";
}
themes["tomorrow"] = {
	base00 = "ffffff"; base01 = "e0e0e0"; base02 = "d6d6d6"; base03 = "8e908c";
	base04 = "969896"; base05 = "4d4d4c"; base06 = "282a2e"; base07 = "1d1f21";
	base08 = "c82829"; base09 = "f5871f"; base0A = "eab700"; base0B = "718c00";
	base0C = "3e999f"; base0D = "4271ae"; base0E = "8959a8"; base0F = "a3685a";
}
themes["tube"] = {
	base00 = "231f20"; base01 = "1c3f95"; base02 = "5a5758"; base03 = "737171";
	base04 = "959ca1"; base05 = "d9d8d8"; base06 = "e7e7e8"; base07 = "ffffff";
	base08 = "ee2e24"; base09 = "f386a1"; base0A = "ffd204"; base0B = "00853e";
	base0C = "85cebc"; base0D = "009ddc"; base0E = "98005d"; base0F = "b06110";
}
themes["twilight"] = {
	base00 = "1e1e1e"; base01 = "323537"; base02 = "464b50"; base03 = "5f5a60";
	base04 = "838184"; base05 = "a7a7a7"; base06 = "c3c3c3"; base07 = "ffffff";
	base08 = "cf6a4c"; base09 = "cda869"; base0A = "f9ee98"; base0B = "8f9d6a";
	base0C = "afc4db"; base0D = "7587a6"; base0E = "9b859d"; base0F = "9b703f";
}
themes["unikitty-dark"] = {
	base00 = "2e2a31"; base01 = "4a464d"; base02 = "666369"; base03 = "838085";
	base04 = "9f9da2"; base05 = "bcbabe"; base06 = "d8d7da"; base07 = "f5f4f7";
	base08 = "d8137f"; base09 = "d65407"; base0A = "dc8a0e"; base0B = "17ad98";
	base0C = "149bda"; base0D = "796af5"; base0E = "bb60ea"; base0F = "c720ca";
}
themes["unikitty-light"] = {
	base00 = "ffffff"; base01 = "e1e1e2"; base02 = "c4c3c5"; base03 = "a7a5a8";
	base04 = "89878b"; base05 = "6c696e"; base06 = "4f4b51"; base07 = "322d34";
	base08 = "d8137f"; base09 = "d65407"; base0A = "dc8a0e"; base0B = "17ad98";
	base0C = "149bda"; base0D = "775dff"; base0E = "aa17e6"; base0F = "e013d0";
}
themes["woodland"] = {
	base00 = "231e18"; base01 = "302b25"; base02 = "48413a"; base03 = "9d8b70";
	base04 = "b4a490"; base05 = "cabcb1"; base06 = "d7c8bc"; base07 = "e4d4c8";
	base08 = "d35c5c"; base09 = "ca7f32"; base0A = "e0ac16"; base0B = "b7ba53";
	base0C = "6eb958"; base0D = "88a4d3"; base0E = "bb90e2"; base0F = "b49368";
}
themes["xcode-dusk"] = {
	base00 = "282B35"; base01 = "3D4048"; base02 = "53555D"; base03 = "686A71";
	base04 = "7E8086"; base05 = "939599"; base06 = "A9AAAE"; base07 = "BEBFC2";
	base08 = "B21889"; base09 = "786DC5"; base0A = "438288"; base0B = "DF0002";
	base0C = "00A0BE"; base0D = "790EAD"; base0E = "B21889"; base0F = "C77C48";
}
themes["zenburn"] = {
	base00 = "383838"; base01 = "404040"; base02 = "606060"; base03 = "6f6f6f";
	base04 = "808080"; base05 = "dcdccc"; base06 = "c0c0c0"; base07 = "ffffff";
	base08 = "dca3a3"; base09 = "dfaf8f"; base0A = "e0cf9f"; base0B = "5f7f5f";
	base0C = "93e0e3"; base0D = "7cb8bb"; base0E = "dc8cc3"; base0F = "000000";
}

return setmetatable({
	themes = themes,
	apply_theme = apply_base16_theme,
	theme_from_array = function(array)
		assert(#array == 16, "base16.theme_from_array: The array length must be 16")
		local result = {}
		for i, value in ipairs(array) do
			assert(#value == 6, "base16.theme_from_array: array values must be in 6 digit hex format, e.g. 'ffffff'")
			local key = ("base%02X"):format(i - 1)
			result[key] = value
		end
		return result
	end,
	theme_names = function()
		local result = {}
		for k in pairs(themes) do
			table.insert(result, k)
		end
		return result
	end
}, {
	__call = function (_, ...)
		apply_base16_theme(...)
	end,
})
