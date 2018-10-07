/* general appearance */
static const unsigned int borderpx  = 1; /* border pixel of windows */
static const unsigned int snap      = 8; /* snap pixel              */
static const int showbar            = 1; /* 0 means no bar          */
static const int topbar             = 1; /* 0 means bottom bar      */
static const char *fonts[]          = { "IBM Plex Mono:pixelsize=12:antialias=true:autohint=true" };
static const char dmenufont[]       = "IBM Plex Mono:pixelsize=12:antialias=true:autohint=true";

/* colors */
#include "../themes/theme.h"
static const char *colors[][3]      = {
	/*               fg          	   bg                border                      */
	[SchemeNorm] = { theme.foreground, theme.background, theme.border }, /* normal   */
	[SchemeSel]  = { theme.accent,     theme.background, theme.accent }, /* selected */
};

/* tags */
static const char *tags[] = { "1:MAIN", "2:WEB", "3:TERM", "4:DEV", "5:MUSIC" };

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95]      */
static const int nmaster     = 1;    /* number of clients in master area             */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#include "src/gaplessgrid.c"
static const Layout layouts[] = {
	/* symbol     arrange function 				     */
	{ "[T]",      tile },        /* tiling layout behavior (default) */
	{ "[F]",      NULL },        /* floating window behavior         */
	{ "[G]",      gaplessgrid }, /* gapelessgrid layout behaviour    */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2]         = "0"; 
static const char *dmenu[]      = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", theme.background, "-nf", theme.foreground, "-sb", theme.background, "-sf", theme.accent, NULL };
static const char *terminal[]   = { "st", NULL };

#include "src/movestack.c"
#include "src/shiftview.c"
/* key bindings */
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenu } },	 /* spawn dmenu 		   */
	{ MODKEY,             		XK_Return, spawn,          {.v = terminal } },   /* spawn terminal	           */
	{ MODKEY,                       XK_b,      togglebar,      {0} },	         /* toggle bar		           */
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },         /* focus to next client           */
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },	 /* focus to previous client       */
	{ MODKEY|ShiftMask,		XK_j,	   movestack,	   {.i = +1 } },         /* move client stack foward       */        
	{ MODKEY|ShiftMask,		XK_k,	   movestack,	   {.i = -1 } },         /* move client stack backward     */
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },	 /* add client to master area      */
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },	 /* remove client from master area */
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },       /* decrease master area factor    */
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },       /* increase master area factor    */
	{ MODKEY,                       XK_Tab,    shiftview,      {.i = +1 } },         /* shift to next tag              */
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },                /* kill focused client 	   */
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} }, /* toggle tiling layout           */
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} }, /* toggle floating layout         */
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[2]} }, /* toggle gaplessgrid layout      */
	{ MODKEY,                       XK_space,  setlayout,      {0} },                /* cycle layouts                  */
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },                /* toggle floating client         */
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,             		XK_q,      quit,           {1} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
};

/* button definitions */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} }, /* move client via mouse */ 
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} }, /* toggle floating client */
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} }, /* resize floating client */
};
