-- local file = io.open("./example_01_02.txt", "r")
local file = io.open("./input_01_02.txt", "r")

if file == nil then
	return
end

local input_stream = file:read("*a")

local chunks_left = {}
local chunks_right = {}

for chunk in input_stream:gmatch("%S+") do
	if #chunks_left == #chunks_right then
		table.insert(chunks_left, chunk)
	else
		table.insert(chunks_right, chunk)
	end
end

local similarity_score = 0

for _, chunk in ipairs(chunks_left) do
	local count = 0

	for _, value in ipairs(chunks_right) do
		if value == chunk then
			count = count + 1
		end
	end

	similarity_score = similarity_score + (chunk * count)
end

print("similarity_score", similarity_score)
