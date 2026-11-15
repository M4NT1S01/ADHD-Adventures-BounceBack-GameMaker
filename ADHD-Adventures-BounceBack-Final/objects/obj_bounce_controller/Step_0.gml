// Start the activity from its short story screen with Space.
if (game_state == "title") {
    if (keyboard_check_pressed(vk_space)) game_state = "play";
    exit;
}

// Return to the island map from the finished story screen with Space.
if (game_state == "win") {
    if (keyboard_check_pressed(vk_space)) room_restart();
    exit;
}

// Keep any brief encouragement message visible for a moment.
if (message_timer > 0) message_timer -= 1;
if (message_timer <= 0) message = "";

// Advance when the player reaches the finish after collecting both stars.
var _player = instance_find(obj_bounce_player, 0);
if (_player == noone) exit;
if (_player.x >= room_width - 30) {
    if (round_stars < 2) {
        _player.x = room_width - 32;
        message = "Collect both focus stars to advance!";
        message_timer = 90;
    } else if (round_number >= 3) {
        game_state = "win";
    } else {
        round_number += 1;
        round_stars = 0;
        _player.x = 48;
        _player.y = room_height - 88;
        _player.checkpoint_x = 48;
        _player.checkpoint_y = room_height - 88;
        _player.vspeed = 0;

        // Clear the previous round's objects before placing the harder round.
        with (obj_bounce_hazard) instance_destroy();
        with (obj_bounce_pickup) instance_destroy();

        // Add more hazards and move the stars for the next round.
        var _floor_y = room_height - 64;
        if (round_number == 2) {
            instance_create_layer(235, _floor_y - 24, "Instances", obj_bounce_hazard);
            instance_create_layer(365, _floor_y - 24, "Instances", obj_bounce_hazard);
            instance_create_layer(180, _floor_y - 54, "Instances", obj_bounce_pickup);
            instance_create_layer(500, _floor_y - 54, "Instances", obj_bounce_pickup);
        } else {
            instance_create_layer(210, _floor_y - 24, "Instances", obj_bounce_hazard);
            instance_create_layer(330, _floor_y - 24, "Instances", obj_bounce_hazard);
            instance_create_layer(525, _floor_y - 24, "Instances", obj_bounce_hazard);
            instance_create_layer(265, _floor_y - 54, "Instances", obj_bounce_pickup);
            instance_create_layer(450, _floor_y - 54, "Instances", obj_bounce_pickup);
        }
        message = "Round " + string(round_number) + " — you can do this!";
        message_timer = 100;
    }
}


