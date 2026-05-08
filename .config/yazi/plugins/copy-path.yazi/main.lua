local get_urls = ya.sync(function()
	local selected = {}
	for _, u in pairs(cx.active.selected) do
		selected[#selected + 1] = tostring(u)
	end
	if #selected > 0 then
		return selected
	end
	local h = cx.active.current.hovered
	return h and { tostring(h.url) } or {}
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
		ya.mgr_emit("escape", { visual = true })
		local urls = get_urls()
		if #urls == 0 then
			ya.notify { title = "Copy path", content = "No file selected", timeout = 2, level = "warn" }
			return
		end

		local mode = job.args[1] or "path"
		local results = {}
		for _, url in ipairs(urls) do
			local path = raw_path(url)
			if mode == "dir" then
				results[#results + 1] = path:match("^(.*)/[^/]*$") or path
			else
				results[#results + 1] = path
			end
		end

		local result = table.concat(results, "\n")
		if copy_to_clipboard(result) then
			ya.notify { title = "Copy path", content = #results .. " path(s) copied", timeout = 2 }
		end
	end,
}
