local file = io.open("./example_02_01.txt", "r")
-- local file = io.open("./input_02_01.txt", "r")
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
		table.insert(levels, w)
	end

	table.insert(reports, levels)
end
io.close(file)

for _, report in ipairs(reports) do
	local way = "up"

	for index, level in ipairs(report) do
		if index == 1 then
			break
		end

		local last_value = report[index - 1]
		local current_value = level

		local delta = last_value - current_value

		if level == 2 then
			if delta < 0 then
				way = "down"
			end
		end

		if math.abs(delta) > 3 or math.abs(delta) < 1 then
			break
		end

		if way == "down" and delta > 0 then
			break
		elseif way == "up" and delta < 0 then
			break
		else
			safe = safe + 1
		end
	end
end

print("safe", safe)

-- local report_table = {}
--
-- for chunk in input_stream:gmatch("%S+") do
-- end
--
-- -- print("chunks_left")
-- -- for i, chunk in ipairs(chunks_left) do
-- -- 	print(i, chunk)
-- -- end
-- --
-- -- print("chunks_right")
-- -- for i, chunk in ipairs(chunks_right) do
-- -- 	print(i, chunk)
-- -- end
--
-- table.sort(chunks_left)
-- table.sort(chunks_right)
--
-- local distance = 0
--
-- for i, _ in ipairs(chunks_left) do
-- 	local diff = math.abs(chunks_left[i] - chunks_right[i])
-- 	distance = distance + diff
-- end
--
-- print("total distance", distance)
