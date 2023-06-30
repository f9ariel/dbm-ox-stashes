local hookIdGloveBlacklist = exports.ox_inventory:registerHook('swapItems', function(payload)
    print(json.encode(payload, { indent = true }))
    return false
end, {
    print = false,
    itemFilter = Config.GloveboxBlacklist,
    inventoryFilter = {
        '^glove[%w]+',
    }
})

local hookIdTrunkBlacklist = exports.ox_inventory:registerHook('swapItems', function(payload)
    print(json.encode(payload, { indent = true }))
    return false
end, {
    print = false,
    itemFilter = Config.GloveboxBlacklist,
    inventoryFilter = {
        '^trunk[%w]+',
    }
})

for _,v in pairs(Config.Stashes) do
    if v.blacklist ~= nil then
        local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
            print(json.encode(payload, { indent = true }))
            return false
        end, {
            print = false,
            itemFilter = v.blacklist,
            inventoryFilter = v.stashes
        })
    else 
        local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
            print(json.encode(payload, { indent = true }))
	    for i = 1, #v.whitelist do
            if payload.fromSlot.name == v.whitelist[i] then 
                return true
            end
	    end
            return false
        end, {
            print = false,
            inventoryFilter = v.stashes,
        })
    end
end




