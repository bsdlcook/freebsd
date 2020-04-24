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
	// minty
	static const Theme theme = {
		// general appearance
		"Iosevka:pixelsize=16:antialias=true:autohint=true",
		"#9DE3C0",		// accent
		"#03191C",	// background
		"#BDB395",	// foreground
		{ 
			// dwm
			"#9DE3C0",	// border active
			"#183538"	// border inactive
		},
		{
			// st
			"#152323",
			"#61C3BC",
			"#72B6C6",
			"#71CECD",
			"#60D0CD",
			"#86BAC6",
			"#8ECED3",
			"#c9e8eb", // normal colors
			
			"#8ca2a4",
			"#61C3BC",
			"#72B6C6",
			"#71CECD",
			"#60D0CD",
			"#86BAC6",
			"#8ECED3",
			"#c9e8eb", // bright colors
		}
	};
	// tags
	static const char* tags[]     = {  "main", "dev",  "web", "music", "chat" };
	static const char* tag_active = { NULL };
	// defines
	#define border_pixel_ 2 
	#define terminal_pad 10
	#define show_bar 1
	#define top_bar 1
	#define horizontal_pad 5
	#define vertical_pad 5
	#define tag_style 2
