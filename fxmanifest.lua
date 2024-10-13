fx_version 'cerulean'
game 'gta5'

description 'PR-LIB'
repository 'https://github.com/Zotters/pr-lib'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
    'loader/loader.lua',
    'modules/*.lua'
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
}

server_script 'server/*.lua'


lua54 'yes'
use_experimental_fxv2_oal 'yes'
