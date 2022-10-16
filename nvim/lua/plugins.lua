vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	-- plugins are stored at ~/.local/share/nvim/site/pack/packer/start
	
	use 'wbthomason/packer.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'https://github.com/ap/vim-css-color'
	use 'https://github.com/neoclide/coc.nvim'
	use 'jiangmiao/auto-pairs'
	use 'mattn/emmet-vim'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	--Coc language servers
	--coc-pyright
	--coc-java
	--coc-tsserver
	--coc-css
	--coc-rust-analyzer
	vim.cmd([[
		let g:user_emmet_leader_key='<C-k>'
		]])
end)


