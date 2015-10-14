download ogmo

create new project

adjust settings to fit game/tileset (img)

create a layer (set layer)
 make type "Tiles"
 set grid to 32
make entity

first tile must be blank or debug.

add new tileset (img)
 create
 (rename)
 select tileset graphic
 adjust tile size
 
 add new entity "player"
 
apply (img)

-draw level-

level > save level

level1.lvl

must be export mode "csv"

--------------

<assets path="assets/levels" rename="levels" include="*.oel" />

new function loadlevel()

create tilemap (same dimensions as ogmo level, same tile width/height)

add Tiles with loadfromString

add Entities with iterator


#Whats missing#

make entities and import them

add values to entities and levels and read them

multiple tile layers etc

collisions!

camera