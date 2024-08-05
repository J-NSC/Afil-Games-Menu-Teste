function draw_menu_option(index, text) {
    var option_y = MENU_Y + GAP * index;
    var text_width = string_width(text);

    draw_set_color(c_red);
    draw_rectangle(MENU_X - text_width / 2, option_y - GAP / 2 + OFFSET, MENU_X + text_width / 2, option_y + GAP / 2 + OFFSET, false);

    draw_set_color(c_white);
    if (index == global.index) {
        draw_set_color(c_yellow);
    }
    draw_text(MENU_X, option_y, text);
}

function is_mouse_in_area(x1, y1, x2, y2) {
    return mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2;
}

function handle_menu_click() {
    for (var i = 0; i < array_length(global.menu[global.sub_menu]); ++i) {
        var option_y = MENU_Y + GAP * i;
        var text_width = string_width(global.menu[global.sub_menu][i]);

        if (is_mouse_in_area(MENU_X - text_width / 2, option_y - GAP / 2 + OFFSET, MENU_X + text_width / 2, option_y + GAP / 2 + OFFSET)) {
            if (global.index == i) {
                handle_menu_select();
            } else {
                global.index = i;
            }
        }
    }
}

function handle_menu_select() {
    switch (global.sub_menu) {
        case MAIN:
            switch (global.index) {
                case 0:
                    global.sub_menu = GAMEPLAY;
                    room_goto(rm_gameplay);
                    global.index = 0;
                    break;
                case 1:
                    global.sub_menu = SETTINGS;
                    global.index = 0;
                    break;
                case 2:
                    global.show_confirm_popup = true;
                    global.confirm_index = 0;
                    break;
            }
            break;
        case SETTINGS:
            var right = keyboard_check(vk_right);
            var left = keyboard_check(vk_left);
            switch (global.index) {
                case 0:
                    change_menu_value("volume", right, left);
                    break;
                case 1:
                    change_menu_value("modo", right, left);
                    break;
                case 2:
                    global.sub_menu = MAIN;
                    global.index = 1;
                    break;
            }
            break;
        case GAMEPLAY:
            switch (global.index) {
                case 0:
                    room_goto_previous();
                    global.sub_menu = MAIN;
                    global.index = 0;
                    break;
            }
            break;
    }
}


function change_menu_value(key, right, left) {
    var _map_arr = SET[? key];
    var _limit_arr = _map_arr[1];

    var _min;
    var _max;

 if (is_real(_limit_arr[0])) {
        var _min = _limit_arr[0];
        var _max = _limit_arr[1];
    } else {
        var _min = 0;
        var _max = array_length(_limit_arr) - 1;
    }

    _map_arr[@ 0] = clamp(_map_arr[0] + (right - left),_min, _max);

    if (key == "volume") {
        audio_master_gain(_map_arr[0] / _max);
    } else if (key == "modo") {
        window_set_fullscreen(_map_arr[0] == 0);
    }
	
	save_settings();
}



function draw_confirm_popup() {
    draw_set_color(c_black);
    draw_rectangle_color(room_width / 2 - 120, room_height / 2 - 60, room_width / 2 + 120, room_height / 2 + 60, c_black, c_black, c_black, c_black, false);

    draw_set_color(c_white);
    draw_text(room_width / 2, room_height / 2 - 30, "Você deseja sair?");

    for (var i = 0; i < array_length(global.confirm_options); i++) {
        draw_set_color(c_white);
        if (global.confirm_index == i) {
            draw_set_color(c_yellow);
        }
        var option_x = room_width / 2 - 50 + (i * 100);
        draw_text(option_x, room_height / 2, global.confirm_options[i]);
    }
}
