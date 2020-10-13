# ResiRaster
Convert residential points (vector) to raster.

## Coverage
The raster illustrates residential dwellings in Sheffield.

## Use
The initial use of the residential raster is as a background layer for maps of Covid 19 clusters. A household cluster can only be mapped to a residential dwelling. The raster helps to explain whether a spatial gap in clusters is because of a low infection rate or because there are no homes there e.g. it's an industrial area or a golf course.  

The raster could be useful when mapping other household related information.

## Source Data
The data source is the Council's LLPG (Local Land Property Gazetteer).

## Vectors
The same information can be illustrated using the orginal vector data, but it takes a long time to display.

## Vector to Raster Conversion
The [ArcGIS Point to Raster tool](https://pro.arcgis.com/en/pro-app/tool-reference/conversion/point-to-raster.htm) is only available with an Advanced license, which the Council doesn't have. So I turned to the excellent [Geocomputation in R](https://geocompr.robinlovelace.net/), and in particular the section on [rasterization](https://geocompr.robinlovelace.net/geometric-operations.html#rasterization).
