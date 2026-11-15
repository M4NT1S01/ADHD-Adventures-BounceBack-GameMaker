// Draw the one-screen court, visible edge walls, finish marker, and bounce pads.
draw_set_color(make_color_rgb(28, 42, 62));
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(make_color_rgb(70, 99, 122));
draw_rectangle(12, 12, room_width - 12, room_height - 12, true);
draw_set_color(make_color_rgb(65, 126, 112));
draw_rectangle(16, room_height - 64, room_width - 16, room_height - 16, false);
draw_set_color(make_color_rgb(235, 194, 115));
draw_rectangle(room_width - 28, 30, room_width - 22, room_height - 64, false);

// Draw the spring pads that launch the player and mark checkpoints.
draw_set_color(make_color_rgb(67, 207, 205));
draw_rectangle(148, room_height - 68, 182, room_height - 58, false);
draw_rectangle(413, room_height - 68, 447, room_height - 58, false);
draw_set_color(c_white);
draw_rectangle(154, room_height - 73, 176, room_height - 69, false);
draw_rectangle(419, room_height - 73, 441, room_height - 69, false);
