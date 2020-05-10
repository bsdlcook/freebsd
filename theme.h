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

// minty theme
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

// dwm
#define DWM_BORDER_PIXEL 1
#define DWM_SHOW_BAR 1
#define DWM_TOP_BAR 1
#define DWM_HORIZ_PAD 7
#define DWM_VERT_PAD 7
#define DWM_TAG_STYLE 2
#define DWM_GAP_PIXEL 8
#define DWM_SNAP_PIXEL 7

static const char* tags[]     = { "main", "dev",  "web", "music", "chat" };
static const char* tag_active = { NULL };

// dmenu
#define DMENU_BORDER_WIDTH 2
#define DMENU_MIN_WIDTH 500
#define DMENU_TOP_BAR 1
#define DMENU_LINES 5
#define DMENU_LINE_HEIGHT 28

// st
#define ST_PAD 5 
