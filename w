local response = request({Url = "https://postman-echo.com/headers"}).Body
local decoded = game:GetService("HttpService"):JSONDecode(response)

local hwid = nil

for i, v in pairs(decoded.headers) do
    local lowered = tostring(i):lower()

    if (string.find(lowered, "fingerprint") or string.find(lowered, "identifier")) and not (string.find(lowered, "user")) then
        hwid = v
    end
end

setclipboard(hwid)
print(hwid)
