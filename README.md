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

To update a map, just replace the file found in `public/maps/MWO/`. To update a map, check `views/MWO_maps.ejs`. The `data-size` field has to be set for the correct distance measurement. The easierst way is to set it to `1000x1000`, measure the length of the grid box e.g. `100` so you have to multiply your settings with `5`, due to `500 / 100 = 5`.
