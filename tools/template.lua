#!/usr/bin/env lua
-- nginx doesn't use external variables in its config file, so we have to fake them -
-- for example the port we should listen to comes through as PORT.
-- So here, we take a file and replace all the instances of "${{VARIABLE}}"
-- with os.getenv(VARIABLE).
-- We also understand ${{VARIABLE:-default}} syntax, which proves useful if
-- you're trying to run locally as well as on Heroku.  For example, if
-- PORT is not defined locally, you can (in nginx.conf) go
-- listen ${{PORT:-8080}};
-- and it'll connect to 8080 when running locally.
-- We use double curly braces to be different from nginx internal variable syntax

io.write((io.read("*a"):gsub("%${(%b{})}", function(w)
      w = w:sub(2,-2)
      local variable, default = w:match("(.+):[-=](.+)")
      return os.getenv(variable or w) or default or w
    end
  )))

-- io.write has double braces because gsub returns two values - the modified
-- string and the number of substitions it made.  If you're not careful
-- we'd write the number of substitutions to the end of the config file.