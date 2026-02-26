/// obj_controller Step Event

// Update song time
if (recording || playing) {
    song_time += delta_time / 1000000; // delta_time in microseconds → seconds
}

// ====================
// RECORD MODE
// ====================
if (recording) {
    for (var i = 0; i < lane_count; i++) {
        if (keyboard_check_pressed(keys[i])) {
            var note_data = {
                time: song_time,
                lane: i
            };
            array_push(chart, note_data);
        }
    }
}

// ====================
// PLAYBACK MODE: spawn notes
// ====================
if (playing) {
    while (chart_index < array_length(chart) 
           && chart[chart_index].time - travel_time <= song_time) {
        
        var lane = chart[chart_index].lane;
        var note_x = lane_start_xs[lane] + (lane_width - note_width)/2;

        var note = instance_create_depth(note_x, spawn_y, -100, obj_base_note);
        note.lane = lane;
        note.hit_time = chart[chart_index].time;

        chart_index++;
    }
}

// ====================
// HIT DETECTION
// ====================
for (var i = 0; i < lane_count; i++) {
    if (keyboard_check_pressed(keys[i])) {
        var best_note = noone;
        var best_diff = 999;

        // iterate safely over all obj_base_note instances
        var note_count = instance_number(obj_base_note);
        for (var j = 0; j < note_count; j++) {
            var n = instance_find(obj_base_note, j); // n = current note
            if (n.lane == i) { // safe: n.lane exists
                var diff = abs(n.hit_time - song_time);
                if (diff < best_diff) {
                    best_diff = diff;
                    best_note = n;
                }
            }
        }

        if (best_note != noone) {
            instance_destroy(best_note);
            show_debug_message("Hit lane " + string(i));
        }
    }
}
// ====================
// MODE SWITCH CONTROLS
// ====================

// Start Recording
if (keyboard_check_pressed(ord("R"))) {
    chart = [];
    song_time = 0;
    chart_index = 0;
    recording = true;
    playing = false;
    show_debug_message("RECORDING STARTED");
}

// Stop Recording + Save
if (keyboard_check_pressed(ord("T"))) {
    recording = false;
    save_chart(); // use scr_save_chart
    show_debug_message("CHART SAVED");
}

// Load + Play
if (keyboard_check_pressed(ord("P"))) {
    load_chart(); // use scr_load_chart
    song_time = 0;
    chart_index = 0;
    playing = true;
    recording = false;
    show_debug_message("PLAYBACK STARTED");
}