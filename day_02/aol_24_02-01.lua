-- local file = io.open("/home/soeguet/code/lua/aol_24/day_02/example_02_01.txt", "r")
local file = io.open("/home/soeguet/code/lua/aol_24/day_02/input_02_01.txt", "r")

print("HI")
if file == nil then
	return
end

local safe = 0
local reports = {}

while true do
	local line = file:read("*l")

	if line == nil then
		break
	end

	local levels = {}

	for w in line:gmatch("%S+") do
		table.insert(levels, tonumber(w))
	end

	table.insert(reports, levels)
end
io.close(file)

for i = 1, #reports, 1 do
	local way = "up"
	local skip_this_report = false

	for j = 2, #reports[i], 1 do
		local report = reports[i]
		local last_value = report[j - 1]
		local current_value = report[j]

		local delta = last_value - current_value

		if j == 2 then
			if delta < 0 then
				way = "down"
			end
		end

		if math.abs(delta) > 3 or math.abs(delta) < 1 then
			skip_this_report = true
			break
		end

		if way == "down" and delta > 0 then
			skip_this_report = true
			break
		elseif way == "up" and delta < 0 then
			skip_this_report = true
			break
		end
	end

	if skip_this_report ~= true then
		safe = safe + 1
	end
end

print("safe", safe)
