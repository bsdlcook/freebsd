/*
     ____  _ _ _ _____ 
    |    \| | | |     |
    |  |  | | | | | | |
    |____/|_____|_|_|_|
    Lewis' FreeBSD setup
    gitlab.com/bitw/fbsd
*/

/* inherit global colorscheme */ 
#include "../themes/theme.h"

/* general appearance */
static const char *fonts[]            = { theme.font }; /* x11 bar font 	                      */
static const unsigned int borderpx    = dwm_borderpx;   /* border pixel of windows                    */
static const unsigned int snap        = 8;              /* snap pixel                                 */
static const unsigned int showbar     = 1;              /* 0 means no bar                             */
static const unsigned int topbar      = 1;              /* 0 means bottom bar                         */
static const unsigned int horizpadbar = 1;              /* horizontal padding for statusbar           */
static const unsigned int vertpadbar  = 15;             /* vertical padding for statusbar             */
static const unsigned int tagind      = 2; 		/* 0 means use no tag indicator		     
							   1 means use square tag indicator
							   2 means use overline tag indicator             
							   3 means use underline tag indicator        */

/* colors */
static const char *colors[][3] = {
	/*               forground         background        border                       	      */
	[SchemeNorm] = { theme.foreground, theme.background, theme.dwm.border_inactive }, /* normal   */
	[SchemeSel]  = { theme.accent,     theme.background, theme.dwm.border_active   }, /* selected */
};

/* tags */
static const char *tags[] = { "1:main", "2:web", "3:term", "4:dev", "5:music" };

/* client/master ratios */
static const float mfact              = 0.50; /* factor of master area size [0.05..0.95]      */
static const unsigned int nmaster     = 1;    /* number of clients in master area             */
static const unsigned int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

/* layouts */
#include "src/gaplessgrid.c"
static const Layout layouts[] = {
	/* symbol     arrange function					 */
	{ "|t|",      tile },        /* tiling layout behavior (default) */
	{ "|f|",      NULL },        /* floating window behavior         */
	{ "|g|",      gaplessgrid }, /* gapelessgrid layout behaviour    */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* applications */
static const char *terminal[] = { "st", NULL               };
static const char *browser[]  = { "firefox", NULL          };
static const char *files[]    = { "st", "-e", "vifm", NULL };
static const char *editor[]   = { "st", "-e", "nvim", NULL };
static const char *music[]    = { "st", "-e", "cmus", NULL };

/* commands */
static const char *dmenu[]	= { "dmenu_run", "-i", "-p", "run:", NULL };
static const char *screenshot[]	= { "screenshot", NULL 		          };
static const char *themer[]	= { "dmenu_theme", NULL                   };
static const char *streams[]	= { "open-stream", NULL			  };

/* key bindings */
#include "src/movestack.c"
#include "src/shiftview.c"
static Key keys[] = {
	/* modifier                     key        function        argument 								*/
	/*																*/
	/*							   applications:							*/
	{ MODKEY,             		XK_Return, spawn,          {.v = terminal}   },  /* spawn terminal	           		*/
	{ MODKEY,			XK_w,      spawn,	   {.v = browser}    },  /* spawn web browser 				*/
	{ MODKEY,			XK_r,	   spawn,	   {.v = files}      },  /* spawn file browser 				*/
	{ MODKEY,			XK_e,	   spawn,	   {.v = editor}     },	 /* spawn editor 				*/
	{ MODKEY,			XK_m,	   spawn,	   {.v = music}      },	 /* spawn music player 				*/
	/*							   commands:								*/
	{ MODKEY,                       XK_space,  spawn,          {.v = dmenu}      },	 /* spawn dmenu 		   		*/
	{ MODKEY, 			XK_s,	   spawn,	   {.v = screenshot} },  /* take a screenshot and copy url to clipboard */
	{ MODKEY|ShiftMask,		XK_t,	   spawn,	   {.v = themer}     },	 /* change theme 				*/
	{ MODKEY|ShiftMask,		XK_s,	   spawn,	   {.v = streams}    },	 /* select stream with dmenu 			*/
	/*							   bindings:								*/
	{ MODKEY,                       XK_b,      togglebar,      {0} },	         /* toggle bar		                        */
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1}    },       /* focus to next client                     	*/
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1}    },	 /* focus to previous client       		*/
	{ MODKEY|ShiftMask,		XK_j,	   movestack,	   {.i = +1}    },       /* move client stack foward       		*/
	{ MODKEY|ShiftMask,		XK_k,	   movestack,	   {.i = -1}    },       /* move client stack backward    		*/
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1}    },	 /* add client to master area      		*/
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1}    },	 /* remove client from master area 		*/
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },       /* decrease master area factor    		*/
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },       /* increase master area factor    		*/
	{ MODKEY,                       XK_Tab,    shiftview,      {.i = +1}    },       /* shift to next tag              		*/
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },                /* kill focused client 	   		*/
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} }, /* toggle tiling layout           		*/
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} }, /* toggle floating layout         		*/
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[2]} }, /* toggle gaplessgrid layout      		*/
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },                /* toggle floating client         		*/
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1} },	         /* focus to the left monitor 			*/
	{ MODKEY,                       XK_period, focusmon,       {.i = +1} },	 	 /* focus to the right monitor			*/
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1} },	 	 /* move client to left monitor			*/
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1} },	 	 /* move client to right monitor		*/
	{ MODKEY,             		XK_q,      quit,           {1} },		 /* inline restart dwm				*/
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },		 /* quit dwm 					*/
	/*							   workspace bindings:							*/
	TAGKEYS(                        XK_1,                      0)			 /* workspace 1: main				*/
	TAGKEYS(                        XK_2,                      1)			 /* workspace 2: web			  	*/
	TAGKEYS(                        XK_3,                      2)			 /* workspace 3: term				*/
	TAGKEYS(                        XK_4,                      3)			 /* workspace 4: dev				*/
	TAGKEYS(                        XK_5,                      4)			 /* workspace 5: music				*/
	/*																*/
};

/* button definitions */
static Button buttons[] = {
	/* click                event mask      button          function        argument 			 */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} }, /* move client via mouse	 */ 
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} }, /* toggle floating client */
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} }, /* resize floating client */
	{ ClkTagBar,		0,		Button1,	view,		{0} }, /* change tag via click   */ 
	/*													 */
};
