// o_menu Draw Event

draw_set_font(ft_menu);
draw_set_halign(fa_center);

for (var i = 0; i < array_length(global.menu[global.sub_menu]); ++i) {
    var text;
    if (is_array(global.menu[global.sub_menu][i])) {
        var _menu_arr = global.menu[global.sub_menu][i];
        var _map_arr = SET[? _menu_arr[1]];
        var _limit_arr = _map_arr[1];
	
		show_debug_message(_map_arr);
        if (is_array(_limit_arr[0])) {
            if (_map_arr[0] >= 0 && _map_arr[0] < array_length(_limit_arr)) {
                text = _menu_arr[0] + string(_limit_arr[_map_arr[0]]);
            }
        } else {
            text = _menu_arr[0] + string(_map_arr[0]);
        }
    } else {
        text = global.menu[global.sub_menu][i];
    }

    draw_menu_option(i, text);
}

if (global.show_confirm_popup) {
    draw_confirm_popup();
}
