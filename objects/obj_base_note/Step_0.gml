var controller = obj_controller;

// Time until hit
var time_until_hit = hit_time - controller.song_time;

// Position based on time
y = controller.hit_y - (time_until_hit * controller.note_speed);

// Destroy if missed
if (y > controller.despawn_y) {
    instance_destroy();
}