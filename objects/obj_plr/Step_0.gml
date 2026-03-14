//Input
if keyboard_check_pressed(vk_up)
{
move("up");
}

if keyboard_check_pressed(vk_down)
{
move("down");
}

if keyboard_check_pressed(vk_left)
{
move("left");
}

if keyboard_check_pressed(vk_right)
{
move("right");
}

//"Slide" movement
if moving
{
var dist = point_distance(x, y, target_x, target_y);
if dist > move_speed
{
x += (target_x - x) / dist * move_speed;
y += (target_y - y) / dist * move_speed;
} else {
x = target_x;
y = target_y;
moving = false;
}
}
