typedef struct {
	char accent[8];
	char background[8];
	char foreground[8];
	char border[8];
	char font [255];
} Theme;
		     /* accent      bg         fg         border    font						      */ 
static Theme theme = { "#9DE3C0", "#042327", "#BDB395", "#183538", "Apercu Mono Pro:pixelsize=12:antialias=true:autohint=true" };
