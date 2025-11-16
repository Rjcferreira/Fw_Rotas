RegisterNetEvent('coleta:entregarItem', function(item)
    local src = source
    if not item or type(item) ~= 'string' then return end
    exports.ox_inventory:AddItem(src, item, 1)
end)
