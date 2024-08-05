global.dsm_settings = ds_map_create();
global.index = 0;
global.sub_menu = MAIN;
global.show_confirm_popup = false;
global.confirm_index = 0;
global.confirm_options = ["Sim", "Não"];
global.menu_x_pos = room_width * 0.5;
global.menu_y_pos = room_height * 0.4;

ds_map_add(SET, "volume", [5, [0, 10]]);
ds_map_add(SET, "modo", [1, ["Ligado", "Desligado"]]);

global.menu = [
    ["Jogar", "Configuração", "Sair"],
    [["Volume ", "volume"], ["Tela Cheia ", "modo"], "Voltar"],
    ["Voltar"]
];
load_settings();