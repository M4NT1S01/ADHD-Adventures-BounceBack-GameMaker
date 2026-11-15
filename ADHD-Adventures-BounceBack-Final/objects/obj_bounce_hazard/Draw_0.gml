// Draw a bright pixel hazard that is easy to spot.
draw_set_color(make_color_rgb(224, 70, 78));
draw_rectangle(x - 14, y - 12, x + 14, y + 12, false);
draw_set_color(make_color_rgb(255, 205, 110));
draw_rectangle(x - 8, y - 6, x + 8, y - 2, false);
