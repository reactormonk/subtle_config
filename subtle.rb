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

def reloadable(file)
  unless file =~ /\.rb$/
    file << '.rb'
  end
  load File.dirname(File.expand_path(__FILE__)) + "/" + file
end

reloadable 'persistent_data'

#
# == Options
#
# Following options change behaviour and sizes of the window manager:
#
set :border,     2
set :step,       5
set :snap,       10
set :gravity,    :center
set :urgent,     false
set :resize,     false
set :padding,    [0, 0, 0, 0]
set :font,       "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"

#
# == Panel
#
# The next configuration values determine the layout and placement of the panel. Generally,
# the panel in subtle consists of two independent bars, one on the top and one at the bottom
# of the screen. In Xinerama setups there will only be panels visible on the first screen.
#
# The top and bottom bar can contain different items and will be hidden when empty.
#
# Following items are available:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons
# [*:sublets*]   Catch-all for installed sublets
# [*:spacer*]    Variable spacer
# [*:separator*] Insert separator
#
set :top,        [:views, :title, :spacer, :sublets, :spacer, :tray]
set :bottom,     []
set :stipple,    true
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
# Whenever there is no valid value for a color set - subtle will use a default one. There
# is only one exception to this: If no background color is given no color will be set. This
# will ensure a custom background pixmap won't be overwritten.
#

# Foreground color of panel and separator
color :fg_panel, "#5ad25a"

# Foreground color of view button
color :fg_views, "#5ad25a"

# Foreground color of sublets
color :fg_sublets, "#5ad25a"

# Foreground color of focus window titles and active views
color :fg_focus, "#ffffff"

# Foreground color of urgent window titles and views
color :fg_urgent, "#ff0000"

# Background color of panel
color :bg_panel, "#000000"

# Background color of view button
color :bg_views, "#000000"

# Background color of sublets
color :bg_sublets, "#000000"

# Background color of focus window titles and active views
color :bg_focus, "#000000"

# Background color of urgent window titles and views
color :bg_urgent, "#ffffff"

# Border color of focus windows
color :border_focus, "#303030"

# Border color of normal windows
color :border_normal, "#000000"

# Border color of panel items
color :border_panel, "#303030"

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways to set a
# certain gravity, most convenient is to define a gravity via a tag or change them during
# runtime via grab. Subtler and subtlext can also modify gravities.
#
# A gravity consists of four values which are a percentage value of the screen size. The first
# two values are x and y starting at the center of the screen and he last two values are the
# width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   :example = [ 0, 0, 100, 100 ]
#
gravity :top_left,      [0, 0, 50, 50]
gravity :top_left66,    [0, 0, 50, 66]
gravity :top_left33,    [0, 0, 50, 34]
gravity :top,           [0, 0, 100, 50]
gravity :top66,         [0, 0, 100, 66]
gravity :top33,         [0, 0, 100, 34]
gravity :top_right,     [100, 0, 50, 50]
gravity :top_right66,   [100, 0, 50, 66]
gravity :top_right33,   [100, 0, 50, 34]
gravity :left,          [0, 0, 50, 100]
gravity :left66,        [0, 50, 10, 100]
gravity :left50,        [0, 50, 50, 34]
gravity :left33,        [0, 50, 25, 34]
gravity :center,        [0, 0, 100, 100]
gravity :center66,      [0, 50, 100, 34]
gravity :center33,      [50, 50, 50, 34]
gravity :right,         [100, 0, 50, 100]
gravity :right66,       [100, 50, 10, 100]
gravity :right50,       [100, 50, 50, 34]
gravity :right33,       [100, 50, 25, 34]
gravity :bottom_left,   [0, 100, 50, 50]
gravity :bottom_left66, [0, 100, 50, 66]
gravity :bottom_left33, [0, 100, 50, 34]
gravity :bottom,        [0, 100, 100, 50]
gravity :bottom66,      [0, 100, 100, 66]
gravity :bottom33,      [0, 100, 100, 34]
gravity :bottom_right,  [100, 100, 50, 50]
gravity :bottom_right66, [100, 100, 50, 66]
gravity :bottom_right33, [100, 100, 50, 34]
gravity :gimp_image,    [50, 50, 80, 100]
gravity :gimp_toolbox,  [0, 0, 10, 100]
gravity :gimp_dock,     [100, 0, 10, 100]

# == Dmenu
#
# This is just an example how to use dmenu with colors defined in the subtle config.
#
#@dmenu = "dmenu_run -fn '%s' -nb '%s' -nf '%s' -sb '%s' -sf '%s' -p 'Select:'" % [
  # TODO don't hardcode
  #"-*-*-medium-*-*-*-14-*-*-*-*-*-*-*",
  #COLORS[:bg_panel], COLORS[:fg_panel],
  #COLORS[:bg_focus], COLORS[:fg_focus]
#]

# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be assigned either
# to a key and/or to a mouse button combination. A grab consists of a chain and an action.
#
# === Chain
#
# A chain is a string of modifiers, mouse buttons and normal keys separated by a hyphen.
#
# ==== Modifiers:
#
# [*S*] Shift key
# [*A*] Alt key
# [*C*] Control key
# [*W*] Super (Windows key)
# [*M*] Meta key
#
# ==== Mouse buttons:
#
# [*B1*] Button1
# [*B2*] Button2
# [*B3*] Button3
# [*B4*] Button4
# [*B5*] Button5
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a xterm when Alt+Enter are pressed:
#
#   "A-Return" => "xterm"
#
grab "W-C-r", :SubletsReload
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
grab "W-8", [:top_left, :top_left66, :top_left33]
grab "W-9", [:top, :top66, :top33]
grab "W-0", [:top_right, :top_right66, :top_right33]
grab "W-i", [:left, :left66, :left33, :left50]
grab "W-o", [:center, :center66, :center33]
grab "W-p", [:right, :right66, :right33, :right50]
grab "W-m", [:bottom_left, :bottom_left66, :bottom_left33]
grab "W-comma", [:bottom, :bottom66, :bottom33]
grab "W-period", [:bottom_right, :bottom_right66, :bottom_right33]
grab "C-XF86Forward", :ViewNext
grab "C-XF86Back", :ViewPrev
grab "W-Return", "urxvt"
grab "W-dollar", "dmenu_run -fn '-*-*-medium-*-*-*-14-*-*-*-*-*-*-*' -nb '#000000' -nf '#5ad25a' -sb '#000000' -sf '#ffffff' -p 'Select:'"

(1..6).each do |i|
  # Switch to view1, view2, ...
  grab "W-#{i}", "ViewJump#{i}".to_sym
  grab "W-A-#{i}", "ScreenJump#{i}".to_sym
  grab "A-S-#{i}", "WindowScreen#{i}".to_sym
end

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is strict,
# that means that - aside from other tiling window managers - windows must have a matching
# tag to be on a certain view. This also includes that windows that are started on a certain
# view will not automatically be placed there.
#
# There are to ways to define a tag:
#
# [*string*] With a WM_CLASS/WM_NAME
# [*hash*]   With a hash of properties
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the default view.
# The default view can either be set by the user with adding the default tag to a view by
# choice or otherwise the first defined view will be chosen automatically.
#
# === Properties
#
# Additionally tags can do a lot more then just control the placement - they also have properties
# than can define and control some aspects of a window like the default gravity or the default
# screen per view.
#
# [*:float*]   This property either sets the tagged client floating or prevents it from being
#              floating depending on the value.
# [*:full*]    This property either sets the tagged client to fullscreen or prevents it from being
#              set to fullscreen depending on the value.
# [*:gravity*] This property sets a certain to gravity to the tagged client, but only on views that
#              have this tag too.
# [*:match*]   This property influcences the matching of tags, per default tags will only match the
#              WM_NAME and the WM_CLASS portion of a client. Match expects an array with following
#              possible values:
#
#              [*:name*]       match the WM_NAME
#              [*:instance*]   match the first (instance) part from WM_CLASS
#              [*:class*]      match the second (class) part from WM_CLASS
#              [*:role*]       match the window role
# [*:regex*]   This property sets the matching pattern for a tag. Matching works either via plain,
#              regex (see regex) or window id. If a pattern matches more than once ONLY the first
#              match will be used.
# [*:resize*]  This property either enables or disables honoring of client resize hints and is
#              independent of the global option.
# [*:screen*]  This property sets a certain to screen to the tagged client, but only on views that
#              have this tag too. Please keep in mind that screen count starts with 0 for the first
#              screen.
# [*:size*]    This property sets a certain to size as well as floating to the tagged client, but
#              only on views that have this tag too. It expects an array with x, y, width and height
#              values.
# [*:stick*]   This property either sets the tagged client to stick or prevents it from being set to
#              stick depending on the value. Stick clients are visible on every view.
# [*:urgent*]  This property either sets the tagged client to be urgent or prevents it from being
#              urgent depending on the value. Urgent clients will get keyboard and mouse focus
#              automatically.
#
tag "term", "xterm|[u]?rxvt"
tag "browser", "uzbl|opera|firefox|navigator|midori"
tag "mail", "kmail"
tag "chat", "psi|gajim|sshIRC"
tag "rubymine" do
  regex    "java-lang-Thread"
end

tag "editor" do
  regex    "[g]?vim|VIM"
  resize   true
end

tag "ver" do
  regex "Toplevel"
  resize false
end

tag "dev-term" do
end

tag "fixed" do
  geometry [10, 10, 100, 100]
  stick    true
end

tag "resize" do
  regex    "sakura|gvim"
  resize   true
end

tag "gravity" do
  gravity  :center
end

tag "stick" do
  regex    "mplayer"
  float    true
  stick    true
end

tag "float" do
  regex    "display"
  float    true
end

tag "gimp_image" do
  regex    "gimp-image-window"
  match    [:role]
  gravity  :gimp_image
end

tag "gimp_toolbox" do
  regex    "gimp-toolbox"
  match    [:role]
  gravity  :gimp_toolbox
end

tag "gimp_dock" do
  regex    "gimp-dock"
  match    [:role]
  gravity  :gimp_dock
end


#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a tag with them.
# Windows that have no tag will be visible on the default view which is the view with the
# default tag or the first defined view when this tag isn't set.
#
# === Properties
#
# The same notation as in tags is possible for views, but currently only one additional property to
# regex is available.
#
# [*:dynamic*] This property enables dynamic mode of the view, that means it will only be visible
#              when there is a client on it.
#
view "terms", "term"
view "net", "browser|chat|mail"
view "dev", "editor|rubymine|dev-term|ver"
view "other", "default"

#
# == Hooks
#
on :client_focus do |client|
  client.raise if client.has_tag?("ver")
end

# vim:ts=2:bs=2:sw=2:et:fdm=marker
