{ pkgs, config, ... }:

{

home.file = {
  ".config/qutebrowser/config.py".text = ''
# Autogenerated config.py
import subprocess
import os
from qutebrowser.api import interceptor

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig(True)
config.source('/home/sorath/.config/qutebrowser/themes/distrotube.py')
c.content.user_stylesheets = ['~/.config/qutebrowser/schemes/minimal.css']
# Aliases for commands.
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}
c.auto_save.session = False
c.auto_save.interval = 4000
c.statusbar.position = 'top'
c.content.autoplay = False
# Setting dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.grayscale.all = True
c.colors.webpage.darkmode.grayscale.images = 0.5
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.policy.page = 'smart'
c.colors.webpage.darkmode.contrast = 1

c.colors.webpage.bg = '#111111'

c.completion.cmd_history_max_items = 100
c.content.cache.maximum_pages = 500

c.content.cookies.accept = 'no-unknown-3rdparty'
c.content.javascript.enabled = False
c.downloads.location.directory = '/home/sorath/Transferências'



c.content.javascript.clipboard = 'none'
c.content.media.audio_capture = False
c.content.media.audio_video_capture = False
c.content.pdfjs = True
c.content.webgl = True
c.scrolling.smooth = True
c.scrolling.bar = 'never'
c.content.dns_prefetch = True
c.content.headers.do_not_track = True
c.qt.args = ['disable-logging', 'disable-reading-from-canvas']

c.tabs.show = "multiple"
c.statusbar.show = "never"

config.bind('<less>', 'home')
config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
config.bind(':', 'set-cmd-text :')
config.bind('v', 'hint links spawn ${pkgs.mpv}/bin/mpv --loop {hint-url}')
config.bind('<Ctrl-Down>', 'hint links download')
config.bind('<Ctrl-y>', 'hint links yank')
config.bind('<Ctrl-x>', 'hint images delete')
config.bind('<Space><Space>', 'hint links current')
config.bind('<Space>x', 'hint links tab-bg')
config.bind('<Space>c', 'hint links tab-fg')
config.bind('<Space>v', 'hint --rapid links tab-bg')
config.bind('<Alt-Space>', 'hint images current')
config.bind('<Space>s', 'hint images tab-bg')
config.bind('<Space>d', 'hint --rapid images tab-bg')
config.bind('<Space>f', 'hint images tab-fg')
config.bind('<Ctrl-Alt-p>', 'print')
config.bind('@', 'macro-run')
config.bind('i', 'hint inputs')
config.bind('x', 'tab-next')
config.bind('z', 'tab-prev')
config.bind('ct', 'tab-only')
config.bind('<Right>', 'tab-next')
config.bind('<Left>', 'tab-prev')
config.bind('<Ctrl-o>', 'set-cmd-text :open {url:pretty}')
config.bind('<Ctrl-Right>', 'tab-move +')
config.bind('<Ctrl-Left>', 'tab-move -')
config.bind('<Return>', 'hint-follow', mode='hint')

## Bindings for insert mode
config.bind('<Alt-Space>', 'edit-text', mode='insert')

# Fix random position on workspace change
config.bind('<tab>', 'nop', mode='normal')

# Bindings for normal mode
config.bind('st', 'session-load -c trader')
config.bind('sx', 'session-load -c xxx')
config.bind('sh', 'session-load -c startpage')
config.bind('sl', 'set-cmd-text :session-load')
config.bind('ss', 'set-cmd-text :session-save')
config.bind('sd', 'set-cmd-text :session-delete  ')
config.bind('q', 'tab-close')
config.bind('<Alt-z>', 'back')
config.bind('<Alt-x>', 'forward')
config.bind('Z', 'back -t')
config.bind('X', 'forward -t')
config.bind('gd', 'download')
config.bind('gf', 'view-source')
config.bind('wi', 'inspector')
config.bind('wp', 'open -w -- {clipboard}')
config.bind('aa', 'set-cmd-text -s :quickmark-add {title} {url} ')

# Whether host blocking is enabled.
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/mmotti/pihole-regex/master/regex.list', 'https://dbl.oisd.nl/', 'https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-YouTube-AdBlock.txt', 'http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip', 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext', 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/easylist-downloads.adblockplus.org/easyprivacy.txt", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/thirdparties/pgl.yoyo.org/as/serverlist", "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts", "https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt", "https://fanboy.co.nz/fanboy-problematic-sites.txt", "https://easylist.to/easylist/easylist.txt", "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt"
    ]
'';
};

home.file = {
  ".config/qutebrowser/themes/distrotube.py".text = ''
c.colors.completion.fg = ['#9cc4ff', 'white', 'white']
c.colors.completion.odd.bg = '#1c1f24'
c.colors.completion.even.bg = '#232429'
c.colors.completion.category.fg = '#e1acff'
c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #232429)'
c.colors.completion.category.border.top = '#3f4147'
c.colors.completion.category.border.bottom = '#3f4147'
c.colors.completion.item.selected.fg = '#000000'
c.colors.completion.item.selected.bg = '#74418a'
c.colors.completion.item.selected.border.top = '#74418a'
c.colors.completion.item.selected.border.bottom = '#74418a'
c.colors.completion.item.selected.match.fg = '#c678dd'
c.colors.completion.match.fg = '#c678dd'
c.colors.completion.scrollbar.fg = 'white'
c.colors.downloads.bar.bg = '#282c34'
c.colors.downloads.error.bg = '#ff6c6b'
c.colors.hints.fg = '#282c34'
c.colors.hints.match.fg = '#98be65'
c.colors.messages.info.bg = '#282c34'
c.colors.statusbar.normal.bg = '#282c34'
c.colors.statusbar.insert.fg = 'white'
c.colors.statusbar.insert.bg = '#497920'
c.colors.statusbar.passthrough.bg = '#34426f'
c.colors.statusbar.command.bg = '#282c34'
c.colors.statusbar.url.warn.fg = 'yellow'
c.colors.tabs.bar.bg = '#1c1f34'
c.colors.tabs.odd.bg = '#282c34'
c.colors.tabs.even.bg = '#282c34'
c.colors.tabs.selected.odd.bg = '#282c34'
c.colors.tabs.selected.even.bg = '#282c34'
c.colors.tabs.pinned.odd.bg = 'seagreen'
c.colors.tabs.pinned.even.bg = 'darkseagreen'
c.colors.tabs.pinned.selected.odd.bg = '#282c34'
c.colors.tabs.pinned.selected.even.bg = '#282c34'
c.colors.contextmenu.menu.bg = '#111111'
c.colors.contextmenu.selected.bg = '#0080FF'
c.colors.contextmenu.menu.fg = '#FFFFFF'
c.colors.contextmenu.selected.fg = '#FFFFFF'
c.colors.contextmenu.disabled.fg = '#666666'
c.colors.webpage.bg = '#000000'
'';
};

home.file = {
  ".config/qutebrowser/schemes/minimal.css".text = ''
  /* Minimal CSS */

body a, body a:link, body a *:not(img), body a:link *:not(img) {
  color: #30C5FF !important;
  background-color: rgba(60, 60, 60, 0) !important;
}

body a:visited, body a:visited *:not(img) {
  color: #666666 !important;
  background-image: none !important;
  background-color: rgba(60, 60, 60, 0) !important;
}

body a:hover, body a:active, body a:hover *:not(img), body a:visited *:not(img) {
  color: #FFFFFF !important;
  background-image: none !important;
  background-color: rgba(60, 60, 60, 0) !important;
}
'';
};

}
