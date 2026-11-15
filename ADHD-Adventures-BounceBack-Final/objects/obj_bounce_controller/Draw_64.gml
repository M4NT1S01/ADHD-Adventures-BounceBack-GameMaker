// Draw a clean, text-only interface with no menu buttons.
display_set_gui_size(640, 360);
draw_set_font(fnt_default);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Show Sam's short story and the two simple controls before play.
if (game_state == "title") {
    draw_set_color(make_color_rgb(255, 218, 133));
    draw_text(320, 72, "ADHD ADVENTURES: BOUNCING BACK");
    draw_set_color(c_white);
    draw_text(320, 124, "Sam missed practice after a rough week.");
    draw_text(320, 152, "Now Sam is back to collect stars in three rounds.");
    draw_text(320, 180, "Bounce pads return Sam to the last checkpoint.");
    draw_text(320, 238, "Arrows move    Space jumps");
    draw_set_color(make_color_rgb(255, 218, 133));
    draw_text(320, 286, "Press Space");
    exit;
}

// Show only the round, score, and current encouragement during play.
if (game_state == "play") {
    draw_set_halign(fa_left);
    draw_text(24, 22, "Round " + string(round_number) + " / 3");
    draw_text(24, 44, "Stars " + string(total_stars));
    draw_set_halign(fa_center);
    var _player = instance_find(obj_bounce_player, 0);
    if (_player != noone && _player.bounce_message_timer > 0) {
        draw_set_color(make_color_rgb(255, 218, 133));
        draw_text(320, 48, _player.bounce_message);
    } else if (message_timer > 0) {
        draw_set_color(make_color_rgb(255, 218, 133));
        draw_text(320, 48, message);
    }
    exit;
}

// Finish Sam's story with a short, hopeful ending.
draw_set_color(make_color_rgb(255, 218, 133));
draw_text(320, 94, "YOU BOUNCED BACK!");
draw_set_color(c_white);
draw_text(320, 146, "Sam finished all three rounds and collected six focus stars.");
draw_text(320, 180, "Sam finishes practice, ready for the next small step.");
draw_set_color(make_color_rgb(255, 218, 133));
draw_text(320, 250, "Space to play again");

