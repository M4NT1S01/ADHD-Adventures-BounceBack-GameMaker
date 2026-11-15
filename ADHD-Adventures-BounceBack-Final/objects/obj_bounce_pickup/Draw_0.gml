// Draw a gold pixel star marker.
draw_set_color(make_color_rgb(255, 210, 72));
draw_rectangle(x - 9, y - 3, x + 9, y + 3, false);
draw_rectangle(x - 3, y - 9, x + 3, y + 9, false);
draw_set_color(c_white);
draw_rectangle(x - 2, y - 2, x + 2, y + 2, false);
