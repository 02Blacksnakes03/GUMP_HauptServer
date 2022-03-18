fx_version 'adamant'
game 'gta5'
version '1.0.0'
author 'Apoysus'

server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua',
  'server/clientcode.lua',
  'config.lua'
}

client_scripts {
  'client/main.lua',
  'config.lua'
}

ui_page 'html/index.html'
files {
  'html/index.html',
  'html/script.js',
  'html/*.png',
}