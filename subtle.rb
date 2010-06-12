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
OPTIONS = {
  # Border size in pixel of the windows
  :border  => 2,

  # Window move/resize steps in pixel per keypress
  :step    => 5,

  # Window screen border snapping
  :snap    => 10,

  # Limit execution time of sublets (0 = no limit)
  :limit   => 1,

  # Default starting gravity for windows (0 = gravity of last client)
  :gravity => :center,

  # Make transient windows urgent
  :urgent  => false,

  # Enable respecting of size hints globally
  :resize  => false,

  # Screen size padding (left, right, top, bottom)
  :padding => [ 0, 0, 0, 0 ],

  # Font string (see xfontsel)
  :font    => "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"

  # Xft string
  #:font    => "xft:sans-8"
}

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
PANEL = {
  # Content of the top panel
  :top       => [ :views, :title, :spacer, :sublets, :spacer, :tray ],

  # Content of the bottom panel
  :bottom    => [ ],

  # Add stipple to panels
  :stipple   => false,

  # Separator between sublets
  :separator => "",

  # Outline border size in pixel of panel items
  :border    => 0
}

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
COLORS = {
  # Foreground color of panel and separator
  :fg_panel      => "#5ad25a",

  # Foreground color of view button
  :fg_views      => "#5ad25a",

  # Foreground color of sublets
  :fg_sublets    => "#5ad25a",

  # Foreground color of focus window titles and active views
  :fg_focus      => "#ffffff",

  # Foreground color of urgent window titles and views
  :fg_urgent     => "#ff0000",

  # Background color of panel
  :bg_panel      => "#000000",

  # Background color of view button
  :bg_views      => "#000000",

  # Background color of sublets
  :bg_sublets    => "#000000",

  # Background color of focus window titles and active views
  :bg_focus      => "#000000",

  # Background color of urgent window titles and views
  :bg_urgent     => "#ffffff",

  # Border color of focus windows
  :border_focus  => "#303030",

  # Border color of normal windows
  :border_normal => "#000000",

  # Border color of panel items
  :border_panel  => "#303030"
}

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
GRAVITIES = {
  # Top left
  :top_left       => [   0,   0,  50,  50 ],
  :top_left66     => [   0,   0,  50,  66 ],
  :top_left33     => [   0,   0,  50,  34 ],

  # Top
  :top            => [   0,   0, 100,  50 ],
  :top66          => [   0,   0, 100,  66 ],
  :top33          => [   0,   0, 100,  34 ],

  # Top right
  :top_right      => [ 100,   0,  50,  50 ],
  :top_right66    => [ 100,   0,  50,  66 ],
  :top_right33    => [ 100,   0,  50,  34 ],

  # Left
  :left           => [   0,   0,  50, 100 ],
  :left66         => [   0,  50,  10, 100 ],
  :left33         => [   0,  50,  25,  34 ],

  # Center
  :center         => [   0,   0, 100, 100 ],
  :center66       => [   0,  50, 100,  34 ],
  :center33       => [  50,  50,  50,  34 ],

  # Right
  :right          => [ 100,   0,  50, 100 ],
  :right66        => [ 100,  50,  10, 100 ],
  :right33        => [ 100,  50,  25,  34 ],

  # Bottom left
  :bottom_left    => [   0, 100,  50,  50 ],
  :bottom_left66  => [   0, 100,  50,  66 ],
  :bottom_left33  => [   0, 100,  50,  34 ],

  # Bottom
  :bottom         => [   0, 100, 100,  50 ],
  :bottom66       => [   0, 100, 100,  66 ],
  :bottom33       => [   0, 100, 100,  34 ],

  # Bottom right
  :bottom_right   => [ 100, 100,  50,  50 ],
  :bottom_right66 => [ 100, 100,  50,  66 ],
  :bottom_right33 => [ 100, 100,  50,  34 ],

  # Gimp
  :gimp_image     => [  50,  50,  80, 100 ],
  :gimp_toolbox   => [   0,   0,  10, 100 ],
  :gimp_dock      => [ 100,   0,  10, 100 ]
}

# == Dmenu
#
# This is just an example how to use dmenu with colors defined in the subtle config.
#
@dmenu = "dmenu_run -fn '%s' -nb '%s' -nf '%s' -sb '%s' -sf '%s' -p 'Select:'" % [
  OPTIONS[:font],
  COLORS[:bg_panel], COLORS[:fg_panel],
  COLORS[:bg_focus], COLORS[:fg_focus]
]

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
GRABS = {
  # Force reload of sublets
  "W-C-r"    => :SubletsReload,

  # Force reload of config
  "W-S-r"    => :SubtleReload,

  # Force restart of subtle
  "W-C-S-r"  => :SubtleRestart,

  # Quit subtle
  "W-C-q"    => :SubtleQuit,

  # Move current window
  "W-B1"     => :WindowMove,

  # Resize current window
  "W-B3"     => :WindowResize,

  # Toggle floating mode of window
  "W-space"  => :WindowFloat,

  # Toggle fullscreen mode of window
  "W-f"      => :WindowFull,

  # Toggle sticky mode of window (will be visible on all views)
  "W-b"      => :WindowStick,

  # Raise window
  "W-z"      => :WindowRaise,

  # Lower window
  "W-n"      => :WindowLower,

  # Select next windows
  "W-h"   => :WindowLeft,
  "W-j"   => :WindowDown,
  "W-k"   => :WindowUp,
  "W-l"   => :WindowRight,

  # Kill current window
  "W-q"    => :WindowKill,

  # Cycle between given gravities
  "W-8"     => [ :top_left,     :top_left66,     :top_left33     ],
  "W-9"     => [ :top,          :top66,          :top33          ],
  "W-0"     => [ :top_right,    :top_right66,    :top_right33    ],
  "W-i"     => [ :left,         :left66,         :left33         ],
  "W-o"     => [ :center,       :center66,       :center33       ],
  "W-p"     => [ :right,        :right66,        :right33        ],
  "W-m"     => [ :bottom_left,  :bottom_left66,  :bottom_left33  ],
  "W-comma" => [ :bottom,       :bottom66,       :bottom33       ],
  "W-period"=> [ :bottom_right, :bottom_right66, :bottom_right33 ],

  "C-XF86Forward" => proc do
    Subtlext::View.current.next.jump
  end,
  "C-XF86Back" => proc do
    Subtlext::View.current.prev.jump
  end,

  # Exec some programs
  "W-Return" => "urxvt",
  "W-dollar" => @dmenu,
}

(1..6).each do |i|
  # Switch to view1, view2, ...
  GRABS["W-#{i}"] = "ViewJump#{i}".to_sym
  GRABS["W-A-#{i}"] = "ScreenJump#{i}".to_sym
  GRABS["A-S-#{i}"] = "WindowScreen#{i}".to_sym
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
TAGS = {
  # Simple tags
  "term"    => "xterm|[u]?rxvt",
  "browser" => "uzbl|opera|firefox|navigator",
  "mail"    => "kmail",
  "chat"    => "psi|gajim|sshIRC",

  "rubymine"=> { :regex => "java-lang-Thread" },

  # Placement
  "editor"  => { :regex => "[g]?vim", :resize => true },
  "fixed"   => { :geometry => [ 10, 10, 100, 100 ], :stick => true },
  "resize"  => { :regex => "sakura|gvim", :resize => true },
  "gravity" => { :gravity => :center },

  # Modes
  "stick"   => { :regex => "mplayer", :float => true, :stick => true },
  "float"   => { :regex => "display", :float => true },

  # Gimp
  "gimp_image"   => { :regex => "gimp-image-window", :match => [ :role ], :gravity => :gimp_image },
  "gimp_toolbox" => { :regex => "gimp-toolbox", :match => [ :role ], :gravity => :gimp_toolbox },
  "gimp_dock"    => { :regex => "gimp-dock", :match => [ :role ], :gravity => :gimp_dock },
}

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
VIEWS = {
  "terms" => "term",
  "net"   => "browser|chat|mail",
  "dev"   => "editor|rubymine"
}

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event. Following hooks exist so far:
#
# [*:HookClientCreate*]    Called whenever a window is created
# [*:HookClientConfigure*] Called whenever a window is configured
# [*:HookClientFocus*]     Called whenever a window gets focus
# [*:HookClientKill*]      Called whenever a window is killed
#
# [*:HookViewCreate*]      Called whenever a view is created
# [*:HookViewConfigure*]   Called whenever a view is configured
# [*:HookViewJump*]        Called whenever the view is switched
# [*:HookViewKill*]        Called whenever a view is killed
#
# [*:HookTagCreate*]       Called whenever a tag is created
# [*:HookTagKill*]         Called whenever a tag is killed
#
# [*:HookExit*]            Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   :HookClientFocus => lambda { |c| puts c.name }
#
HOOKS = { }

# vim:ts=2:bs=2:sw=2:et:fdm=marker
