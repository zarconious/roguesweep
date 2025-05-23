// Inherit the parent event
event_inherited();


if(objRun.current_event == "shop")
{
	description = "Next combat";
	image_index = 1;
}
else
{
	description = "Refresh (x" + string(objRun.resets) + ")";
	image_index = 0;
}
