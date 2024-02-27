--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
---@diagnostic disable-next-line: unused-local
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	-- Palette
	-- local base = hsl(240, 14, 10)
	local base = hsl('#01161C')
	local disabled = hsl('#686858')
	local highlight = base.lighten(2)
	local indent = base.lighten(16)
	local orange = hsl('#E54810')
	local orange1 = orange.lighten(15)
	local orange2 = hsl('#e6770b')
	local orange3 = hsl('#F9A101')
	local yellow1 = hsl('#f5c024')
	local yellow2 = yellow1.darken(30)
	local yellow3 = yellow1.darken(50)
	local dormant = disabled.lighten(60)
	local pink = hsl('#d694fa')
	local green1 = hsl('#7cb375')
	local green2 = hsl('#9ef01a')
	local green3 = hsl('#466b5a')
	local purple1 = hsl('#b194fa')
	local purple2 = hsl('#D901F9')
	local red1 = hsl('#e52c2c')
	local red2 = hsl('#d3290f')
	local red3 = red1.darken(30)
	local info = hsl('#1f9fff')
	local menu = "black"
	local normal = disabled.lighten(62)
	local hint = normal.darken(30)

	return {

		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		Error { gui = "bold", bg = base, fg = red1 }, -- Any erroneous construct
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		Conceal { fg = dormant },                   -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor { fg = base, bg = yellow1 },         -- Character under the cursor
		-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn {},                                                    -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine { bg = highlight },                                      -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory {},                                                       -- Directory names (and other special names in listings)
		DiffAdd { fg = green2 },                                            -- Diff mode: Added line |diff.txt|
		DiffChange { fg = purple1 },                                        -- Diff mode: Changed line |diff.txt|
		DiffDelete { fg = red1 },                                           -- Diff mode: Deleted line |diff.txt|
		DiffText { gui = "bold, italic, underdotted", bg = base, fg = red1 }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		-- ErrorMsg       { }, -- Error messages on the command line
		VertSplit { fg = green3 }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		SignColumn {}, -- Column where |signs| are displayed
		-- IncSearch { fg = yellow1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting
		LineNr { fg = disabled }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr { fg = normal }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen { fg = red1 }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		NonText { fg = indent, gui = "italic" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal { fg = normal, bg = base },     -- Normal text
		NormalFloat {},                        -- Normal text in floating windows.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu { bg = menu, fg = dormant },                -- Popup menu: Normal item.
		PmenuSel { gui = "bold", fg = base, bg = yellow1 }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		Question { fg = green2 },                                       -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search { gui = "bold, undercurl", bg = highlight, fg = yellow1 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { gui = "bold", fg = green1, bg = base },  -- Status line of current window
		StatusLineNC { gui = "bold", fg = base, bg = purple1 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine { gui = "bold", fg = base, bg = yellow3 },    -- Tab pages line, not active tab page label
		TabLineFill { fg = yellow1 },                         -- Tab pages line, where there are no labels
		TabLineSel { gui = "bold", fg = base, bg = yellow1 }, -- Tab pages line, active tab page label
		Title { fg = green1 },                                -- Titles for output from ":set all", ":autocmd" etc.
		Visual { gui = "bold", bg = yellow1, fg = base },     -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = red1 },                             -- Warning messages
		Whitespace { fg = indent },                           -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment { fg = disabled, gui = "italic" }, -- Any comment

		Constant { gui = "italic", fg = red1 },  -- (*) Any constant
		String { fg = yellow1, gui = "italic" }, --   A string constant: "this is a string"
		-- Character      { }, --  redacter constant: 'c', '\n'
		-- Number { fg = red1 },                    --   A number constant: 234, 0xff
		Boolean { fg = orange2, gui = "italic" }, --   A boolean constant: TRUE, false
		-- Float          { }, --   A floating point constant: 2.3e10

		Identifier { fg = normal.lighten(60) },   -- (*) Any variable name
		Function { fg = orange1 },                --   Function name (also: methods for classes)

		Statement { gui = "italic", fg = purple1 }, -- (*) Any statement
		-- Conditional {},                          --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		Operator { fg = pink }, --   "sizeof", "+", "*", etc.
		-- Keyword { fg = pink }, --   any other keyword
		-- Exception      { }, --   try, catch, throw

		PreProc { fg = orange2 }, -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type { gui = "italic", fg = green1 }, -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure { fg = info },            --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special { fg = pink }, -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		Delimiter { fg = pink }, --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		-- Todo { fg = yellow1 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		-- TODO: Somehting
		-- These groups are for the n765898ative LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.
		--
		-- BUG: I have an issue here
		-- and its not fun
		--
		-- FIXME: I have another issue
		--
		-- HACK: dont do this at homeS

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError { fg = red3 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = yellow2 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = info },  -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = hint },  -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError { gui = "underdouble", sp = red1 }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn { gui = "underdouble", sp = yellow1 }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo { gui = "underdouble", sp = info },  -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint { gui = "underdouble", sp = hint },  -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Debugger
		DapBreakpoint { gui = "bold" },
		DapBreakpointIcon { fg = "red", gui = "bold" },
		DapLogPoint { fg = purple2, gui = "bold" },
		DapStopped { fg = base, bg = green2, gui = "bold" },

		UndotreeFirstNode { Function },
		-- UndotreeNode { Question },
		-- UndotreeSeq { Comment },
		-- UndotreeCurrent { Statement },
		UndotreeTimeStamp { fg = dormant },
		-- UndotreeSaved { fg = green2 },
		UndotreeBranch { fg = purple1 },
		UndotreeDiffLine { DiffText },
		UndotreeDiffAdded { DiffAdd },
		UndotreeDiffRemoved { DiffDelete },

		-- Neo-Tree		
		NeoTreeGitUntracked { gui = "italic", fg = orange1 }, -- NeoTreeGitUntracked xxx gui=italic guifg=#ff8700
		-- Indent Blankline
		IblScope { fg = orange1 },

		-- Custom Bar Items
		InsertMode { gui = "bold", fg = base, bg = "red" },
		Encoding { gui = "bold", fg = base, bg = orange2 },
		EncodingCap { gui = "bold", bg = base, fg = orange2 },
		LineFeed { gui = "bold", fg = base, bg = red2 },
		LineFeedCap { gui = "bold", bg = base, fg = red2 },
		Ruler { gui = "bold", fg = base, bg = green1 },
		RulerCap { gui = "bold", bg = base, fg = green1 },
		Size { gui = "bold", fg = base, bg = purple1 },
		SizeCap { gui = "bold", bg = base, fg = purple1 },
		Session { gui = "bold", bg = green1, fg = base },
		WinErr { gui = "bold", fg = base, bg = "red" }, -- Tab pages line, active tab page label
		WinOK { gui = "bold", fg = base, bg = green2 }, -- Tab pages line, active tab page label
		Win { gui = "bold", fg = base, bg = yellow2 }, -- Tab pages line, active tab page label


		TelescopeMatching { Search },
		TelescopeSelection { bg = yellow1, fg = base },
		TelescopePromptPrefix {},
		TelescopePromptNormal { fg = info },
		TelescopeResultsNormal { fg = dormant },
		TelescopePreviewNormal {},
		TelescopePromptBorder { fg = info },
		TelescopeResultsBorder { fg = info },
		TelescopePreviewBorder { fg = info },
		TelescopePromptTitle { fg = green2 },
		TelescopeResultsTitle { fg = info },
		TelescopePreviewTitle { fg = info },


		--Rainbow Delimiter
		RainbowDelimiterRed { fg = "red" },
		RainbowDelimiterBlue { fg = info },
		RainbowDelimiterGreen { fg = green2 },
		RainbowDelimiterOrange { fg = orange3 },
		RainbowDelimiterViolet { fg = purple2 },
		RainbowDelimiterCyan { fg = "cyan" },
		RainbowDelimiterYellow { fg = yellow1 },


		CopilotSuggestion { fg = disabled.lighten(19) },
		CmpItemAbbrDeprecated { bg = 'NONE', strikethrough = true, fg = disabled },
		CmpItemAbbrMatch { bg = 'NONE', fg = green2 },
		CmpItemAbbrMatchFuzzy {},
		CmpItemKindVariable { Identifier },
		CmpItemKindInterface { Type },
		CmpItemKindText { String },
		CmpItemKindFunction { Function },
		CmpItemKindMethod { CmpItemKindFunction },
		CmpItemKindKeyword { Statement },
		CmpItemKindProperty { fg = info },
		CmpItemKindUnit { CmpItemKindKeyword },


		-- Tree-Sitter syntax groups.
		--
		-- See :h sitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal",
		-- sym('@text.literal',
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		sym "@punctuation" { fg = pink }, -- Delimiter
		sym "@constant" { fg = green2 }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		sym "@parameter" { fg = orange },           -- Identifier
		sym "@method" { fg = orange2, gui = "bold" }, -- Function
		-- sym "@field" { fg = info, gui = "italic" },               -- Identifier
		sym "@property" { fg = info },              -- Identifier
		sym "@lsp.type.property.lua" { fg = info }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		sym "@keyword.operator.typescript" { gui = "italic", fg = orange }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		sym "@variable.javascript" { fg = orange },            -- Identifier
		-- sym"@type"              { }, -- Type
		sym "@type.typescript" { fg = orange3, gui = "italic" }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		sym "@tag" { fg = pink },                                  -- Tag
		-- Vue.js
		sym "@tag.attribute.vue" { fg = info },                    -- Tag
		sym "@method.vue" { fg = info.lighten(40), gui = "italic" }, -- Function
		sym "@punctuation.special.vue" { fg = info },              -- Function
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
