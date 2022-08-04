local _G = _G
local ephemeral_achievement = CreateFrame("Frame")
_G.achievements.Ephemeral = ephemeral_achievement

-- General info
ephemeral_achievement.name = "Ephemeral"
ephemeral_achievement.title = "Ephemeral"
ephemeral_achievement.class = "All"
ephemeral_achievement.icon_path = "Interface\\Addons\\Hardcore\\Media\\icon_ephemeral.blp"
ephemeral_achievement.description =
	"Complete the Hardcore challenge without at any point repairing the Durability of an item. The Repair function of NPCs is not allowed to be used."

-- Registers
function ephemeral_achievement:Register(fail_function_executor)
	ephemeral_achievement:RegisterEvent("UPDATE_INVENTORY_DURABILITY")

	MerchantRepairAllButton:SetScript("OnClick", function()
		ephemeral_achievement.fail_function_executor.Fail(ephemeral_achievement.name)
	end)

	MerchantRepairItemButton:SetScript("OnClick", function()
		ephemeral_achievement.fail_function_executor.Fail(ephemeral_achievement.name)
	end)

	ephemeral_achievement.fail_function_executor = fail_function_executor
end

function ephemeral_achievement:Unregister()
end

-- Register Definitions
ephemeral_achievement:SetScript("OnEvent", function(self, event, ...)
	local arg = { ... }
end)
