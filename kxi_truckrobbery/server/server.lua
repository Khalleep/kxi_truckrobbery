local function getItems()
    local items = {}
    for k, v in pairs(K.itemsTable) do
        if math.random(0, 100) <= v[4] then 
            local randomAmount = math.random(v[2], v[3])  
            items[#items+1] = { v[1], randomAmount } 
        end
    end

    return items
end

lib.callback.register('khalexi_kontit:poistaitemi', function(entity)
    exports.ox_inventory:RemoveItem(source, K.Robitem, 1)
end)

lib.callback.register('khalexi_kontit:payout', function(entity)
    local _source = source
    local items = getItems() 
    local temporaryStash = exports.ox_inventory:CreateTemporaryStash({
        label = K.locales.stash,
        slots = #items,
        maxWeight = 1000000,
        items = items
    })
    
    exports.ox_inventory:forceOpenInventory(_source, 'stash', temporaryStash)
end)