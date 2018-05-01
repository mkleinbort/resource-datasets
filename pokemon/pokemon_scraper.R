library(data.table)
library(plyr)
library(XML)
library(magrittr)
library(dplyr)
library(lubridate)
library(xml2)
library(RSelenium)

url = paste0('http://pokemondb.net/pokedex/all')

data = readHTMLTable(url, stringsAsFactors = FALSE)

pokedex = data[['pokedex']]
pokedex = data.table(pokedex)

setnames(pokedex, c('#', 'Sp. Atk', 'Sp. Def'), c('PokedexNumber', 'SpecialAttack', 'SpecialDefense'))

write.csv(pokedex, '~/github-repos/DSI-SF/datasets/pokemon/pokedex_basic.csv', row.names=F)