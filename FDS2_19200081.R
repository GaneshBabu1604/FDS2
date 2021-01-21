
library(sf)
library(dplyr)
age_cty=st_read("ages.json")
LEINSTER <-c("CARLOW","DUBLIN","KILDARE","KILKENNY","LAOIS","LONGFORD","LOUTH","MEATH","OFFALY","WESTMEATH","WEXFORD","WICKLOW")
age_lein <- age_cty %>% filter(COUNTY %in% LEINSTER)
# Moran's Scatter Plot
moran.plot(age_lein$Mean_Age,nb2listw(poly2nb(age_lein),style='W'),xlab = 'Mean Age',ylab='Spatially Lagged Mean Age')
# Moran's Analytical Test
moran.test(age_lein$Mean_Age,nb2listw(poly2nb(age_lein),style='W'))
# Moran's Monte-Carlo Test
moran.mc(age_lein$Mean_Age,nb2listw(poly2nb(age_lein),style='W'),nsim=999)
