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
	// purple
	static const Theme theme = {
		// general appearance
		"Iosevka:pixelsize=17:antialias=true:autohint=true",
		"#4E2F97",		// accent
		"#190B18",	// background
		"#BDB395",	// foreground
		{ 
			// dwm
			"#4E2F97",	// border active
			"#190F19"	// border inactive
		},
		{
			// st
			"#100a18",
			"#6431A6",
			"#463CCF",
			"#4245C8",
			"#5851DC",
			"#BC65A1",
			"#76898A",
			"#d3c8c5", // normal colors
			
			"#938c89",
			"#6431A6",
			"#463CCF",
			"#4245C8",
			"#5851DC",
			"#BC65A1",
			"#76898A",
			"#d3c8c5", // bright colors
		}
	};
	// tags
	static const char* tags[]     = {  "〇",  "〇",  "〇",  "〇",  "〇",  }; 
	static const char* tag_active = { "⬤" };
	// defines
	#define border_pixel_ 1
	#define terminal_pad 15
	#define show_bar 1
	#define top_bar 1
	#define horizontal_pad 1
	#define vertical_pad 15
	#define tag_style 1
