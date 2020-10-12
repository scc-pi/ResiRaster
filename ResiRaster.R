library(tidyverse); library(sf); library(raster)

# Set variables
geodb = "ResiRaster.gdb"

# TODO: Use LLPG on Portal or update local LLPG copy

# Read LLPG and filter out non residential
resi <- st_read(dsn = geodb, layer = "llpg") %>% 
  filter(primaryclassification == "Residential") %>% 
  filter(secondaryclassification %in% c("Dwellings", "Houses in Multiple Occupation", 
                                        "Residential Institutions", ""))

# Cast from multi-point to point
resi <- st_cast(resi, "POINT")

# TODO: iterate through array of resolution sizes - template & file name?

# Create a raster object to put the residential points in
resolution_size = 25
raster_template = raster(extent(resi), 
                         resolution = resolution_size,
                         crs = st_crs(resi)$proj4string)

# Convert the residential points (vector) to raster
resi_raster = rasterize(resi, raster_template, field = 1)

# TODO: arc.write to write to geodatabase or write to Portal?

# Write raster to a file
writeRaster(resi_raster, str_c("resi_raster_res", resolution_size), overwrite=TRUE)