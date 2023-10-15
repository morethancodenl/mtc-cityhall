fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'More Than Code'
description 'Cityhall (mtc-cityhall) 1.0.0'
version '1.0.0'

client_scripts {
    'client/headshot.lua',
    'client/nui.lua',
    'client/callbacks.lua',
    'client/client.lua',
    'client/ped.lua',
    'client/blip.lua'
}

server_scripts {
    'server/*.lua',
}

shared_scripts {
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
