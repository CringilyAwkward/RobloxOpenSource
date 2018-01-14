-- place this script into the chat service

local ms = game:GetService("MarketplaceService")

local gamepasses = { -- the key inside the brackets is the gamepass ID
	[913974304] = {title = 'VIP', priority = 1, color = Color3.fromRGB(92, 137, 165)},
	[913974448] = {title = 'VVIP', priority = 2, color = Color3.fromRGB(65, 99, 20)}
}

local players = { -- the key inside the brackets is the UserId
	[275963487] = {title = 'Owner', priority = 5, color = Color3.fromRGB(151, 114, 165)}
}

function sendInfo(player)
	
	local info = nil
	local priority = 0
	
	for key, value in pairs(gamepasses) do
		if ms:PlayerOwnsAsset(player, key) and value.priority > priority then
			info = {title = value.title, color = value.color}
			priority = value.priority
		end
	end	
	
	for key, value in pairs(players) do
		if player.UserId == key and value.priority > priority then
			info = {title = value.title, color = value.color}
			priority = value.priority
		end
	end	
	
	return info
	
end

return sendInfo

--[[

written by: TwistedKhid
	
--]]