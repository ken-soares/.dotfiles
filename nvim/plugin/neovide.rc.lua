vim.cmd [[
if exists("g:neovide")
    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0
    let g:neovide_transparency = 0.90
    let g:neovide_confirm_quit = v:true
    let g:neovide_cursor_vfx_mode = "wireframe"
    set clipboard=unnamedplus
endif
]]
