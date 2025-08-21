fx_version 'cerulean'
game 'gta5'

author 'dny / džurny'

lua54 'yes'

shared_scripts {
   '@ox_lib/init.lua',
   'config.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'es_extended',
    'ox_target',
    'ox_lib',
    'cd_dispatch'
}

escrow_ignore {
  'config.lua', 
  'fxmanifest.lua'
}
