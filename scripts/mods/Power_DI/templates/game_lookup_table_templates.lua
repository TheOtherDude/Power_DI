--Generates the lookup tables, still need to write a lookup manager for adding new lookups via the api--
local mod = get_mod("Power_DI")
local utilities = mod:io_dofile([[Power_DI\scripts\mods\Power_DI\modules\utilities]])
local safe_clone_table = utilities.safe_clone_table

local game_lookup_tables = {
    BuffTemplates = safe_clone_table(require("scripts/settings/buff/buff_templates")),
    ArchetypeTalents = safe_clone_table(require("scripts/settings/ability/archetype_talents/archetype_talents")),
    weapon_trait_templates = safe_clone_table(require("scripts/settings/equipment/weapon_traits/weapon_trait_templates")),
}

for k, v in pairs(NetworkLookup) do
    if type(v) == "table" then
        game_lookup_tables[k] = safe_clone_table(v)
    end
end

return game_lookup_tables
