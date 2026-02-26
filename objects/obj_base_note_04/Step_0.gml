if keyboard_check_pressed(ord("4")) && !moving_down {
var note_clone = instance_create_depth(x, y, -100, obj_base_note_04);
note_clone.moving_down = true;
}
if moving_down {
var next_y = y + 1;
if next_y <= 190 && !place_meeting(x, next_y, obj_note_kill) {
y = next_y;
} else {
moving_down = false;
instance_destroy();
}
}
if place_meeting(x, y, obj_note_line) && keyboard_check_pressed(ord("K"))
{
instance_destroy();
}