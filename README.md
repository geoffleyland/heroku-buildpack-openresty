# heroku-openresty-buildpack - Get openresty (and Lua) running on Heroku

Most of the brains in this buildpack are shamelessly copied from [Leafo's version](https://github.com/leafo/heroku-buildpack-lua), but it has some differences:

+ This buildpack uses openresty directly, rather than a buildpack that installs lua, and then using a [template](https://github.com/leafo/heroku-openresty) for your project

+ This builds Openresty and LuaRocks from source, so in some sense it's easier to update when there are new releases

For usage, I'll have an example project up soon...


# Issues

+ It'd be nice to build LuaJIT from source (2.1 head?) too, rather than use the one in OpenResty
+ It'd be nice to version the things left in the cache so that old versions can be deleted when they're out of date


## Alternatives

+ Leafo's [heroku-buildpack-lua](https://github.com/leafo/heroku-buildpack-lua)
+ Davidad's [heroku-buildpack-openresty](https://github.com/davidad/heroku-buildpack-openresty)