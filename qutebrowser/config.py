#!/usr/bin/python
# Author: Sofiane DJERBI (@Kugge)
# qutebrowser's config file.

# Set google as default search engine
c.url.searchengines["DEFAULT"] = "https://www.google.com.ar/search?q={}"

# Change startpage
c.url.start_pages = ['google.com']

# Uses mpv for youtube videos (with hint)
config.bind("M", "hint links spawn mpv {hint-url}")

# Change encoding
c.content.default_encoding = "utf-8"

# Change default font
c.fonts.default_family = "scientifica"
c.fonts.default_size = "12pt"
c.fonts.web.family.standard = "scientifica"

# Do not load autoconfig.
config.load_autoconfig(False)

