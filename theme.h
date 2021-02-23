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
	/* general appearance */
	"Iosevka:pixelsize=16:antialias=true:autohint=true",
	"#9E7B38",	/* accent     */
	"#262626",	/* background */
	"#9e9e9e",	/* foreground */
	{ 
		/* dwm */
		"#9E7B38",	/* border active   */
		"#262626"	/* border inactive */
	},
	{
		/* st */
		/* 8 normal colors    */
		"#282828", /* black   */
		"#CC4741", /* red     */
		"#98971a", /* green   */
		"#d79921", /* yellow  */
		"#458588", /* blue    */
		"#b16286", /* magenta */
		"#689d6a", /* cyan    */
		"#a89984", /* white   */

		/* 8 bright colors    */
		"#928374", /* black   */
		"#fb4934", /* red     */
		"#b8bb26", /* green   */
		"#fabd2f", /* yellow  */
		"#83a598", /* blue    */
		"#d3869b", /* magenta */
		"#8ec07c", /* cyan    */
		"#ebdbb2", /* white   */
	}
};

/* dwm */
#define DWM_BORDER_PIXEL 2
#define DWM_SHOW_BAR 1
#define DWM_TOP_BAR 1
#define DWM_HORIZ_PAD 5
#define DWM_VERT_PAD 5
#define DWM_TAG_STYLE 0
#define DWM_GAP_PIXEL 0
#define DWM_SNAP_PIXEL 7

#define UNICODE "\u25B1"
#define UNICODE_ACTIVE "\u25B0"

static const char* tags[]     = { UNICODE, UNICODE, UNICODE, UNICODE, UNICODE };
static const char* tag_active = { UNICODE_ACTIVE };

/* dmenu */
#define DMENU_BORDER_WIDTH 1
#define DMENU_MIN_WIDTH 500
#define DMENU_TOP_BAR 1
#define DMENU_LINES 5
#define DMENU_LINE_HEIGHT 28

/* st */
#define ST_PAD 5 
