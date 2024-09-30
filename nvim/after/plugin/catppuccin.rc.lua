local status, catppuccin = pcall(require, "catppuccin")
if (not status) then return end



catppuccin.setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {     -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false,   -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    -- mocha = {
    --   text = "#F4CDE9",
    --   subtext1 = "#DEBAD4",
    --   subtext0 = "#C8A6BE",
    --   overlay2 = "#B293A8",
    --   overlay1 = "#9C7F92",
    --   overlay0 = "#866C7D",
    --   surface2 = "#705867",
    --   surface1 = "#5A4551",
    --   surface0 = "#44313B",
    --
    --   base = "#352939",
    --   mantle = "#211924",
    --   crust = "#1a1016",
    -- },
  },
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = true,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },

})
