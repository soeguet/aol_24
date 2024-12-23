local input_file = io.open("/home/soeguet/code/lua/aol_24/day_02/example_02_02.txt", "r")
local input_file2 = io.open("/home/soeguet/code/lua/aol_24/day_02/input_02_02.txt", "r")

if input_file == nil or input_file2 == nil then
	return
end

local function aol_02_02(file)
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

	for report_index = 1, #reports, 1 do
		-- holy moly
		local descending = reports[report_index][1] > reports[report_index][#reports[report_index]]
		local safe_flag = true

		local tolerance_used = false
		local skip_value_once = false

		for report_level_index = 2, #reports[report_index], 1 do
			local current_level_value = reports[report_index][report_level_index]
			local last_level_value = 0
			if tolerance_used and skip_value_once then
				-- imaginary remove last value and compare this with the second last one
				last_level_value = reports[report_index][report_level_index - 2]
				skip_value_once = false
			else
				last_level_value = reports[report_index][report_level_index - 1]
			end

			local delta = last_level_value - current_level_value

			if descending and delta < 0 and not tolerance_used then
				tolerance_used = true
				skip_value_once = true
			elseif descending and delta < 0 and tolerance_used then
				safe_flag = false
				break
			end

			if (math.abs(delta) < 1 and not tolerance_used) or (math.abs(delta) > 3 and not tolerance_used) then
				tolerance_used = true
				skip_value_once = true
			elseif (math.abs(delta) < 1 and tolerance_used) or (math.abs(delta) > 3 and tolerance_used) then
				safe_flag = false
				break
			end
		end

		if safe_flag then
			safe = safe + 1
		end
	end

	print("safe", safe)
end

aol_02_02(input_file)
aol_02_02(input_file2)

io.close(input_file)
io.close(input_file2)

-- 644 too high!
