/// obj_controller Create Event

// Lane positions (top-left X)
lane_start_xs = [40, 52, 64, 76];
lane_width = 10;
note_width = 8;
lane_count = 4;

// Vertical
spawn_y = -16;
hit_y = 150;
despawn_y = 200;

// Note speed (pixels/sec for movement calculation)
note_speed = 50;

// Time for notes to reach hit line from spawn
travel_time = (hit_y - spawn_y)/note_speed;

// Chart data
chart = [];
chart_index = 0;

// Song timing
song_time = 0;

// Mode
recording = false;
playing = false;

// Key binds
keys = [ord("D"), ord("F"), ord("J"), ord("K")];