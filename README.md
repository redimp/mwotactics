# mwo tactics

This is a fork of [wottactics](https://github.com/karellodewijk/wottactics). The fork focuses on Mechwarrior: Online.

## Build and run via docker

The easiest way to get the server running is via docker-compose:

```
docker-compose build
docker-compose up
```

And open https://your-server:8000/.

# Updating or adding maps

To update a map, just replace the file found in `public/maps/MWO/` and the grid in `public/icons`

To add a map, copy it to `public/maps/MWO/` and update `views/MWO_maps.ejs`. The `data-size` field has to be set for the correct distance measurement. The easierst way is to set it to `1000x1000`, measure the length of the grid box `l`. 

With `(500 / l) * 1000` ypu can calculate the new datasize, e.g. with `l = 125`

`(500 / 125) * 1000 = 4000`. Set `data-size="4000x4000"`.

