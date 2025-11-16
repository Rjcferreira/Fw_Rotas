Config = {}

-- Local onde o menu pode ser acessado
Config.Menu = {
    coords = vector3(-1217.96, -1794.98, 3.91),
    heading = 200.39,
    npc = 's_m_m_dockwork_01',
    blip = {
        sprite = 478,
        color = 5,
        label = 'Central de Coleta'
    }
}

-- Rotas definidas por categoria/subcategoria
Config.Rotas = {
    ["Armas"] = {
        ["Leves"] = {
            { coords = vector3(-1274.8542, -1716.5669, 2.9920), item = 'weapon_pistol' },
            { coords = vector3(-1294.9813, -1752.6901, 2.1680), item = 'weapon_snspistol' },
            { coords = vector3(-1231.6090, -1802.7738, 2.5560), item = 'weapon_stungun' }
        },
        ["Medias"] = {
            { coords = vector3(200.0, -200.0, 28.0), item = 'weapon_smg' },
            { coords = vector3(202.0, -202.0, 28.0), item = 'weapon_minismg' },
            { coords = vector3(204.0, -204.0, 28.0), item = 'weapon_microsmg' }
        },
        ["Pesadas"] = {
            { coords = vector3(300.0, -300.0, 28.0), item = 'weapon_carbinerifle' },
            { coords = vector3(302.0, -302.0, 28.0), item = 'weapon_assaultrifle' },
            { coords = vector3(304.0, -304.0, 28.0), item = 'weapon_bullpuprifle' }
        }
    },
    ["Balas"] = {
        ["Leves"] = {
            { coords = vector3(110.0, -110.0, 28.0), item = 'ammo_pistol' },
            { coords = vector3(112.0, -112.0, 28.0), item = 'ammo_snspistol' },
            { coords = vector3(114.0, -114.0, 28.0), item = 'ammo_stungun' }
        },
        ["Medias"] = {
            { coords = vector3(210.0, -210.0, 28.0), item = 'ammo_smg' },
            { coords = vector3(212.0, -212.0, 28.0), item = 'ammo_minismg' },
            { coords = vector3(214.0, -214.0, 28.0), item = 'ammo_microsmg' }
        },
        ["Pesadas"] = {
            { coords = vector3(310.0, -310.0, 28.0), item = 'ammo_rifle' },
            { coords = vector3(312.0, -312.0, 28.0), item = 'ammo_bullpuprifle' },
            { coords = vector3(314.0, -314.0, 28.0), item = 'ammo_assaultrifle' }
        }
    },
    ["Itens"] = {
        ["Legais"] = {
            { coords = vector3(120.0, -120.0, 28.0), item = 'radio' },
            { coords = vector3(122.0, -122.0, 28.0), item = 'walkie' },
            { coords = vector3(124.0, -124.0, 28.0), item = 'binoculars' }
        },
        ["Ilegais"] = {
            { coords = vector3(220.0, -220.0, 28.0), item = 'lockpick' },
            { coords = vector3(222.0, -222.0, 28.0), item = 'c4' },
            { coords = vector3(224.0, -224.0, 28.0), item = 'handcuffs' }
        },
        ["Gerais"] = {
            { coords = vector3(320.0, -320.0, 28.0), item = 'water' },
            { coords = vector3(322.0, -322.0, 28.0), item = 'bread' },
            { coords = vector3(324.0, -324.0, 28.0), item = 'bandage' }
        }
    }
}
