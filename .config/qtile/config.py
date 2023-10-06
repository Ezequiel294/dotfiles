# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import Spacer
import arcobattery

mod = "mod4"
terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # firefox
    Key([mod], "f", lazy.spawn("firefox"), desc="Launch firefox"),
    # rofi
    Key([mod], "r", lazy.spawn("rofi -show drun"), desc="Launch rofi"),
    Key([mod, "shift"], "r", lazy.spawn("rofi -show"), desc="Opened apps"),
    # vscode
    Key([mod], "v", lazy.spawn("code"), desc="Launch vscode"),
    # thunar
    Key([mod, "shift"], "Return", lazy.spawn("thunar"), desc="Launch thunar"),
    # screenshot
    Key([mod], "p", lazy.spawn("xfce4-screenshooter -f -s 'Pictures/Screenshots/'")),
]

groups = [Group(i) for i in ["󰈹 ", " ", " ", " "]]
for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])


def init_layout_theme():
    return {"margin": 4,
            "border_width": 1,
            "border_focus": "#5e81ac",
            "border_normal": "#4c566a"
            }


layout_theme = init_layout_theme()

layouts = [
    layout.Max(),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
]

# COLORS FOR THE BAR


def init_colors():
    return [["#2F343F", "#2F343F"],  # color 0
            ["#2F343F", "#2F343F"],  # color 1
            ["#c0c5ce", "#c0c5ce"],  # color 2
            ["#fba922", "#fba922"],  # color 3
            ["#3384d0", "#3384d0"],  # color 4
            ["#f3f4f5", "#f3f4f5"],  # color 5
            ["#cd1f3f", "#cd1f3f"],  # color 6
            ["#62FF00", "#62FF00"],  # color 7
            ["#6790eb", "#6790eb"],  # color 8
            ["#a9a9a9", "#a9a9a9"]]  # color 9


colors = init_colors()

# WIDGETS FOR THE BAR


def init_widgets_defaults():
    return dict(font="Noto Sans",
                fontsize=12,
                padding=2,
                background=colors[1])


widget_defaults = init_widgets_defaults()

screens = [
    Screen(
        top=bar.Bar([
            widget.GroupBox(font="FontAwesome",
                            fontsize=16,
                            margin_y=-1,
                            margin_x=0,
                            padding_y=6,
                            padding_x=5,
                            borderwidth=0,
                            disable_drag=True,
                            active=colors[9],
                            inactive=colors[5],
                            rounded=False,
                            highlight_method="text",
                            this_current_screen_border=colors[8],
                            foreground=colors[2],
                            background=colors[1]
                            ),
            widget.Sep(
                    linewidth=1,
                    padding=10,
                    foreground=colors[2],
                    background=colors[1]
                    ),
            widget.CurrentLayout(
                font="Noto Sans Bold",
                foreground=colors[5],
                background=colors[1]
            ),
            widget.Sep(
                linewidth=1,
                padding=10,
                foreground=colors[2],
                background=colors[1]
            ),
            widget.WindowName(font="Noto Sans",
                              fontsize=12,
                              foreground=colors[5],
                              background=colors[1],
                              ),
            widget.TextBox(
                font="FontAwesome",
                text="  ",
                foreground=colors[3],
                background=colors[1],
                padding=0,
                fontsize=16
            ),
            widget.Clock(
                foreground=colors[5],
                background=colors[1],
                fontsize=12,
                format="%Y-%m-%d %H:%M"
            ),
            widget.Sep(
                linewidth=1,
                padding=10,
                foreground=colors[2],
                background=colors[1],
            ),
            # widget.CheckUpdates(
            #    distro="Arch",
            #    display_format="󰮯 {updates}",
            #    colour_have_updates=colors[6],
            # ),
            widget.Systray(
                background=colors[1],
                icon_size=20,
                padding=4
            ),
            arcobattery.BatteryIcon(
                padding=0,
                scale=0.7,
                y_poss=2,
                theme_path="/home/ezequiel/.config/qtile/icons/battery_icons_horiz",
                update_interval=5,
                background=colors[1]
            ),
        ],
            size=26,
            opacity=0.8,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
