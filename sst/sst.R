library(ggplot2)
library(RColorBrewer)

#data: https://www.epa.gov/climate-indicators/climate-change-indicators-sea-surface-temperature

temp <- read.csv("sst.csv")

theme_strip <- theme_minimal()+
  theme(axis.text.y = element_blank(),
        axis.line.y = element_blank(),
        panel.grid.major = element_blank(),
        axis.text.x = element_text(vjust = 3),
        panel.grid.minor = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5),
        legend.title = element_text(hjust = 0.5))

col_strip <- brewer.pal(11, "RdBu")

ggplot(temp, aes(x = Year, y = 1, fill = Anomaly)) +
  geom_tile() +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_continuous(breaks = c(1880, 1890, 1900, 1910, 1920, 1930, 
                                1940, 1950, 1960, 1970, 1980, 1990, 
                                2000, 2010, 2020)) +
  scale_fill_gradientn(guide_legend(title = "Anomaly (°F)"), colors = rev(col_strip)) +
  guides(fill = guide_colorbar(barwidth = 0.5)) +
  labs(title = "Average Global Sea Surface Temperature",
       caption = "Data source: NOAA, 2021") +  
  theme_strip

  