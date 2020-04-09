/* theme settings */
#include "../theme.h"

/* general appearance */
static int topbar                  = top_bar; 	     /* -b  option; if 0, dmenu appears at bottom                                   */
static const char *fonts[]         = { theme.font }; /* -fn option overrides fonts[0]; the x11 menu font                            */
static const char *prompt          = NULL;           /* -p  option; prompt to the left of input field                               */
static unsigned int lines          = 5;              /* -l  option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lineheight     = 28;             /* -h  option; minimum height of a menu line                                   */
static const char worddelimiters[] = " ";
static int min_width               = 500;
static unsigned int border_width   = 2;

/* colors */
static const char *colors[SchemeLast][2] = {
	/*               fg                bg                              */
	[SchemeNorm] = { theme.foreground, theme.background }, /* normal   */ 
	[SchemeSel]  = { theme.background, theme.accent     }, /* selected */
	[SchemeOut]  = { theme.foreground, theme.background },
};
