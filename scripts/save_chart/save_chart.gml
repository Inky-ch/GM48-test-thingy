/// scr_save_chart
function save_chart() {
    var json = json_stringify(chart);

    // create a fixed buffer big enough for the string
    var buf = buffer_create(string_length(json) + 1, buffer_fixed, 1);

    // write JSON string into the buffer
    buffer_write(buf, buffer_string, json);

    // save buffer to file
    buffer_save(buf, "chart.json");

    // delete buffer
    buffer_delete(buf);
}