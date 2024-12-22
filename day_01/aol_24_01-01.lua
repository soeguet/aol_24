local file = io.open("./input_01_01.txt", "r")

if file == nil then
	return
end

local input_stream = file:read("*a")

-- print(input_stream)

local chunks_left = {}
local chunks_right = {}

for chunk in input_stream:gmatch("%S+") do
	if #chunks_left == #chunks_right then
		table.insert(chunks_left, chunk)
	else
		table.insert(chunks_right, chunk)
	end
end

-- print("chunks_left")
-- for i, chunk in ipairs(chunks_left) do
-- 	print(i, chunk)
-- end
--
-- print("chunks_right")
-- for i, chunk in ipairs(chunks_right) do
-- 	print(i, chunk)
-- end

table.sort(chunks_left)
table.sort(chunks_right)

local distance = 0

for i, _ in ipairs(chunks_left) do
	local diff = math.abs(chunks_left[i] - chunks_right[i])
	distance = distance + diff
end

print("total distance", distance)
