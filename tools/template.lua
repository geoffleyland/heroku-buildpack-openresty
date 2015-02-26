#!/usr/bin/env lua
-- nginx doesn't use variables in its config file, so we have to fake them -
-- for example the port we should listen to comes through as PORT.
-- So here, we take a file and replace all the instances of "%(VARIABLE)"
-- with os.getenv(VARIABLE)

io.write((
  io.read("*a"):gsub("%$%(([%w_]+)%)",
                     function(w) return os.getenv(w) or w end)
  ))

-- io.write is in braces because gsub returns two values - the modified
-- string and the number of substitions it made.  If you're not careful
-- we'd write the number of substitutions to the end of the config file.