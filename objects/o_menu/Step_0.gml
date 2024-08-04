var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _select = keyboard_check_pressed(vk_enter);
var _click = mouse_check_button_pressed(mb_left);
var mouse_x_pos = mouse_x;
var mouse_y_pos = mouse_y;

if (global.show_confirm_popup) {
    var _move = _right - _left;

    if (_move != 0) {
        global.confirm_index += _move;
        if (global.confirm_index < 0) global.confirm_index = array_length(global.confirm_options) - 1;
        if (global.confirm_index >= array_length(global.confirm_options)) global.confirm_index = 0;
    }

    if (_click) {
        for (var i = 0; i < array_length(global.confirm_options); i++) {
            var option_x = room_width / 2 - 50 + (i * 100);
            if (mouse_x_pos > option_x - 50 && mouse_x_pos < option_x + 50 &&
                mouse_y_pos > room_height / 2 - 10 && mouse_y_pos < room_height / 2 + 10) {
                global.confirm_index = i;
                if (global.confirm_index == 0) {
                    game_end();
                } else {
                    global.show_confirm_popup = false;
                }
            }
        }
    } else if (_select) {
        if (global.confirm_index == 0) {
            game_end();
        } else {
            global.show_confirm_popup = false;
        }
    }
} else {
    var _move = _down - _up;
    var _hmove = _right - _left;

    if (_move != 0) {
        global.index += _move;
        if (global.index < 0) {
            global.index = array_length(global.menu[global.sub_menu]) - 1;
        } else if (global.index >= array_length(global.menu[global.sub_menu])) {
            global.index = 0;
        }
    }

    if (_click) {
        handle_menu_click();
    }

    if (_select || (global.index < array_length(global.menu[global.sub_menu]) && is_array(global.menu[global.sub_menu][global.index]) && (_hmove != 0))) {
        handle_menu_select();
    }
}
