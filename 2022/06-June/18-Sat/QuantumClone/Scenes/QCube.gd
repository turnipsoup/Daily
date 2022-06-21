extends StaticBody


var is_seen = false
var has_been_seen = false

var max_teleport_distance = 32

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	teleport()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	# The the player can see me
	if $VisibilityNotifier.is_on_screen():
		is_seen = true
		has_been_seen = true
	
	else:
		is_seen = false

	
	if not is_seen and has_been_seen:
		teleport()


func teleport() -> void:

	# Get random new positions
	var rnd_x = rng.randi_range($Spawn.translation.x + max_teleport_distance, 
								$Spawn.translation.x - max_teleport_distance)

	var rnd_z = rng.randi_range($Spawn.translation.z + max_teleport_distance, 
								$Spawn.translation.z - max_teleport_distance)


	
	
	translation.x = rnd_x
	translation.z = rnd_z

	has_been_seen = false
	is_seen = false
