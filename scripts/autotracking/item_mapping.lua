-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type override. The third value is an optional increment multiplier for consumables. (feel free to expand the table with any other values you might need (i.e. special initial values, etc.)!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
BASE_ITEM_ID = 0
ITEM_MAPPING = {
    [6592888] = { { "Swim", "toggle" } },
    [6592848] = { { "Club", "toggle" }, { "Yumi Club", "toggle" } },
	[6592852] = { { "Net", "toggle" } },
	[6592856] = { { "Radar", "toggle" } },
	[6592860] = { { "Hoop", "toggle" } },
	[6592864] = { { "Shot", "toggle" } },
	[6592868] = { { "Car", "toggle" }, { "Yumi Car", "toggle" } },
	[6592872] = { { "Flyer", "toggle" }, { "Yumi Flyer", "toggle" } },
	[6592816] = { { "Knight", "toggle" }, { "Yumi Knight", "toggle" } },
	[6592820] = { { "Wild", "toggle" }, { "Yumi Wild", "toggle" } },
	[6592824] = { { "Ninja", "toggle" }, { "Yumi Ninja", "toggle" } },
	[6592828] = { { "Dancer", "toggle" }, { "Yumi Dancer", "toggle" } },
	[6592832] = { { "Fighter", "toggle" }, { "Yumi Fighter", "toggle" } },
	[6592836] = { { "Ace", "toggle" }, { "Yumi Ace", "toggle" } },
	[6592840] = { { "Monkey", "toggle" }, { "Yumi Monkey", "toggle" } },
	[1000] = { { "Channel_Key", "consumable" } },
	[6592920] = { { "Explosive_Pallet", "toggle" } },	
}