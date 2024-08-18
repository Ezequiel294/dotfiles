function ColorMyPencils(color, transparent)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	if transparent then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

ColorMyPencils("catppuccin", false)
