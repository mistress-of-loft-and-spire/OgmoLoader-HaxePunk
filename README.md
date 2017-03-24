# Loading Ogmo levels in HaxePunk

This is a detailed guide on the basic usage of Ogmo Editor for making game levels and then loading those in HaxePunk so you can use them in your game!

What this tutorial covers:


* [Creating a new Ogmo project and all the different project settings](#creating-a-new-ogmo-project)

* [Drawing the level, saving it and the `.oel` format](#creating-a-level)

* [Making your game load the Ogmo level and add all the entities](#loading-the-level)

* [Using a grid for collision detection](#grids-and-collision)


## Getting ready for making cool levels!

* Now the first thing we will need is of course Ogmo, so head on over to http://www.ogmoeditor.com/ and click on Download!

* Secondly you will need to have a tileset for your level, we'll just use this one for the tutorial:

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

* On the `Layers` tab you can add new Layers used for drawing tiles and grids and for adding entities. For this project we will use one layer for the tilemap and one for our entities (the player).

* Create a new layer called `TileLayer` and change it's `Type` to `Tiles`.

* Make sure the `Grid` settings match those of your tileset (32x32 in this case), also the `Export Mode` should be `CSV`:

 ![ogmo2](https://cloud.githubusercontent.com/assets/2915643/10489154/221fce72-729c-11e5-9e37-ae62732d8b4a.png)
 
* Now create the `EntityLayer` and set it's `Type` to `Entities`. Again set the `Grid` settings to 32x32.

#### IV

* Now that you have a tileset layer you'll need to add the tileset graphic on the `Tilesets` tab.

* Create a new tileset, let's just call it `Tile`.

* Select your tileset via `Image File` (We'll use the one I showed you earlier) and make sure `Tile Size` is again at 32x32:

 ![ogmo3](https://cloud.githubusercontent.com/assets/2915643/10489155/2224cbe8-729c-11e5-92a9-9a9d00095708.png)

#### V

* Over on the `Entities` tab we'll add our player entity so we can place it in our level:

 ![ogmo4](https://cloud.githubusercontent.com/assets/2915643/10489156/222be0cc-729c-11e5-9431-98fae789ce8f.png)
 
* Just make a new entity and call it `Player`. Again change it's `Size`.

* You can also change the `Limit` to `1`, this way there will be maximum of one player entity in your level.

* You could also give your entity a graphic or add `Values` that we could load later on in the game, but for now we'll keep it simple.

#### VI

* Click `Apply` and Ogmo will create your project and also open up a new level ready for drawing!

## Creating a level

#### I

* In this window you can see the different layers we just created over on the top left, your tileset in the bottom left and various tools for drawing the level on the right:

 ![ogmo5](https://cloud.githubusercontent.com/assets/2915643/10489157/222dac22-729c-11e5-8be2-0e6ea6ba75f2.png)
 
* Now create your level! Select the `TileLayer` in the top left, then select a tile you want to draw with by clicking on it in your `Tile Palette` view and you can start drawing your level!

* There are also useful tools for flood filling areas, drawing lines, squares and more, but you'll figure it out!

#### II

* Once you're done, switch to the `EntityLayer` and place your `Player` somewhere in the level:

 ![ogmo6](https://cloud.githubusercontent.com/assets/2915643/10489158/223133ec-729c-11e5-9957-340a5803ed58.png)
 
#### III

* Now save the level! Click `Level → Save Level`.

* We'll put our levels in a new folder in our game directory under `assets/levels/`. Save the new level there as `level1.oel`. If you open the file with a texteditor it will look something like this:

 ````
<level width="640" height="480">
<TileLayer tileset="Tile" exportMode="CSV">
3,3,6,4,4,4,4,4,4,3,3,0,1,1,1,2,1,6,3,4
3,3,15,4,4,4,4,4,4,3,3,1,1,4,4,4,4,15,3,4
3,3,15,3,3,3,3,3,3,3,3,1,2,4,4,4,4,15,3,4
3,3,15,3,3,3,3,3,3,3,3,2,0,4,4,4,4,15,3,4
3,3,15,15,15,15,15,15,15,15,15,15,15,4,4,4,4,15,3,4
3,3,6,3,3,3,3,8,3,8,3,1,2,4,4,4,4,6,3,4
3,3,6,3,3,3,3,3,8,3,8,1,1,4,4,4,4,6,3,4
3,3,6,2,1,0,1,1,1,1,2,1,1,1,1,0,1,6,3,4
3,3,6,1,1,1,2,1,14,1,1,1,0,1,2,1,1,6,3,4
3,3,15,3,3,4,4,4,4,1,2,3,3,4,4,4,4,15,3,4
3,3,15,3,3,4,4,4,4,1,0,3,3,4,4,4,4,15,3,4
3,3,15,4,4,4,4,8,3,1,1,4,4,4,4,8,3,15,3,4
3,3,15,4,4,4,4,3,8,1,1,4,4,4,4,3,8,15,3,4
3,3,15,6,6,6,6,6,6,4,4,6,6,6,6,6,6,15,3,4
3,3,15,3,3,3,3,3,6,4,4,6,3,3,3,3,3,15,3,4
</TileLayer>
 <EntityLayer>
  <Player id="0" x="288" y="320" />
 </EntityLayer>
</level>
````

* You can see that it's basicly an `.xml` file! On the top we have our level information (width and height). Below that all the numbers are our `TileLayer` that we've drawn, where each number represents the tileset id at that position. And at the bottom we have the `EntityLayer` with our `Player`.

## Loading the level

#### I

* First things first! For your HaxePunk game to actually recognize the level files you first need to add the path to your `project.xml`, so let's open it up with our text editor!

* Somewhere in there (preferably where it says `assets`) add this line:

 ````
<assets path="assets/levels" rename="levels" include="*.oel" />
````

* This tells your game to include all the `.oel` files during compile, like our `level1.oel` for example!

#### II

* You'll need to make some adjustments to your scene class, where you want your level to be loaded. This is how your barebones main `Scene` class should look:

 ````
class MainScene extends Scene
{
	
	//helper vars for loading .oel level
	private var xml:Xml;
	private var fastXml:Fast;
	
	override public function begin()
	{
	 	//when this scene is loaded -> load level file
		loadlevel("levels/level1.oel");
	}
	
	public function loadlevel(level:String):Void 
	{
		//level loading code will go here!
	}
	
}
````

* We add some helpful vars on the top for our tilemap and also for loading the xml data of the level files.

* Then when our `MainScene` is started we call the function `loadlevel()` and point it to the correct level file.

#### III

* Now inside your new `loadlevel()` function add the following code:

 ````
//get the XML
xml = Xml.parse(Assets.getText(level));
fastXml = new haxe.xml.Fast(xml.firstElement());
````

* To read our `.oel` file into the game we just do some magic with the XML classes of Haxe. This makes it much easier for us to access all the important stuff!

#### IV

* Below that add this code:

 ````
//create new Tilemap and add it to the Scene
var tilemap:Tilemap = new Tilemap("graphics/tileset.png", Std.parseInt(fastXml.att.width), Std.parseInt(fastXml.att.height), 32, 32);
add(new Entity(0, 0, tilemap));

//add Tiles
tilemap.loadFromString(fastXml.node.TileLayer.innerData, ",", "\n");
````

* The first part will create our new tilemap with the appropriate tileset graphic and also with the correct dimensions! `fastXml.att.width` reads the `width` attribute from our `.oel` level, and `fastXml.att.height` the height attribute respectively.

* The last line now reads all the tile data via `fastXml.node.TileLayer.innerData`. Note that we are accessing the `TileLayer` here! If you have a look at our `.oel` file again you remember that our tile data is a long string representing our individual tiles, so we can load them with the handy `.loadFromString()` function of HaxePunk! `,` and `\n` (line break) are used as seperators in the string.

* If you quickly test your game now, you will see that our level will now load and display!

#### V

* Now finally add these lines to also load our player:

 ````
//add Entities to the Scene
for (p in fastXml.node.EntityLayer.nodes.Player)
{
	add(new Player(Std.parseInt(p.att.x), Std.parseInt(p.att.y)));
}
 ````

* What this does is search through the `EntityLayer` looking for `Player` entities and if it finds one add it to the scene at the appropriate `x` and `y` position!

 *Note: Of course I've prepared a `Player.hx` class already in my game, if you don't have one yet you'll need to make one and make it take `x` and `y` parameters. Check out the example folder for my player class.*

 *Another note: Just like we iterated through all the `Player` entities here you can also do the same for all other entity types that you have in your Ogmo level, like other characters or objects.*

#### VI

* Now compile your game! As you can see the level is loaded and your player is also added to the scene:

 ![ogmo7](https://cloud.githubusercontent.com/assets/2915643/10489159/22386d56-729c-11e5-8e68-071a210aeab9.png)

*  And that's it! :D


## Grids and collision!

#### I

* You can use grids in your level for collision detection so our player can't walk all over the walls!

* To do that first let's go back to our Ogmo project settings and add a `Grid` layer with these settings:

	![ogmo8](https://cloud.githubusercontent.com/assets/2915643/10497806/43532568-72c8-11e5-8ee4-d8c578a1637a.png)

* As you can see, when you open up `level1.oel` again, there now is a new grid layer. Select it and you can draw collision tiles on it that your player should not be able to pass. Let's add collision to our level walls and maybe also the sign post:

	![ogmo9](https://cloud.githubusercontent.com/assets/2915643/10498866/6ccb93f8-72cd-11e5-9ac1-04f00a383b94.png)

#### II

* Now save the level and back inside our scene, add the following lines of code at the end of the `loadlevel()` function:

	````
//load collision grid and add it to Scene
var grid:Grid = new Grid(Std.parseInt(fastXml.att.width), Std.parseInt(fastXml.att.height), 32, 32);
grid.loadFromString(fastXml.node.Grid.innerData, "", "\n");
addMask(grid, "solid");
````

* The first line creates a new `Grid` mask and sets it's `width` and `height` just like with the tilemap. Then we have to read the `Grid` data using `loadFromString()` again. And lastly we add our grid as a new mask to the scene, also we set the collision type to `solid`!

#### III

* Lastly we'll need to adjust our `Player.hx` to recognize collisions.

* Make sure that somewhere in your `Player` class you set its hitbox via `setHitbox(32,32)`.

* And then you can check for collisions either via `moveBy(speed_x, speed_y, "solid");` or with an if-condition using `if(collide("solid", x, y))`. Just make sure you check for the type `solid`.

#### IV

* When we now test our game, the player will stop in front of walls and if you open up the console you can see the collision masks:

	![ogmo10](https://cloud.githubusercontent.com/assets/2915643/10498867/6cd81c18-72cd-11e5-801b-104c06c0e6c1.png)

* Awesome!


## What's missing

Thanks for reading this guide! I hope it was helpful! Here are a few things that I haven't covered:

* Adding values to entities and levels and reading them 

* Using multiple tile layers

* Camera stuff

I might expand on this later on, or maybe even write a follow up, until then pull requests are very welcome!
If you have any further questions or suggestions let me know. :)

Also check out these links for more useful infos:

* FlashPunk guide for Ogmo (if you remember to adjust the syntax to Haxe you can mostly follow this as well): https://www.youtube.com/playlist?list=PL68WtdRH6G0lRChjCq1E0R5k3ptYFuKeo

* Useful article about the XML format and using it in Haxe and also what Fast is all about:
http://haxecoder.com/post.php?id=23

* And if you want to use animated tiles in your game, have a look at my AnimatedTilemap class: https://github.com/voec/punk.AnimatedTilemap


## nonlicense
```
This work is dedicated to the public domain under CC0. https://creativecommons.org/publicdomain/zero/1.0/  
All code of this project is licensed under the Unlicense. http://unlicense.org/UNLICENSE
 
You are free to use any of my code, art, writing, data, etc. in any way you like.  
A credit acknowledgment is appreciated but not necessary.
I'd love to hear from you if you use_remix any of this work: banach-tarski 📧 posteo.net
 
This dedication excludes any work not created by me, which is copyrighted to their respective creators. Including:
* The Pokémon tileset
```
