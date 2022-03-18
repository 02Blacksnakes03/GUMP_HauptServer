resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_script {
  "@mysql-async/lib/MySQL.lua",
  '@es_extended/locale.lua',
  "server/server.lua"
}

client_script {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/de.lua',
  "client/client.lua",
  "client/animation.lua",
  "client/photo.lua"
}

ui_page "html/index.html"

files {
	'html/index.html',
  'html/favicon.ico',
  -- javascript
	'html/js/*.js',
  -- style
  'html/css/*.css',
  -- fonts
  'html/fonts/*.ttf',
  -- images
	'html/img/*.png',
  'html/img/*.jpg',
  'html/img/*.svg',

}