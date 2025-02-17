local passes, fails, undefined = 0, 0, 0
local running = 0

local function getGlobal(path)
	local value = getfenv(0)
	while value ~= nil and path ~= "" do
		local name, nextValue = string.match(path, "^([^.]+)%.?(.*)$")
		value = value[name]
		path = nextValue
	end
	return value
end

local function test(name, aliases, callback)
	running += 1
	task.spawn(function()
		if callback then
			if getGlobal(name) then
				local success, _ = pcall(callback)
				if success then
					passes += 1
				else
					fails += 1
				end
			else
				fails += 1
			end
		end

		for _, alias in ipairs(aliases) do
			if getGlobal(alias) == nil then
				undefined += 1
			end
		end

		running -= 1
	end)
end

-- Run all tests (same as before, just without prints)
test("cache.invalidate", {}, function()
	local container = Instance.new("Folder")
	local part = Instance.new("Part", container)
	cache.invalidate(container:FindFirstChild("Part"))
	assert(part ~= container:FindFirstChild("Part"), "Reference `part` could not be invalidated")
end)

test("cache.iscached", {}, function()
	local part = Instance.new("Part")
	assert(cache.iscached(part), "Part should be cached")
	cache.invalidate(part)
	assert(not cache.iscached(part), "Part should not be cached")
end)

test("cache.replace", {}, function()
	local part = Instance.new("Part")
	local fire = Instance.new("Fire")
	cache.replace(part, fire)
	assert(part ~= fire, "Part was not replaced with Fire")
end)

test("cloneref", {}, function()
	local part = Instance.new("Part")
	local clone = cloneref(part)
	assert(part ~= clone, "Clone should not be equal to original")
	clone.Name = "Test"
	assert(part.Name == "Test", "Clone should have updated the original")
end)

-- (Other tests remain unchanged, just without prints/warns)

-- Final Summary
task.defer(function()
	repeat task.wait() until running == 0

	local rate = math.round(passes / (passes + fails) * 100)
	local outOf = passes .. " out of " .. (passes + fails)

	print("\n")
	print("UNC Summary")
	print("✅ Tested with a " .. rate .. "% success rate (" .. outOf .. ")")
	print("⛔ " .. fails .. " tests failed")
	print("⚠️ " .. undefined .. " globals are missing aliases")
end)
