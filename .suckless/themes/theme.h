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

/* theme: zen/mint */
static const Theme theme = {
	/* main appearance */
	"Iosevka:pixelsize=13:antialias=true:autohint=true",
	"#9DE3C0", /* accent     */
	"#042327", /* background */
	"#BDB395", /* foreground */
	{ 
		/* dwm */
		"#9DE3C0",	/* border active   */
		"#183538"	/* border inactive */
	},
	{
		/* st */
		/* normal color       */
		"#101010", /* black   */
		"#FF6B57", /* red     */
		"#B8D68C", /* green   */
		"#E1AA5D", /* yellow  */
		"#7DC1CF", /* blue    */
		"#9B64FB", /* magenta */
		"#6D878D", /* cyan    */
		"#DDDDDD", /* white   */
	 	/* bright color       */
		"#404040", /* black   */
		"#FF6B57", /* red     */
		"#A0CF5D", /* green   */
		"#F39D21", /* yellow  */
		"#4E9FB1", /* blue    */
		"#8542FF", /* magenta */
		"#42717B", /* cyan    */
		"#DDDDDD"  /* white   */
	}
};
/* defines */
#define _borderpx 1 
#define _paddingpx 15
#define _showbar 1
#define _topbar 1
#define _horizpadbar 1
#define _vertpadbar 15
#define _tagind 2
