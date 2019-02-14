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

/* theme: zen/purple */
#define dwm_borderpx 1 
#define st_paddingpx 15
static const Theme theme = {
	/* accent, background, foreground, font */
	"#593C58", "#190B18", "#BDB395", "Apercu Mono Pro:pixelsize=12:antialias=true:autohint=true",
	{
		"#593C58",	/* dwm border active   */
		"#190F19"	/* dwm border inactive */
	}
};
