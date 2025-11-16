fx_version 'cerulean'
game 'gta5'

author 'SeuNome'
description 'Sistema de coleta com menu ox_lib, NPCs e configuração completa via config.lua'

lua54 'yes'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
