local status, dashboard = pcall(require, "dashboard")
if (not status) then return end

dashboard.setup({
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '               Demons Jostle               ',
      '',
      '',
      '        ▄█          █          █▄          ',
      '      ▐██      ▄█  ███  █▄      ██▌        ',
      '     ▐██▌     ██████████████     ▐██▌      ',
      '    ████     ████████████████    ████      ',
      '    ▐█████  ██████████████████  █████▌     ',
      '    ████████████████████████████████       ',
      '     ███████▀▀████████████▀▀███████        ',
      '      █████▌  ▄▄ ▀████▀ ▄▄  ▐█████         ',
      '    ▄▄██████▄ ▀▀  ████  ▀▀ ▄██████▄▄       ',
      '    ██████████████████████████████████     ',
      '  ████████████████████████████████████     ',
      ' ██████   ███████▀▄██▄▀███████   ██████▌   ',
      '▐█████     ██████████████████      █████▌  ',
      ' ▐█████      ██████▀  ▀██████       █████▌ ',
      '  █████▄      ███        ███      ▄█████   ',
      '    ██████     █          █     ██████     ',
      '     █████                     █████       ',
      '      █████                   █████        ',
      '      ████   ▄            ▄    ████        ',
      '        ████ ██           ██ ████          ',
      '          ████████ ▄██▄ ████████           ',
      '         ████████████████████████          ',
      '         ████████████████████████          ',
      '          ▀█████████▀▀█████████▀           ',
      '            ▀███▀       ▀███▀              ',
      '',
      '',
      '',
    }, --your header
    center = {
      {
        icon = '🚪',
        desc = 'Quit',
        key = 'q',
        key_hl = 'Error',
        action = 'lua vim.cmd("quit")'
      },
    },
    footer = {
      -- "🚀 Ready to code! ",
      "  Neovim version: " .. vim.version().major .. "." .. vim.version().minor,
      -- "Stay productive! 🧠",
      "🚀 Let's get coding!",
      "🌱 'Success is not final, failure is not fatal: It is the courage to continue that counts.' – Winston Churchill",
      "✨ 'The only way to do great work is to love what you do.' – Steve Jobs",
      "💡 Remember: 'Simplicity is the ultimate sophistication.' – Leonardo da Vinci",
      --   '♥╣[-_-]╠♥',
      --   '♡〜ლ(๑癶ᴗ癶๑)ლ〜♡',
      --   '♡〜ლ(๑癶ᴗ癶๑)ლ〜♡♡〜ლ(๑癶ᴗ癶๑)ლ〜♡',
      --   '♡〜ლ(๑癶ᴗ癶๑)ლ〜♡♡〜ლ(๑癶ᴗ癶๑)ლ〜♡♡〜ლ(๑癶ᴗ癶๑)ლ〜♡',
      --   '♡〜ლ(๑癶ᴗ癶๑)ლ〜♡♡〜ლ(๑癶ᴗ癶๑)ლ〜♡',
      --   '♡〜ლ(๑癶ᴗ癶๑)ლ〜♡',
      --   '♥╣[-_-]╠♥'
    } --your footer
  }
})
