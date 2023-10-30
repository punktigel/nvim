require("user")

local function set_colorscheme(color)
    local colorscheme = color or 'rose-pine-moon' -- set rose-pine as backup colorscheme
    vim.cmd('colorscheme ' .. colorscheme)
end

set_colorscheme('thisname_dark')
