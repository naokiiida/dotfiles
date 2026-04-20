local get_hovered = ya.sync(function()
	local h = cx.active.current.hovered
	return h and tostring(h.url) or nil
end)

local function raw_path(url_str)
	-- Strip any yazi internal scheme: "search://kw//path" → "/path"
	local stripped = url_str:match("^%w+://.-%f[/](//.*)$")
	if stripped then
		stripped = stripped:gsub("^//", "/")
	else
		stripped = url_str
	end
	-- Decode percent-encoded characters
	return (stripped:gsub("%%(%x%x)", function(hex)
		return string.char(tonumber(hex, 16))
	end))
end

local function copy_to_clipboard(text)
	local child, err = Command("pbcopy")
		:stdin(Command.PIPED)
		:spawn()
	if err or not child then
		ya.notify { title = "Copy path", content = "pbcopy failed: " .. tostring(err), timeout = 3, level = "error" }
		return false
	end
	child:write_all(text)
	child:flush()
	child:wait()
	return true
end

return {
	entry = function(_, job)
		local url = get_hovered()
		if not url then
			ya.notify { title = "Copy path", content = "No file hovered", timeout = 2, level = "warn" }
			return
		end

		local path = raw_path(url)
		local mode = job.args[1] or "path"

		local result
		if mode == "dir" then
			result = path:match("^(.*)/[^/]*$") or path
		else
			result = path
		end

		if copy_to_clipboard(result) then
			ya.notify { title = "Copy path", content = result, timeout = 2 }
		end
	end,
}
