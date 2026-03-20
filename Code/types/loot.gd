class_name Loot
extends Resource

## The name of the item
@export var name: String
## The description of the item
@export var description: String
## The "frequency" of the item. How many are there out of the "population" of all items.
@export var frequency: int
## The source image of the item
@export var icon: Texture2D
## The script that is applied to the item in the world.
@export var item_script: Script
@export var cost: int

var sum_frequency: int
var rating: String
