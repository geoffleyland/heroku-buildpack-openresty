#!/usr/bin/env lua
-- Luarocks won't install dependencies in rocks from URLs.
-- That's sensible when it's a general package distribution tool,
-- but when we're using it as a tool for setting up a server, we
-- might want to add packages that aren't necessarily interesting
-- for the general public.
-- So here, we do a nasty hack, and install everything in an
-- "extras" table in the rock.
local rockspec = arg[1]

loadfile(rockspec)()

if extras then
  for _, e in ipairs(extras) do
    os.exec("luarocks install "..e)
  end
end