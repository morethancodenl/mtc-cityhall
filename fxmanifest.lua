fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'More Than Code'
description 'Replacement cityhall script for qbx_core'
version '1.0.0'

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client/headshot.lua',
    'client/nui.lua',
    'client/callbacks.lua',
    'client/client.lua',
    'client/ped.lua',
    'client/blip.lua'
}

server_scripts {
    'server/idcard.lua',
    'server/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/modules/lib.lua',
    'config.lua',
    'lang.lua',
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/fonts/*'
}

ui_page 'html/index.html'

lua54 'yes'
