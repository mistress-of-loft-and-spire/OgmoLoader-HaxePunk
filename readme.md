# Loading Ogmo levels in HaxePunk.

This is a short guide on the basic usage of Ogmo Editor for making game levels and then loading those in HaxePunk so you can use them in your game!


## Getting ready for making cool levels!

* Now the first thing you will need is of course Ogmo, so head on over to http://www.ogmoeditor.com/ and click on Download!

* Secondly you will need to have a tileset for your level, I'll just use this one:

 ![tileset](https://raw.githubusercontent.com/voec/OgmoLoader-HaxePunk/master/example/assets/graphics/tileset.png)

 (Each tile is 32x32 pixels)
 
 *Note: The first tile in your tileset will be the default background, most of the time it is best to keep it blank or even transparent if you want a transparent background!*
 

## Creating a new Ogmo Project

#### I

* Once you've downloaded and installed Ogmo Editor click on `Project → New Project`

#### II

* Here you can set up your project settings. On the first page we can leave mostly everything at the default for now, give your project a name and make sure the `Level Size` is set to the correct dimensions as you want your level to be:

 ![ogmo1](https://cloud.githubusercontent.com/assets/2915643/10489153/2219c75c-729c-11e5-9da8-6dd472901048.png)

#### III

* On the `Layers` tab you can add new Layers used for drawing tiles and grids and for adding entities. For this project I will use **one layer for the tilemap and one for my entities** (the player).

* Create a new layer called `TileLayer` and change it's `Type` to `Tiles`.

* Make sure the `Grid` settings match those of your tileset (32x32 in this case), also the `Export Mode` should be `CSV`:

 ![ogmo2](https://cloud.githubusercontent.com/assets/2915643/10489154/221fce72-729c-11e5-9e37-ae62732d8b4a.png)
 
* Now create the `EntityLayer` and set it's `Type` to `Entities`. Again set the `Grid` settings to 32x32.

#### IV

* Now that you have a tileset layer you'll need to add the tileset graphic on the `Tilesets` tab.

* Create a new tileset, I'll just call mine `Tile`.

* Select your tileset via `Image File` (I'll use the one I showed you earlier) and make sure `Tile Size` is again at 32x32:

 ![ogmo3](https://cloud.githubusercontent.com/assets/2915643/10489155/2224cbe8-729c-11e5-92a9-9a9d00095708.png)

#### V

* Over on the `Entities` tab I'll add my player entity so I can place it in my level:

 ![ogmo4](https://cloud.githubusercontent.com/assets/2915643/10489156/222be0cc-729c-11e5-9431-98fae789ce8f.png)
 
* Just make a new entity and call it `Player`. Again change it's `Size`.

* You can also change the `Limit` to `1`, this way there will be max one player entity in your level.

* You could also give your entity a graphic or add `Values` that we could load later one in the game, but for now we'll keep it simple.

#### VI

* Click `Apply` and Ogmo will create your project and also open up a new level ready for drawing!

## Creating a level

#### I

* In this window you can see the different layers you just created over on the top left, your tileset in the bottom left and various tools for drawing the level on the right:

 ![ogmo5](https://cloud.githubusercontent.com/assets/2915643/10489157/222dac22-729c-11e5-8be2-0e6ea6ba75f2.png)
 
* Now create your level! Select the `TileLayer` in the top left, then select a tile you want to draw with by clicking on it in your `Tile Palette` view and you can start drawing your level!

* There are also useful tools for flood filling areas, drawing lines, squares and more, but you'll figure it out!

#### II

* Once you're done, switch to the `EntityLayer` and place your `Player` somewhere in the level:

 ![ogmo6](https://cloud.githubusercontent.com/assets/2915643/10489158/223133ec-729c-11e5-9957-340a5803ed58.png)
 
#### III

* Now save the level! Click `Level → Save Level`.

* I'll put my levels in a new folder in my game directory under `assets/levels/`. Safe the new level there as `level1.oel`.

## Loading the level

#### I

* First things first! For your HaxePunk game to actually recognize the new level files you'll firstly need to add the path to your `project.xml`. Open it up with a text editor!

* Somewhere in there (preferably where it says `assets`) add this line:

````
<assets path="assets/levels" rename="levels" include="*.oel" />
````
--------------



new function loadlevel()

create tilemap (same dimensions as ogmo level, same tile width/height)

add Tiles with loadfromString

add Entities with iterator

 ![ogmo7](https://cloud.githubusercontent.com/assets/2915643/10489159/22386d56-729c-11e5-8e68-071a210aeab9.png)


## What's missing

* Adding values to entities and levels and reading them 

* Using multiple tile layers

* Grids and collisions!

* Camera stuff

Also check out these links for more useful infos:

* FlashPunk guide for Ogmo (if you remember to adjust the syntax to Haxe you can mostly follow this as well): https://www.youtube.com/playlist?list=PL68WtdRH6G0lRChjCq1E0R5k3ptYFuKeo

* Useful article about the XML format and using it in Haxe and also what Fast is all about:
http://haxecoder.com/post.php?id=23
