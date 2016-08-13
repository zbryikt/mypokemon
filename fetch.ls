require! <[fs request path]>
list = JSON.parse(fs.read-file-sync \pokemons.json .toString!).pokemon.map -> it.img

fetch = (url) ->
  name = path.basename(url)
  request url .pipe fs.createWriteStream "img/#name"
  #request do
  #  url: url, method
list.map -> fetch it

