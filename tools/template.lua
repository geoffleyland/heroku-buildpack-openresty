#!/usr/bin/env lua
io.write((io.read("*a"):gsub("%$%(([%w_]+)%)", function(w) return os.getenv(w) or w end)))