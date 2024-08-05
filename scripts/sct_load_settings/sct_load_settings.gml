function load_settings() {
    ini_open("settings.ini");
    var volume = ini_read_string("Settings", "volume", "5");
    var modo = ini_read_string("Settings", "modo", "0");
    ini_close();
    
    SET[? "volume"][0] = real(volume);
    SET[? "modo"][0] = real(modo);
    
    audio_master_gain(real(volume) / 10);
    window_set_fullscreen(real(modo) == 0);
}
