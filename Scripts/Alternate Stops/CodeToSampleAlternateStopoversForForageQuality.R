# Code to bootstrap the stopovers to compare nearby alternatives

#------------------------------------------------------#
#### Set up ####
library(sf)
library(sp)
library(tidyverse)
library(dplyr)
library(lubridate)
library(mapview)
library(MoveTools)
library(terra)
library(patchwork)
library(nngeo)
library(adehabitatHR)
#library(amt)
library(stringr)
library(rgeos)
library(lubridate)
library(parallel)
library(scales)

#------------------------------------------------------#
#### load data ####
load("C:/Users/lwilde2/Desktop/RDH Database/Processed Data/RDH_AllStopovers_14t22_20230425.RData")

test <- SO_all %>% filter(id_yr == "255_2016")

proj <- "+proj=utm +zone=12 +ellps=WGS84 +datum=WGS84 +units=m +no_defs+towgs84=0,0,0"
test <- st_transform(test, proj)

test <- test %>% dplyr::filter(layer != 0) %>% st_cast("POLYGON")

#------------------------------------------------------#
#### set up sequence ####

set.seed(163)


n = 500
xlim = 2000
ylim = 2000

set <- data.frame(xset = runif(n, -xlim, xlim), yset = runif(n, -ylim, ylim))

set.sf <- set %>% st_as_sf(coords = c("xset", "yset"), crs = proj)

#------------------------------------------------------#
#### shift ####

shift <- st_as_sf(test$geometry[1] + set.sf$geometry[1], crs = proj)
orig <- test$geometry[1]
shift2 <-  st_as_sf(test$geometry[1] + set.sf$geometry[2], crs = proj)

mapview(shift) + mapview(orig) + mapview(shift2)

#------------------------------------------------------#
####  ####

#------------------------------------------------------#
####  ####

#------------------------------------------------------#
####  ####

