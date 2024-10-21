local function getHwid()
    local setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    local request = request or http_request or (http and http.request) or syn.request

    local response = request({Url = "https://httpbin.org//headers"}).Body
    local decoded = game:GetService("HttpService"):JSONDecode(response)

    local hwid = nil
    local hwidIds = {"fingerprint", "identifier", "appleware"}

    for i, v in pairs(decoded.headers) do
        local lowered = tostring(i):lower()
        local found = false

        for _, id in pairs(hwidIds) do
            if string.find(lowered, tostring(id):lower()) and not string.find(lowered, "user") then
                found = true; break
            end
        end

        if found then
            hwid = v; break
        end
    end

    return hwid
end

local hwid = getHwid()
print(hwid)
setclipboard(hwid)
