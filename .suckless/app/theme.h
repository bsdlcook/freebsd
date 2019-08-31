	typedef struct {
		char font[255];
		char accent[8];
		char background[8];
		char foreground[8];
		struct {
			char border_active[8];
			char border_inactive[8];
		} dwm;
		struct {
			char black[8];
			char red[8];
			char green[8];
			char yellow[8];
			char blue[8];
			char magenta[8];
			char cyan[8];
			char white[8];
			char bright_black[8];
			char bright_red[8];
			char bright_green[8];
			char bright_yellow[8];
			char bright_blue[8];
			char bright_magenta[8];
			char bright_cyan[8];
			char bright_white[8];
		} st;
	} Theme;
	// mint
	static const Theme theme = {
		// general appearance
		"Iosevka:pixelsize=17:antialias=true:autohint=true",
		"#9DE3C0",		// accent
		"#042327",	// background
		"#FFFFFF",	// foreground
		{ 
			// dwm
			"#9DE3C0",	// border active
			"#183538"	// border inactive
		},
		{
			// st
			"#000B14",
			"#608D90",
			"#696FA2",
			"#72F6AE",
			"#809ABF",
			"#9135D4",
			"#9BF0E1",
			"#c689e9",
			
			"#8a5fa3",
			"#608D90",
			"#696FA2",
			"#72F6AE",
			"#809ABF",
			"#9135D4",
			"#9BF0E1",
			"#c689e9",
		}
	};
	// tags
	static const char* tags[] = {  "MAIN",  "WEB",  "TERM",  "DEV",  "MUSIC",  }; 
	// defines
	#define _borderpx 1 // border_pixel
	#define _paddingpx 15 // terminal_pad
	#define _showbar 1 // show_bar 
	#define _topbar 1 // top_bar
	#define _horizpadbar 1 // horizontal_pad
	#define _vertpadbar 15 // vertical_pad
	#define _tagind 2 // tag_indicactor
