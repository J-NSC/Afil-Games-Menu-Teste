draw_set_font(ft_menu);
draw_set_halign(fa_center);
var _gap = 40;

for (var i = 0; i < array_length(global.menu[global.sub_menu]); ++i) {
    draw_set_color(c_white);
    
    if (i == global.index) {
        draw_set_color(c_yellow);
    }

    if (is_array(global.menu[global.sub_menu][i])) {
        var _menu_arr = global.menu[global.sub_menu][i];
        var _map_arr = SET[? _menu_arr[1]];
        var _limit_arr = _map_arr[1];
        
        if (is_real(_limit_arr[0])) {
            var _str = _menu_arr[0] + string(_map_arr[0]);
        } else {
            var _str = _menu_arr[0] + _limit_arr[_map_arr[0]];
        }
    } else {
        var _str = global.menu[global.sub_menu][i];
    }

    draw_text(room_width / 2, room_height * .4 + _gap * i, _str);
}

if (global.show_confirm_popup) {
	draw_confirm_popup()
}

draw_set_font(-1);