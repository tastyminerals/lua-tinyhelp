#!/usr/bin/env python3

import sys
import codecs
import urllib
from bs4 import BeautifulSoup


if sys.version_info[0] == 3:
    from urllib.request import urlopen
else:
    from urllib import urlopen


url = "https://www.lua.org/manual/{0}/manual.html".format(sys.argv[1])
page = urlopen(url)
html = page.read()

soup = BeautifulSoup(html, "html.parser")

man = soup.get_text()
print(man)

