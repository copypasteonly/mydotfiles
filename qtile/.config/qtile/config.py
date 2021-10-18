# -*- coding: utf-8 -*-
import os
import subprocess
from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"              # Sets mod key to SUPER/WINDOWS
myTerm = "kitty"      # My terminal of choice
myBrowser = "firefox" # My terminal of choice

keys = [
         ### The essentials
         Key(["control", "mod1"], "t",
             lazy.spawn(myTerm+" --single-instance"),
             desc='Launches My Terminal'
             ),
         Key(["control", "shift"], "r",
             lazy.spawn("rofi -show run -theme nord -icon-theme 'Papirus' -show-icons -terminal kitty"),
             desc='Run Launcher'
             ),
         Key(["mod1"], "Tab",
             lazy.spawn("rofi -show window  -theme nord -icon-theme 'Papirus' -show-icons -terminal kitty"),
             desc='Run Launcher'
             ),
        Key([mod], "r",
             lazy.spawn(myTerm+" ranger"),
             desc='Run Launcher'
             ),
         Key([mod], "b",
             lazy.spawn(myBrowser),
             desc='Qutebrowser'
             ),
         Key([mod], "Tab",
             lazy.next_layout(),
             desc='Toggle through layouts'
             ),
         Key([mod, "shift"], "c",
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key([mod], "Delete",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key([mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),
         ### Switch focus to specific monitor (out of three)
         Key([mod], "w",
             lazy.window.toscreen(0),
             desc='Keyboard focus to monitor 1'
             ),
         Key([mod], "e",
             lazy.window.toscreen(1),
             desc='Keyboard focus to monitor 2'
             ),
         ### Switch focus of monitors
         Key([mod], "period",
             lazy.next_screen(),
             desc='Move focus to next monitor'
             ),
         Key([mod], "comma",
             lazy.prev_screen(),
             desc='Move focus to prev monitor'
             ),
         ### Treetab controls
          Key([mod, "shift"], "h",
             lazy.layout.move_left(),
             desc='Move up a section in treetab'
             ),
         Key([mod, "shift"], "l",
             lazy.layout.move_right(),
             desc='Move down a section in treetab'
             ),
         ### Window controls
         Key([mod], "j",
             lazy.layout.down(),
             desc='Move focus down in current stack pane'
             ),
         Key([mod], "k",
             lazy.layout.up(),
             desc='Move focus up in current stack pane'
             ),
         Key([mod, "shift"], "j",
             lazy.layout.shuffle_down(),
             lazy.layout.section_down(),
             desc='Move windows down in current stack'
             ),
         Key([mod, "shift"], "k",
             lazy.layout.shuffle_up(),
             lazy.layout.section_up(),
             desc='Move windows up in current stack'
             ),
         Key([mod], "h",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),
         Key([mod], "l",
             lazy.layout.grow(),
             lazy.layout.increase_nmaster(),
             desc='Expand window (MonadTall), increase number in master pane (Tile)'
             ),
         Key([mod], "n",
             lazy.layout.normalize(),
             desc='normalize window size ratios'
             ),
         Key([mod], "m",
             lazy.layout.maximize(),
             desc='toggle window between minimum and maximum sizes'
             ),
         Key([mod], "f",
             lazy.window.toggle_floating(),
             desc='toggle floating'
             ),
         Key([mod, "shift"], "f",
             lazy.window.toggle_fullscreen(),
             desc='toggle fullscreen'
             ),
         Key([mod, "shift"], "m",
             lazy.window.toggle_minimize(),
             desc='Minimize'),
         ### Stack controls
         Key([mod, "shift"], "Tab",
             lazy.layout.rotate(),
             lazy.layout.flip(),
             desc='Switch which side main pane occupies (XmonadTall)'
             ),
          Key([mod], "space",
             lazy.layout.next(),
             desc='Switch window focus to other pane(s) of stack'
             ),
         Key([mod, "shift"], "space",
             lazy.layout.toggle_split(),
             desc='Toggle between split and unsplit sides of stack'
             ),
]
group_names = [("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "88c0d0",
                "border_normal": "1D2330"
                }

layouts = [
    #layout.MonadWide(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.Tile(shift_windows=True, **layout_theme),
    layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    #layout.Max(**layout_theme),
    #layout.Stack(num_stacks=2),
    #layout.RatioTile(**layout_theme),
    ##layout.TreeTab(
    #     font = "Ubuntu",
    #     fontsize = 10,
    #     sections = ["FIRST", "SECOND", "THIRD", "FOURTH"],
    #     section_fontsize = 10,
    #     border_width = 2,
    #     bg_color = "1c1f24",
    #     active_bg = "c678dd",
    #     active_fg = "000000",
    #     inactive_bg = "a9a1e1",
    #     inactive_fg = "1c1f24",
    #     padding_left = 0,
    #     padding_x = 0,
    #     padding_y = 5,
    #     section_top = 10,
    #     section_bottom = 20,
    #     level_shift = 8,
    #     vspace = 3,
    #     panel_width = 200
      #   ),
    layout.Floating(**layout_theme)
]

colors = [["#3B4252", "#3B4252"], # panel background
          ["#434C5E", "#434C5E"], # background for current screen tab
          ["#D8DEE9", "#D8DEE9"], # font color for group names
          ["#BF616A", "#BF616A"], # border line color for current tab
          ["#B48EAD", "#B48EAD"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#5E81AC", "#5E81AC"], # color for the 'even widgets'
          ["#EBCB8B", "#EBCB8B"], # window name
          ["#8FBCBB", "#8FBCBB"],
          ["#D08770", "#D08770"],
          ["#CC9966", "#CC9966"],
          ["#88c0d0", "#88c0d0"],
          ["#81a1c1", "#81a1c1"]] # backbround for inactive screens

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font='SpaceMono Nerd Font:style=Regular',
    fontsize = 12,
    padding = 2,
    background=colors[1]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(
                    font = "Iosevka Nerd Font",
                    background = colors[1],
                    foreground = colors[2],
                    inactive = colors[2],
                    active = colors[10],
                    borderwidth = 2,
                    this_current_screen_border = colors[2],
                    this_screen_border = colors[2],
                    other_screen_border = colors[10],
                    other_current_screen_border = colors[10],
                ),
                widget.TaskList(
                    max_title_width = 70
                ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Net(
                    interface="enp34s0",
                    format = '🌐 {down} ↓↑ {up}',
                    background = colors[8]
                ),
                widget.Spacer(
                    length = 5
                ),
                widget.Memory(
                    format = '{MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
                    background = colors[3]
                ),
                widget.Spacer(
                    length = 5
                ),
                widget.TextBox("🔊 ", background = colors[4]),
                widget.PulseVolume(background = colors[4]),
                widget.Spacer(
                    length = 5
                ),
                widget.TextBox("🖥️ ", background = colors[5]),
                widget.ThermalSensor(
                    tag_sensor = "Tdie",
                    background = colors[5]
                ),
                widget.Spacer(
                    length = 5
                ),
                widget.ThermalSensor(
                    tag_sensor = "edge",
                    background = colors[6]
                ),
                widget.Spacer(
                    length = 5
                ),
                widget.Clock(format='%m-%d-%Y %a %I:%M:%S %p', background = colors[7]),
                widget.Spacer(
                    length = 5
                ),
                widget.Systray(background = colors[9])
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(
                    font = "Iosevka Nerd Font",
                    background = colors[1],
                    foreground = colors[2],
                    inactive = colors[2],
                    active = colors[10],
                    borderwidth = 2,
                    this_current_screen_border = colors[2],
                    this_screen_border = colors[2],
                    other_screen_border = colors[10],
                    other_current_screen_border = colors[10],
                ),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CryptoTicker(
                    crypto = 'BTC'
                ),
                widget.CryptoTicker(
                    crypto = 'ETH'
                ),
                widget.Spacer(
                    length =4
                ),
                widget.OpenWeather(
                    cityid = "1721080",
                    update_interval = 300,
                    format = '{location_city}: {main_temp}°{units_temperature} {humidity}%'
                ),
            ],
            24,
        ),
    ),
]

def window_to_prev_group(qtile):
    if qtile.current_window is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.current_window.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.current_window is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.current_window.togroup(qtile.groups[i + 1].name)

def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),      # tastyworks exit box
    Match(title='Qalculate!'),        # qalculate-gtk
    Match(wm_class='kdenlive'),       # kdenlive
    Match(wm_class='pinentry-gtk-2'), # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
