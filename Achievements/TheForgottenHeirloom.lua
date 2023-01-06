local _G = _G
local _achievement = CreateFrame("Frame")
_G.passive_achievements.TheForgottenHeirloom = _achievement

-- General info
_achievement.name = "TheForgottenHeirloom"
_achievement.title = "Benny Blaanco's Demise"
_achievement.class = "All"
_achievement.icon_path = "Interface\\Addons\\Hardcore\\Media\\icon_the_forgotten_heirloom.blp"
_achievement.level_cap = 12
_achievement.quest_num = 64
_achievement.quest_name = "The Forgotten Heirloom"
_achievement.zone = "Westfall"
_achievement.kill_target = "Benny Blaanco"
_achievement.description = HCGeneratePassiveAchievementKillDescription(_achievement.kill_target, _achievement.quest_name, _achievement.zone, _achievement.level_cap, "Alliance")
_achievement.restricted_game_versions = {
	["WotLK"] = 1,
}

-- Registers
function _achievement:Register(succeed_function_executor)
	_achievement:RegisterEvent("QUEST_TURNED_IN")
	_achievement.succeed_function_executor = succeed_function_executor 
end

function _achievement:Unregister()
	_achievement:UnregisterEvent("QUEST_TURNED_IN")
end

-- Register Definitions
_achievement:SetScript("OnEvent", function(self, event, ...)
	local arg = { ... }
	HCCommonPassiveAchievementKillCheck(_achievement, event, arg)
end)
