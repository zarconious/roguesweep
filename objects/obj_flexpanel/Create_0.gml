n_root = flexpanel_create_node(@'{
	"name":"root", "data":{}, "width":"100%", "height":"100%", "justifyContent":"flex-start", "alignItems":"center","padding":10,
	"nodes":[
		{
			"name":"enemies", "data":{}, "width":"80%", "height":"20%", "justifyContent":"center", "flexDirection":"row", "gap":10,
			"nodes":[],
		},
		{
			"name": "board", "data":{}, "width":"35%", "height":"60%", "justifyContent":"space-between", "alignItems":"center", "flexDirection":"column", "top":10,
			"nodes":[
				{
					"name": "tiles", "data":{}, "height":"80%", "aspectRatio":1, "justifyContent":"center", "alignItems":"center", "alignSelf":"auto"
				},
				{
					"name": "moves", "data":{}, "width":"90%", "height":"15%","alignSelf":"auto"
				}
			]
		},
		{
			"name": "left", "data":{}, "width":"25%", "positionType":"absolute", "justifyContent":"space-between", "flexDirection":"column", "height":"75%", "left":20, "bottom":10, "alignSelf":"auto",
			"nodes":[
				{
					"name": "badges", "data":{}, "width":"100%", "height":"30%", "alignSelf":"auto",
					"nodes":[]
				},
				{
					"name": "menu", "data":{}, "width":"100%", "height":"60%", "alignSelf":"auto",
					"nodes":[]
				},
			]
		},
		{
			"name": "right", "data":{}, "width":"25%", "positionType":"absolute", "justifyContent":"space-between", "flexDirection":"column", "height":"75%", "right":20, "bottom":10, "alignSelf":"auto",
			"nodes":[
				{
					"name": "mines", "data":{}, "width":"100%", "height":"60%", "alignSelf":"auto",
					"nodes":[]
				},
				{
					"name": "stats", "data":{}, "width":"100%", "height":"30%", "alignSelf":"auto",
					"nodes":[]
				},
			]
		}
	],
	"alignSelf":"auto"
}');

////// Calculate layout
flexpanel_calculate_layout(n_root, room_width, room_height, flexpanel_direction.LTR);

////// Generate object instances
generate_instance = function(_node, _depth)
{
	// Get layout data
	var _pos = flexpanel_node_layout_get_position(_node, false);
	var _name = flexpanel_node_get_name(_node);
	
	// Create instance
	instance_create_depth(_pos.left, _pos.top, _depth, obj_ui_element,
	{
		name: _name,
		width: _pos.width,
		height: _pos.height
	});
	
	// Call for children (recursive)
	var _children_count = flexpanel_node_get_num_children(_node);
	for (var i = 0; i < _children_count; i++)
	{
		var _child = flexpanel_node_get_child(_node, i);
		generate_instance(_child, _depth - 1);
	}
}

generate_instance(n_root, 0);