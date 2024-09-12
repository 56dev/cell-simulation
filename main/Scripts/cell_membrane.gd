extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	var len = get_child_count()
	
	
	var child_ind = 0
	
	for child in get_children():
		var adjacent
		
		if child_ind == len - 1:
			adjacent = get_child(0)
		else:
			adjacent = get_child(child_ind + 1)
		
		var springjoint = DampedSpringJoint2D.new()
		
		#set the joint's properties here.
		springjoint.rest_length = 0
		springjoint.length = 1
		springjoint.stiffness = 100
		
		child.add_child(springjoint)
		springjoint.position = Vector2.ZERO;
		springjoint.node_a = springjoint.get_node("..").get_path()
		springjoint.node_b = springjoint.get_path_to(adjacent)
		
		
		var new_center_springjoint = DampedSpringJoint2D.new()
		
		new_center_springjoint.rest_length = 100
		new_center_springjoint.length = 100
		new_center_springjoint.stiffness = 100
		
		self.add_child(new_center_springjoint)
		new_center_springjoint.position = Vector2.ZERO
		new_center_springjoint.node_a = springjoint.get_path_to(self)
		new_center_springjoint.node_b = springjoint.get_path_to(child)
		child_ind += 1
	
	
	
	pass # Replace with function body.


