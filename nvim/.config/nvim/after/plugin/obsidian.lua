require('obsidian').setup({
    workspaces = {
	{
	    name = "Notes",
	    path = "~/notes",
	},
    },
    new_notes_location = "notes_subdir",
    ---@param title string|?
    ---@return string
    note_id_func = function (title)
	local suffix = ""
	if title ~= nil then
	    suffix = title:gsub(" ", "-"):lower()
	else
	    for _ = 1,4 do
		suffix = suffix .. string.char(math.random(65, 90))
	    end
	    suffix = tostring(os.time()) .. "-" .. suffix
	end
	return suffix
    end,
    templates = {
	folder = "~/.config/obsidian/templates",
	date_formate = "%Y-$m-%d",
	time_format = " %H:%M"
    }
})
