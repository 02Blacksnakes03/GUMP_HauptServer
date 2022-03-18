resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
    '@es_extended/locale.lua',
    'client/client.lua',
    'client/animation.lua',
	'config.lua',
--    'nmenu/client.lua'
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    '@es_extended/locale.lua',
    'server/server.lua',
    'config.lua',
--    'nmenu/server.lua',

  --  'christmas.lua'
} 

ui_page 'html/index.html'
files {
	'html/*.*', 
	'html/img/*.*',
    'html/img/icons/*.*',
    'html/img/itemImages/*.*',
    'html/fonts/*.*',
    'html/css/*.*',
    'html/js/*.*',
    'html/js/*.*.*',
    'html/fonts',
    'html/fonts/*.*',
    'html/fonts/.*.*',
    'html/fonts/*.*.*.*'
}