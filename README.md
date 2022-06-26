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

To add a map, copy it to `public/maps/MWO/` and update `views/MWO_maps.ejs`. The `data-size` field has to be set for the correct distance measurement. The easierst way is to set it to `1000x1000`, measure the length of the grid box `l`. With
   500 / l = f
you can calculate the correct value `v`

   v = l * f

e.g. with `l = 120` 

   f = 500 / 120 = 4

and 

   v =  120 * 4 = 480

so that data-size="480*480".

