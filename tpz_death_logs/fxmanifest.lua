fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Nosmakos'
description 'TPZ-CORE - Death Logs'
version '1.0.0'

server_scripts { 'server/*.lua' }
client_scripts { 'client/*.lua' }

dependencies {
    'tpz_core',
    'tpz_characters',
}

lua54 'yes'
