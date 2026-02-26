/// scr_load_chart
function load_chart() {
    if (file_exists("chart.json")) {
        var buf = buffer_load("chart.json");
        var json = buffer_read(buf, buffer_string);
        buffer_delete(buf);

        chart = json_parse(json);
    }
}