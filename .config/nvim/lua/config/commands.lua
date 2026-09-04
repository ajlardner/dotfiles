vim.api.nvim_create_user_command('Llmdisclaimer', function() 
	local c=vim.api.nvim_win_get_cursor(0)
	local lines = {
		'## LLM Disclaimer',
		'This project uses AI-assisted development tools. See my [LLM usage policy](https://github.com/ajlardner/llm-policy) for details.',
		'',
		'### LLM Tools Used',
		'- [Pi Coding Agent](https://github.com/ajlardner/pi-coding-agent-config/)'
	}
	vim.api.nvim_buf_set_lines(0,c[1],c[1],false,lines)
end, {})
