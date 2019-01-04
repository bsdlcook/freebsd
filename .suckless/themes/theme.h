typedef struct {
	char accent[8];
	char background[8];
	char foreground[8];
	char border[8];
	char font [255];
} Theme;
		     /* accent      bg         fg         border    font						      */ 
static Theme theme = { "#FF6B47", "#1C1C1C", "#BBBBBB", "#444444", "Apercu Mono Pro:pixelsize=12:antialias=true:autohint=true" };
