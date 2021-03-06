vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- plugins are stored at ~/.local/share/nvim/site/pack/packer/start
	use 'wbthomason/packer.nvim'
	use 'morhetz/gruvbox'
	use 'https://github.com/ap/vim-css-color'
	use 'https://github.com/neoclide/coc.nvim'
	use 'jiangmiao/auto-pairs'
	use 'mattn/emmet-vim'
	use 'vim-airline/vim-airline'
	use 'enricobacis/vim-airline-clock'
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'rinx/nvim-minimap'
	use 'turbio/bracey.vim'
	use 'preservim/nerdcommenter'
	use 'https://github.com/SirVer/ultisnips'
	use 'https://github.com/epilande/vim-react-snippets'

	--Coc language servers
	--coc-pyright
	--coc-java
	--coc-tsserver
	--coc-css
	--coc-rust-analyzer

	require('nvim-tree').setup()

	vim.cmd([[
		colorscheme gruvbox
		let g:user_emmet_leader_key='<C-k>'
		let g:UltiSnipsExpandTrigger="<C-l>"

		function! s:check_back_space() abort
		  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~ '\s'
		endfunction

		inoremap <silent><expr> <Tab>
		      \ pumvisible() ? "\<C-n>" :
		      \ <SID>check_back_space() ? "\<Tab>" :
		      \ coc#refresh()

		highlight Normal guibg=none
		let g:airline#extensions#clock#format = '%H:%M:%S'
		let g:airline_left_sep = ''
		let g:airline_left_alt_sep = ''
		let g:airline_right_sep = ''
		let g:airline_right_alt_sep = ''
		let g:minimap#window#width = 15
	]])

end)
