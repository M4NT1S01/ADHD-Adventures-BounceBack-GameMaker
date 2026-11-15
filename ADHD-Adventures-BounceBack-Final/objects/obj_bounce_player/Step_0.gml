// Get the activity controller and stop movement on story screens.
var _controller = instance_find(obj_bounce_controller, 0);
if (_controller == noone) exit;
if (_controller.game_state != "play") exit;

// Move left and right, keeping the player inside the court walls.
var _move = keyboard_check(vk_right) - keyboard_check(vk_left);
x += _move * move_speed;
x = clamp(x, 24, room_width - 24);

// Apply gravity, land on the court floor, and jump with Space.
var _floor_y = room_height - 64;
var _ground_center = _floor_y - 24;
vspeed += 0.45;
y += vspeed;
if (y >= _ground_center) {
    y = _ground_center;
    vspeed = 0;
    if (keyboard_check_pressed(vk_space)) vspeed = jump_speed;
}

// Bounce from the two spring pads and save the latest pad as a checkpoint.
if (pad_cooldown > 0) pad_cooldown -= 1;
if (vspeed == 0 && pad_cooldown <= 0) {
    if (abs(x - 165) < 18 || abs(x - 430) < 18) {
        checkpoint_x = x;
        checkpoint_y = _ground_center;
        vspeed = -10;
        pad_cooldown = 24;
        bounce_message = "Spring pad! New checkpoint!";
        bounce_message_timer = 75;
    }
}

// Return to the latest checkpoint after touching a hazard.
if (place_meeting(x, y, obj_bounce_hazard)) {
    x = checkpoint_x;
    y = checkpoint_y;
    vspeed = -6;
    pad_cooldown = 24;
    bounce_message = "You bounced back!";
    bounce_message_timer = 90;
}

// Collect a focus star and add it to this round's count.
var _star = instance_place(x, y, obj_bounce_pickup);
if (_star != noone) {
    with (_star) instance_destroy();
    _controller.round_stars += 1;
    _controller.total_stars += 1;
    bounce_message = "Focus star collected!";
    bounce_message_timer = 55;
}

// Keep the short encouragement message on screen for a moment.
if (bounce_message_timer > 0) bounce_message_timer -= 1;
