resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
    '@es_extended/locale.lua',
    'client/client.lua',
    'client/animation.lua',
--    'cshop/client.lua'
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    '@es_extended/locale.lua',
    'server/server.lua',
--    'cshop/server.lua'
}

ui_page 'html/index.html'
files {
	'html/*.*',
    'html/css/*.*',
    'html/js/*.*',
    'html/js/*.*.*',
    'html/img/*.*',
    'html/img/icons/*.*',
    'html/fonts/*.*',
    'html/fonts/.*.*',
    'html/img/clothing/*.*'
}
shared_script 'config.lua'