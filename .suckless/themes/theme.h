typedef struct {
	char accent[8];
	char background[8];
	char foreground[8];
	char font[255];
	struct {
		char border_active[8];
		char border_inactive[8];
	} dwm;
} Theme;

/* theme: zen/mint */
#define dwm_borderpx 1 
#define st_paddingpx 15
static const Theme theme = {
	/* accent, background, foreground, font */
	"#9DE3C0", "#042327", "#BDB395", "Apercu Mono Pro:pixelsize=12:antialias=true:autohint=true",
	{
		"#9DE3C0",	/* dwm border active   */
		"#183538"	/* dwm border inactive */
	}
};
