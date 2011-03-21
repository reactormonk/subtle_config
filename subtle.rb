#
# Author::  Christoph Kappel <unexist@dorfelite.net>
# Version:: $Id$
# License:: GNU GPL
#
# = Subtle example configuration
#
# This file will be installed as default and can also be used as a starter for an own
# custom configuration file. The system wide config usually resides in +/etc/xdg/subtle+
# and the user config in +HOME/.config/subtle+, both locations are dependent on the
# locations specified by +XDG_CONFIG_DIRS+ and +XDG_CONFIG_HOME+.
#

$LOAD_PATH << File.join(ENV['XDG_CONFIG_HOME'], 'subtle')
require "subtle-launcher/launcher"

#
# == Options
#
# Following options change behaviour and sizes of the window manager:
#
# Border size in pixel of the windows
set :border, 2

# Window move/resize steps in pixel per keypress
set :step, 5

# Window screen border snapping
set :snap, 10

# Default starting gravity for windows (0 = gravity of last client)
set :gravity, :center

# Make transient windows urgent
set :urgent, false

# Enable respecting of size hints globally
set :resize, false

# Screen size padding (left, right, top, bottom)
set :padding, [ 0, 0, 0, 0 ]

# Font string either take from e.g. xfontsel or use xft
set :font, "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
#set :font, "xft:sans-8"

# Space around windows
set :gap, 0

# Separator between sublets
set :separator, "|"

# Outline border size in pixel of panel items
set :outline, 0

# Outline border size in pixel of panel items
set :font,       "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
#
# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and sublets
# screen wise. Per default only the top panel on the first screen is used, it's
# up to the user to enable the bottom panel or disable either one or both.
#
# Empty panels are hidden.
#
# Following items are available:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:center*]    Enclose items with :center to center them on the panel
# [*:separator*] Insert separator
#
# === Link
#
# http://subforge.org/wiki/subtle/Panel
#

screen 1 do
  # Add stipple to panels
  stripple false
  top [:views, :title, :spacer, :sublets, :spacer, :tray]
  bottom []
end
screen 2 do
  top [:views, :title, :spacer]
end
set :separator,  ""
set :outline,    0

#
# == Colors
#
# Colors directly define the look of subtle, valid values are:
#
# [*hexadecimal*] #0000ff
# [*decimal*]     (0, 0, 255)
# [*names*]       blue
#
# Whenever there is no valid value for a color set - subtle will use a default
# one. There is only one exception to this: If no background color is given no
# color will be set. This will ensure a custom background pixmap won't be
# overwritten.
#
# === Link
#
# http://subforge.org/wiki/subtle/Themes
#

color :stipple, "#5ad25a"
color :panel, "#000000"

color :views_fg, "#5ad25a"
color :views_bg, "#000000"
color :views_border, "#ffffff"

color :occupied_fg, "#5ad25a"
color :occupied_bg, "#505050"
color :occupied_border, "#ffffff"

color :sublets_fg, "#5ad25a"
color :sublets_bg, "#000000"
color :sublets_border, "#303030"

color :focus_fg, "#ffffff"
color :focus_bg, "#000000"
color :focus_border, "#000000"

color :urgent_fg, "#ff0000"
color :urgent_bg, "#ffffff"

color :client_inactive, "#000000"
color :client_active, "#303030"

color :separator,     "#757575"

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
thirtythree = 1.0/3*100
gravity :top_left,      [0, 0, 50, 50]
gravity :top_left33,    [0, 0, thirtythree, thirtythree]
gravity :top_left50,    [0, 0, thirtythree, 50]
gravity :top,           [50, 0, 100, 50]
gravity :top33,         [50, 0, thirtythree, thirtythree]
gravity :top50,         [50, 0, thirtythree, 50]
gravity :top_right,     [100, 0, 50, 50]
gravity :top_right33,   [100, 0, thirtythree, thirtythree]
gravity :top_right50,   [100, 0, thirtythree, 50]
gravity :left,          [0, 0, 50, 100]
gravity :left66,        [0, 50, 10, 100]
gravity :left50,        [0, 50, 50, thirtythree]
gravity :left33,        [0, 50, 25, thirtythree]
gravity :center,        [50, 50, 100, 100]
gravity :center66,      [0, 50, 100, thirtythree]
#gravity :center33,      [50, 50, 50, thirtythree]
gravity :right,         [100, 0, 50, 100]
gravity :right66,       [100, 50, 10, 100]
gravity :right50,       [100, 50, 50, thirtythree]
gravity :right33,       [100, 50, 25, thirtythree]
gravity :bottom_left,   [0, 100, 50, 50]
gravity :bottom_left50, [0, 100, thirtythree, 50]
gravity :bottom_left33, [0, 100, thirtythree, thirtythree]
gravity :bottom,        [0, 100, 100, 50]
gravity :bottom66,      [50, 100, thirtythree, 50]
gravity :bottom33,      [50, 100, thirtythree, thirtythree]
gravity :bottom_right,  [100, 100, 50, 50]
gravity :bottom_right50, [100, 100, thirtythree, 50]
gravity :bottom_right33, [100, 100, thirtythree, thirtythree]
gravity :gimp_image,    [50, 50, 80, 100]
gravity :gimp_toolbox,  [0, 0, 10, 100]
gravity :gimp_dock,     [100, 0, 10, 100]

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one key and can be used in
# various ways to trigger an action. In subtle there are two ways to define
# chains for grabs:
#
#   1. Default way*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Escape way*: Define an escape grab that needs to be pressed before
#      *any* other grab can be used like in screen/tmux.
#
#      *Example*: grab "C-y", :SubtleEscape
#                 grab "Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*] = Button1 (Left mouse button)
# [*B2*] = Button2 (Middle mouse button)
# [*B3*] = Button3 (Right mouse button)
# [*B4*] = Button4 (Mouse wheel up)
# [*B5*] = Button5 (Mouse wheel down)
#
# ==== Modifiers
#
# [*A*] = Alt key
# [*C*] = Control key
# [*M*] = Meta key
# [*S*] = Shift key
# [*W*] = Super (Windows) key
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#
# === Link
#
# http://subforge.org/wiki/subtle/Grabs
#

grab "W-S-r", :SubtleReload
grab "W-C-S-r", :SubtleRestart
grab "W-C-q", :SubtleQuit
grab "W-B1", :WindowMove
grab "W-B3", :WindowResize
grab "W-space", :WindowFloat
grab "W-f", :WindowFull
grab "W-b", :WindowStick
grab "W-u", :WindowRaise
grab "W-n", :WindowLower
grab "W-h", :WindowLeft
grab "W-j", :WindowDown
grab "W-k", :WindowUp
grab "W-l", :WindowRight
grab "W-q", :WindowKill
grab "W-8", [:top_left, :top_left50, :top_left33]
grab "W-9", [:top, :top50, :top33]
grab "W-0", [:top_right, :top_right50, :top_right33]
grab "W-i", [:left, :left66, :left33, :left50]
grab "W-o", [:center, :center66]
grab "W-p", [:right, :right66, :right33, :right50]
grab "W-m", [:bottom_left, :bottom_left50, :bottom_left33]
grab "W-comma", [:bottom, :bottom66, :bottom33]
grab "W-period", [:bottom_right, :bottom_right50, :bottom_right33]
grab "C-XF86Forward", :ViewNext
grab "C-XF86Back", :ViewPrev
grab "W-Return", "urxvt"
grab "W-dollar" do
  Launcher::Launcher.instance.run
end
# exchanges primary clipboard and selection buffer
grab "W-t", "tmp=`xclip -o -selection primary` && xclip -selection clipboard -o | xclip -selection primary && echo \"$tmp\" | xclip -selection clipboard"

grab "XF86AudioMute", :VolumeToggle
grab "XF86AudioRaiseVolume", :VolumeRaise
grab "XF86AudioLowerVolume", :VolumeLower

(1..6).each do |i|
  # Switch to view1, view2, ...
  grab "W-#{i}", "ViewSwitch#{i}".to_sym
  grab "W-A-#{i}", "ScreenJump#{i}".to_sym
end

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# [*string*]  With a WM_CLASS/WM_NAME
# [*hash*]    With a hash of properties
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# [*float*]   This property either sets the tagged client floating or prevents
#              it from being floating depending on the value.
#
#              Example: float true
#
# [*full*]    This property either sets the tagged client to fullscreen or
#              prevents it from being set to fullscreen depending on the value.
#
#              Example: full true
#
# [*gravity*] This property sets a certain to gravity to the tagged client,
#              but only on views that have this tag too.
#
#              Example: gravity :center
#
# [*match*]   This property adds matching patterns to a tag, a tag can have
#              more than one. Matching works either via plaintext, regex
#              (see man regex(7)) or window id. Per default tags will only
#              match the WM_NAME and the WM_CLASS portion of a client, this
#              can be changed with following possible values:
#
#              [*:name*]      Match the WM_NAME
#              [*:instance*]  Match the first (instance) part from WM_CLASS
#              [*:class*]     Match the second (class) part from WM_CLASS
#              [*:role*]      Match the window role
#
#              Example: match :instance => "urxvt"
#                       match [:role, :class] => "test"
#                       match "[xa]+term"
#
# [*exclude*] This property works exactly the same way as *match*, but it
#              excludes clients that match from this tag. That can be helpful
#              with catch-all tags e.g. for console apps.
#
#              Example: exclude :instance => "irssi"
#
# [*resize*]  This property either enables or disables honoring of client
#              resize hints and is independent of the global option.
#
#              Example: resize true
#
# [*size*]    This property sets a certain to size as well as floating to the
#              tagged client, but only on views that have this tag too. It
#              expects an array with x, y, width and height values.
#
#              Example: size [100, 100, 50, 50]
#
# [*stick*]   This property either sets the tagged client to stick or prevents
#              it from being set to stick depending on the value. Stick clients
#              are visible on every view.
#
#              Example: stick true
#
# [*type*]    This property sets the [[Tagging|tagged]] client to be treated
#              as a specific window type though as the window sets the type
#              itself. Following types are possible:
#
#              [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#              [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#              [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#              [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#              [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#
#              Example: type :desktop
#
# [*urgent*]  This property either sets the tagged client to be urgent or
#              prevents it from being urgent depending on the value. Urgent
#              clients will get keyboard and mouse focus automatically.
#
#              Example: urgent true
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#

tag "term", "xterm|[u]?rxvt"
tag "browser", "uzbl|opera|firefox|navigator|midori|chromium|dwb"
tag "mail", "kmail"
tag "chat", "psi|gajim|sshIRC"

tag "editor" do
  match    "[g]?vim|VIM|Meld"
  resize   true
end

tag "ver" do
  match "ver"
  resize false
end

tag "fixed" do
  geometry [10, 10, 100, 100]
  stick    true
end

tag "resize" do
  match    "sakura|gvim"
  resize   true
end

tag "gravity" do
  gravity  :center
end

tag "stick" do
  match    "mplayer"
  float    true
end

tag "float" do
  match    "display"
  float    true
end

tag "pinentry" do
  match    "pinentry"
  stick    true
end

tag "gimp_image" do
  match    :role => "gimp-image-window"
  gravity  :gimp_image
end

tag "gimp_toolbox" do
  match    :role => "gimp-toolbox"
  gravity  :gimp_toolbox
end

tag "gimp_dock" do
  match    :role => "gimp-dock"
  gravity  :gimp_dock
end

tag "wine" do
  match :class => "wine"
end

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#

view "terms", "term"
view "net", "browser|chat|mail"
view "other", "default"
view "wine" do
  match "wine"
  dynamic true
end

#
# == Sublets
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle.
#
# Follwing properties can be changed directly:
#
# [*interval*]    Update interval of the sublet
# [*foreground*]  Default foreground color
# [*background*]  Default background color
#
# === Example
#
#  sublet :clock do
#    interval      30
#    foreground    "#eeeeee"
#    background    "#000000"
#    format_string "%H:%M:%S"
#  end
#
#  === Link
#
# http://subforge.org/wiki/subtle/Sublets#Configuration
#

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#
# === Link
#
# http://subforge.org/wiki/subtle/Hooks
#

# vim:ts=2:bs=2:sw=2:et:fdm=markerreloadable 'misc'

