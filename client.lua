
local menuCoords = Config.Menu.coords
local menuHeading = Config.Menu.heading
local menuNPC = Config.Menu.npc
local blipData = Config.Menu.blip

local npc

-- Cria o NPC fixo
CreateThread(function()
    RequestModel(menuNPC)
    while not HasModelLoaded(menuNPC) do Wait(10) end

    npc = CreatePed(0, menuNPC, menuCoords.x, menuCoords.y, menuCoords.z - 1.0, menuHeading, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
end)

-- Cria o blip do menu
CreateThread(function()
    local blip = AddBlipForCoord(menuCoords)
    SetBlipSprite(blip, blipData.sprite)
    SetBlipColour(blip, blipData.color)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.label or "Menu de Coleta")
    EndTextCommandSetBlipName(blip)
end)

-- Detecta proximidade e mostra texto interativo
CreateThread(function()
    local mostrando = false
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local dist = #(coords - menuCoords)

        if dist < 2.0 then
            if not mostrando then
                lib.showTextUI('[E] Abrir Menu de Coleta')
                mostrando = true
            end

            if IsControlJustReleased(0, 38) then
                abrirMenuPrincipal()
            end
        elseif mostrando then
            lib.hideTextUI()
            mostrando = false
        end
    end
end)

local rotaAtual = nil
local pontoAtual = 1

function abrirMenuPrincipal()
    lib.registerContext({
        id = 'menu_coleta_principal',
        title = '📦 Menu de Coleta',
        options = {
            {
                title = '🔫 Armas',
                description = 'Coletar armas variadas',
                icon = 'gun',
                onSelect = function()
                    abrirSubMenu('Armas')
                end
            },
            {
                title = '💥 Balas',
                description = 'Coletar munições',
                icon = 'shield',
                onSelect = function()
                    abrirSubMenu('Balas')
                end
            },
            {
                title = '🎒 Itens',
                description = 'Coletar outros itens',
                icon = 'box',
                onSelect = function()
                    abrirSubMenu('Itens')
                end
            }
        }
    })
    lib.showContext('menu_coleta_principal')
end

function abrirSubMenu(categoria)
    local opcoes = {}
    for subtipo, _ in pairs(Config.Rotas[categoria]) do
        table.insert(opcoes, {
            title = subtipo,
            description = 'Iniciar rota de ' .. subtipo,
            icon = 'map',
            onSelect = function()
                iniciarRota(Config.Rotas[categoria][subtipo])
            end
        })
    end

    table.insert(opcoes, {
        title = '🔙 Voltar',
        icon = 'arrow-left',
        onSelect = function()
            abrirMenuPrincipal()
        end
    })

    lib.registerContext({
        id = 'submenu_' .. categoria,
        title = categoria,
        options = opcoes
    })

    lib.showContext('submenu_' .. categoria)
end

function iniciarRota(pontos)
    rotaAtual = pontos
    pontoAtual = 1
    lib.notify({
        title = 'Rota Iniciada',
        description = 'Siga o GPS até o ponto de entrega.',
        type = 'inform'
    })
    irParaPonto()
end

local rotaBlip = nil

function irParaPonto()
    if rotaAtual and rotaAtual[pontoAtual] then
        local coords = rotaAtual[pontoAtual].coords
        SetNewWaypoint(coords.x, coords.y)

        -- Blip temporário do ponto de entrega
        if rotaBlip then RemoveBlip(rotaBlip) end
        rotaBlip = AddBlipForCoord(coords)
        SetBlipSprite(rotaBlip, 1)
        SetBlipScale(rotaBlip, 0.7)
        SetBlipColour(rotaBlip, 2)
        SetBlipAsShortRange(rotaBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("📦 Entrega de Item")
        EndTextCommandSetBlipName(rotaBlip)


        CreateThread(function()
            local npcCriado = false
            local npc
            local mostrandoTexto = false

            while true do
                Wait(0)
                if not rotaAtual or not rotaAtual[pontoAtual] then break end

                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local destino = rotaAtual[pontoAtual].coords
                local dist = #(pos - destino)

                if not npcCriado and dist < 50.0 then
                    RequestModel(Config.Menu.npc)
                    while not HasModelLoaded(Config.Menu.npc) do Wait(10) end
                    npc = CreatePed(0, Config.Menu.npc, destino.x, destino.y, destino.z - 1.0, 0.0, false, true)
                    FreezeEntityPosition(npc, true)
                    SetEntityInvincible(npc, true)
                    SetBlockingOfNonTemporaryEvents(npc, true)
                    npcCriado = true
                end

                if dist < 2.0 then
                    if not mostrandoTexto then
                        lib.showTextUI('[E] Receber item')
                        mostrandoTexto = true
                    end

                    if IsControlJustReleased(0, 38) then
                        local item = rotaAtual[pontoAtual].item
                        TriggerServerEvent('coleta:entregarItem', item)

                            -- Remove o blip após entrega
                            if rotaBlip then
                                RemoveBlip(rotaBlip)
                                rotaBlip = nil
                            end

                        if npc then DeletePed(npc) end
                        lib.hideTextUI()
                        mostrandoTexto = false

                        pontoAtual += 1
                        if rotaAtual[pontoAtual] then
                            lib.notify({
                                title = 'Próximo Ponto',
                                description = 'Siga até o próximo local.',
                                type = 'inform'
                            })
                            irParaPonto()
                        else
                            lib.notify({
                                title = 'Coleta Finalizada',
                                description = 'Todos os itens foram coletados.',
                                type = 'success'
                            })
                            rotaAtual, pontoAtual = nil, 1
                        end
                        break
                    end
                elseif mostrandoTexto then
                    lib.hideTextUI()
                    mostrandoTexto = false
                end
            end
        end)
    end
end
