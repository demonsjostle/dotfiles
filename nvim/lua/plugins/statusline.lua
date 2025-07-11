return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  {
    "windwp/windline.nvim",
    event = "VeryLazy",
    config = function()
      local windline = require("windline")

      local helper = require("windline.helpers")
      local utils = require("windline.utils")
      local b_components = require("windline.components.basic")
      local git_comps = require("windline.components.git")
      local git_rev_components = require("windline.components.git_rev")
      local sep = helper.separators
      local animation = require("wlanimation")
      local efffects = require("wlanimation.effects")
      local theme_colors = require("windline.themes").load_theme("wind")

      local state = _G.WindLine.state

      local hl_list = {
        Black = { "white", "black" },
        Inactive = { "InactiveFg", "InactiveBg" },
        Active = { "ActiveFg", "ActiveBg" },
      }
      local basic = {}
      local luffy_text = " "

      basic.divider = { "%=", { "NormalFg", "NormalBg" } }
      basic.space = { " ", "" }
      basic.bg = { " ", "StatusLine" }
      basic.file_name_inactive = { "%f", hl_list.Inactive }
      basic.line_col_inactive = { [[ %3l:%-2c ]], hl_list.Inactive }
      basic.progress_inactive = { [[%3p%% ]], hl_list.Inactive }

      utils.change_mode_name({
        ["n"] = { " NORMAL", "Normal" },
        ["no"] = { " O-PENDING", "Visual" },
        ["nov"] = { " O-PENDING", "Visual" },
        ["noV"] = { " O-PENDING", "Visual" },
        ["no"] = { " O-PENDING", "Visual" },
        ["niI"] = { " NORMAL", "Normal" },
        ["niR"] = { " NORMAL", "Normal" },
        ["niV"] = { " NORMAL", "Normal" },
        ["v"] = { "󰍳 VISUAL", "Visual" },
        ["V"] = { "󰍳 V-LINE", "Visual" },
        [""] = { "󰍳 V-BLOCK", "Visual" },
        ["s"] = { " SELECT", "Visual" },
        ["S"] = { " S-LINE", "Visual" },
        [""] = { " S-BLOCK", "Visual" },
        ["i"] = { " INSERT", "Insert" },
        ["ic"] = { " INSERT", "Insert" },
        ["ix"] = { " INSERT", "Insert" },
        ["R"] = { "󰟈 REPLACE", "Replace" },
        ["Rc"] = { "󰟈 REPLACE", "Replace" },
        ["Rv"] = { "V-REPLACE", "Normal" },
        ["Rx"] = { "󰟈 REPLACE", "Normal" },
        ["c"] = { " COMMAND", "Command" },
        ["cv"] = { " COMMAND", "Command" },
        ["ce"] = { " COMMAND", "Command" },
        ["r"] = { "󰟈 REPLACE", "Replace" },
        ["rm"] = { " MORE", "Normal" },
        ["r?"] = { " CONFIRM", "Normal" },
        ["!"] = { " SHELL", "Normal" },
        ["t"] = { " TERMINAL", "Command" },
      })

      basic.vi_mode = {
        name = "vi_mode",
        hl_colors = {
          Normal = { "white", "black" },
          Insert = { "black", "red" },
          Visual = { "black", "green" },
          Replace = { "black", "cyan" },
          Command = { "black", "yellow" },
          NormalSep = { "black", "GitbranchBg" },
          InsertSep = { "red", "GitbranchBg" },
          VisualSep = { "green", "GitbranchBg" },
          ReplaceSep = { "cyan", "GitbranchBg" },
          CommandSep = { "yellow", "GitbranchBg" },
        },
        text = function(bufnr, winid, width)
          if state.mode[2] == "Insert" then
            return { { " " .. luffy_text .. " INSERT ", state.mode[2] } }
          end
          return {

            { " " .. state.mode[1] .. " ", state.mode[2] },
            -- { sep.right_rounded, state.mode[2] .. 'Sep' },
          }
        end,
      }

      basic.git_branch = {
        name = "git_branch",
        hl_colors = {

          default = { "GitbranchFg", "GitbranchBg" },
          right_sep = { "GitbranchBg", "FilenameBg" },
          NormalSep = { "black", "GitbranchBg" },
          InsertSep = { "red", "GitbranchBg" },
          VisualSep = { "green", "GitbranchBg" },
          ReplaceSep = { "cyan", "GitbranchBg" },
          CommandSep = { "yellow", "GitbranchBg" },

          no_git = { "white_light", "black_light" },
          no_git_right_sep = { "black_light", "FilenameBg" },
          no_git_NormalSep = { "black", "black_light" },
          no_git_InsertSep = { "red", "black_light" },
          no_git_VisualSep = { "green", "black_light" },
          no_git_ReplaceSep = { "cyan", "black_light" },
          no_git_CommandSep = { "yellow", "black_light" },
        },

        text = function(bufnr)
          if git_comps.is_git(bufnr) then
            return {
              { sep.right_rounded, state.mode[2] .. "Sep" },
              { git_comps.git_branch(), "default" },
              { sep.right_rounded, "right_sep" },
            }
          end
          return {
            { sep.right_rounded, "no_git_" .. state.mode[2] .. "Sep" },
            { "  ", "no_git" },
            { " ", { "red", "black_light" } },
            { sep.right_rounded, "no_git_right_sep" },
          }
        end,
      }

      basic.file_name = {
        name = "file_name",
        hl_colors = {
          default = { "FilenameFg", "FilenameBg" },
          right_sep = { "FilenameBg", "NormalBg" },
        },

        text = function(bufnr, windid, width)
          if width < 150 then
            return {
              { " ", "" },
              { b_components.file_name(), "default" },
              { sep.right_rounded, "right_sep" },
            }
          end
          return {
            -- { sep.right_rounded, 'right_sep' },
            { " ", "" },
            { b_components.full_file_name, "default" },
            { " ", "" },
            { b_components.file_modified(" "), "default" },
            { b_components.cache_file_size(), "default" },
            { sep.right_rounded, "right_sep" },
          }
        end,
      }

      basic.git = {
        name = "git",
        hl_colors = {
          green = { "green_light", "NormalBg" },
          red = { "red", "NormalBg" },
          yellow = { "yellow_light", "NormalBg" },
          git_rev_color = { "yellow", "NormalBg" },
        },
        text = function(bufnr)
          if git_comps.is_git(bufnr) then
            return {

              { git_rev_components.git_rev({ format = " ⇡%s⇣%s", interval = 10000 }), "git_rev_color" },
              { git_comps.diff_added({ format = "  %s", show_zero = true }), "green" },
              { git_comps.diff_removed({ format = "  %s", show_zero = true }), "red" },
              { git_comps.diff_changed({ format = "  %s", show_zero = true }), "yellow" },
              { " ", "" },
            }
          end
          return ""
        end,
      }

      basic.file_info = {
        name = "file_info",
        hl_colors = {
          default = { "FileInfoFg", "FileInfoBg" },
          left_sep = { "FileInfoBg", "NormalBg" },
        },
        text = function(bufnr, windid, width)
          if width < 55 then
            return ""
          elseif width < 70 then
            return { { b_components.file_type({ icon = true }), "default" } }
          end
          return {
            { sep.left_rounded, "left_sep" },
            { " ", "default" },
            { b_components.file_type({ icon = true }), "default" },
            { " ", "" },
            { b_components.file_encoding(), "default" },
            { " ", "" },
            { b_components.file_format({ icon = true }), "default" },
            { " ", "" },
          }
        end,
      }

      basic.cursor_info = {
        name = "cursor_info",
        hl_colors = {
          default = { "CursorInfoFg", "CursorInfoBg" },
          left_sep = { "CursorInfoBg", "FileInfoBg" },
        },
        text = function(bufnr, winid, width)
          if width < 85 then
            return ""
          end
          return {
            { sep.left_rounded, "left_sep" },
            { [[ %3l:%-2c ]], "default" }, --line_col
            { [[%3p%% ]], "default" }, -- Progress
          }
        end,
      }

      basic.typing_animation = {
        name = "typing_animation",
        hl_colors = {
          waveright1 = { "waveright1", "wavedefault" },
          waveright2 = { "waveright2", "waveright1" },
          waveright3 = { "waveright3", "waveright2" },
          waveright4 = { "waveright4", "waveright3" },
          waveright5 = { "waveright5", "waveright4" },
          waveleft1 = { "waveleft1", "waveleft2" },
          waveleft2 = { "waveleft2", "waveleft3" },
          waveleft3 = { "waveleft3", "waveleft4" },
          waveleft4 = { "waveleft4", "waveleft5" },
          waveleft5 = { "waveleft5", "wavedefault" },
        },
        text = function(bufnr, winid, width)
          if width > 100 then
            return {
              { " " .. sep.left_rounded, "waveright1" },
              { " " .. sep.left_rounded, "waveright2" },
              { " " .. sep.left_rounded, "waveright3" },
              { " " .. sep.left_rounded, "waveright4" },
              { " " .. sep.left_rounded, "waveright5" },
              -- { ' ' .. sep.left_rounded, { 'black', 'waveright5' } },
              -- { sep.right_rounded .. ' ', { 'black_light', 'waveleft1' } },
              { sep.right_rounded .. " ", "waveleft1" },
              { sep.right_rounded .. " ", "waveleft2" },
              { sep.right_rounded .. " ", "waveleft3" },
              { sep.right_rounded .. " ", "waveleft4" },
              { sep.right_rounded .. " ", "waveleft5" },
            }
          end
          return ""
        end,
      }

      local default = {
        filetypes = { "default" },
        active = {
          basic.vi_mode,
          basic.git_branch,
          basic.file_name,
          basic.divider,
          basic.typing_animation,
          basic.git,
          basic.file_info,
          basic.cursor_info,
        },
        inactive = {
          basic.file_name_inactive,
          basic.divider,
          basic.divider,
          basic.line_col_inactive,
          { "", { "white", "InactiveBg" } },
          basic.progress_inactive,
        },
      }

      windline.setup({
        colors_name = function(colors)
          colors.FilenameFg = theme_colors.black_light
          colors.FilenameBg = theme_colors.white
          colors.GitbranchFg = "#111827" -- theme_colors.black_light
          colors.GitbranchBg = "#06B6D4" -- theme_colors.cyan_light
          colors.CursorInfoFg = theme_colors.white
          colors.CursorInfoBg = theme_colors.blue_light
          colors.FileInfoFg = theme_colors.white_light
          colors.FileInfoBg = theme_colors.black_light

          colors.NormalBg = theme_colors.NormalBg
          colors.NormalFg = theme_colors.NormalFg
          colors.ActiveBg = theme_colors.ActiveBg
          colors.ActiveFg = theme_colors.ActiveFg
          colors.InactiveBg = theme_colors.InactiveBg
          colors.InactiveFg = theme_colors.InactiveFg

          colors.black = theme_colors.black
          colors.red = theme_colors.red
          colors.green = "#d4fc00" -- theme_colors.green
          colors.yellow = theme_colors.yellow
          colors.blue = theme_colors.blue
          colors.magenta = theme_colors.magenta
          colors.cyan = theme_colors.cyan
          colors.white = theme_colors.white
          colors.black_light = theme_colors.black_light
          colors.red_light = theme_colors.red_light
          colors.yellow_light = theme_colors.yellow_light
          colors.blue_light = theme_colors.blue_light
          colors.magenta_light = theme_colors.magenta_light
          colors.green_light = theme_colors.green_light
          colors.cyan_light = theme_colors.cyan_light
          colors.white_light = theme_colors.white_light

          colors.wavedefault = colors.NormalBg
          colors.waveleft1 = colors.wavedefault
          colors.waveleft2 = colors.wavedefault
          colors.waveleft3 = colors.wavedefault
          colors.waveleft4 = colors.wavedefault
          colors.waveleft5 = colors.wavedefault

          colors.waveright1 = colors.wavedefault
          colors.waveright2 = colors.wavedefault
          colors.waveright3 = colors.wavedefault
          colors.waveright4 = colors.wavedefault
          colors.waveright5 = colors.wavedefault

          return colors
        end,
        statuslines = {
          default,
        },
      })

      local animation_control = function()
        -- Color sets
        local original = {
          "#90CAF9",
          "#64B5F6",
          "#42A5F5",
          "#2196F3",
          "#1E88E5",
          "#1976D2",
          "#1565C0",
          "#0D47A1",
        }

        local denim_to_jasmine = {
          "#283AB8", -- Denim Blue
          "#8D379E", -- Cadmium Violet
          "#F13484", -- Cerise Pink
          "#FF605D", -- Pastel Red
          "#FEA959", -- Rajah
          "#FEE27A", -- Jasmine
        }

        local ocean_breeze = {
          "#d16ba5",
          "#c777b9",
          "#ba83ca",
          "#aa8fd8",
          "#9a9ae1",
          "#8aa7ec",
        }

        local pop_cyan_sunset = {
          "#051937",
          "#004d7a",
          "#008793",
          "#00bf72",
          "#a8eb12",
        }

        local anim_colors = denim_to_jasmine

        animation.animation({
          data = {
            { "waveleft1", efffects.list_color(anim_colors, 6) },
            { "waveleft2", efffects.list_color(anim_colors, 5) },
            { "waveleft3", efffects.list_color(anim_colors, 4) },
            { "waveleft4", efffects.list_color(anim_colors, 3) },
            { "waveleft5", efffects.list_color(anim_colors, 2) },
          },
          timeout = nil,
          delay = 200,
          interval = 150,
        })

        animation.animation({
          data = {
            { "waveright1", efffects.list_color(anim_colors, 2) },
            { "waveright2", efffects.list_color(anim_colors, 3) },
            { "waveright3", efffects.list_color(anim_colors, 4) },
            { "waveright4", efffects.list_color(anim_colors, 5) },
            { "waveright5", efffects.list_color(anim_colors, 6) },
          },
          timeout = nil,
          delay = 200,
          interval = 150,
        })

        local luffy = { "􏾾", "􏾿", "􏿀", "􏿁", "􏿂", "􏿃" }
        animation.basic_animation({
          on_stop = function() end,
          type = "basic",
          timeout = nil,
          delay = 200,
          interval = 200,
          effect = efffects.list_text(luffy),
          on_tick = function(value)
            luffy_text = value
            vim.cmd.redrawstatus()
          end,
        })
      end

      _G.AnimationOnInsertEnter = function()
        -- Action to perform when entering insert mode
        animation_control()
      end

      _G.AnimationOnInsertLeave = function()
        animation.stop_all()
      end

      -- autocmd InsertCharPre * call myfunc()
      vim.cmd([[autocmd InsertEnter * lua AnimationOnInsertEnter()]])
      vim.cmd([[autocmd InsertLeave * lua AnimationOnInsertLeave()]])
    end,
  },
}
