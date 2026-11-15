// Set the story screen, round, score, and message for a fresh run.
game_state = "title";
round_number = 1;
round_stars = 0;
total_stars = 0;
message = "";
message_timer = 0;
depth = 1000;

// Create Sam and place the first round's stars and hazards.
var _floor_y = room_height - 64;
instance_create_layer(48, _floor_y - 24, "Instances", obj_bounce_player);
instance_create_layer(300, _floor_y - 54, "Instances", obj_bounce_pickup);
instance_create_layer(520, _floor_y - 54, "Instances", obj_bounce_pickup);
instance_create_layer(250, _floor_y - 24, "Instances", obj_bounce_hazard);
