##HOW SEXUAL SELECTION INFLUENCES BODY SHAPE AND SIZE IN 
##FIGHTING TORTOISES

#Meghan Miehe
#date: 2/24/2026
#Version: 4.5.2

##load packages

##read in data file & clean names to remove gaps and capitals 
tort <- read_xls("~/Honours/Git project/Deliverable 2 - repo fork/Deliverable-2-/tort repository/D2---Tortoise-data-/Data/tortoise.data.D2.RAW.xls")%>%
  clean_names()
  
##explore data
summary(tort)
class(tort)

##convert categorical variables into factors
tort <- tort %>%
  mutate(
    sex = as.factor(sex),
    habitat = as.factor(habitat),
    behaviour = as.factor(behaviour)
  )

##change data set to long format
tort_long <- tort %>%
  pivot_longer(
    cols = weight:rear_width,
    names_to = "measurement_type",
    values_to = "measurement_value"
  )

##data is now in long format, with each variable in a column,
##each observation in a row and each value in a cell

##filter to have sex as just M and F
tort_filtered <- tort_long %>%
  filter(sex %in% c("M", "F"))

##filtering the data set for gular length
gular_data <- tort_filtered %>%
  filter(measurement_type == "gular_length")
## now gular_data is a datasaet with just a single measurement per 
##individual and only F and M as sex variables.

##plot a bar chart of gular length against sex, to visialise the 
##difference in size between sex

gular_data <- tort_long %>%
  filter(measurement_type == "gular_length",
         sex %in% c("M", "F"))

##create a gular boxplot with error bars, to visualise the difference 
##between male and females gular length(ie. length of the tortoise.)
ggplot(gular_data, aes(x = sex, y = measurement_value, fill = sex)) +
  stat_summary(fun = mean, geom = "bar", width = 0.4) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) + ##add an error bar to each box
  scale_y_continuous(breaks = seq(0, 50, by = 2)) +
  labs(title = "Gular Length by Sex", ##adding axis titles
       x = "Sex",
       y = "Gular Length(mm)") +
  theme_minimal() +
  scale_fill_manual(values = c("M" = "lightpink", "F" = "lightpink")) +
  theme(
    legend.position = "none",
    panel.grid.major = element_line(color = "grey70"),##add a backrouund grid
    panel.grid.minor = element_line(color = "grey85") ##makes reading the graph easier
  )
##successful plot formatted

##add the same structured plot for plastron length
width_data <- tort_long %>%
  filter(measurement_type == "curved_width",
         sex %in% c("M", "F"))##subsetted the curved width and sex columns
##determin ethe min and max for y axis formation in the plot
range(width_data$measurement_value)

##can now format a box plot for this data
ggplot(width_data, aes(x = sex, y = measurement_value, fill = sex)) +
  stat_summary(fun = mean, geom = "bar", width = 0.4) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) + ##add an error bar to each box
  scale_y_continuous(breaks = seq(0, 300, by = 10)) +
  labs(x = "Sex",                ##adding in axis titles
       y = "Curved width(mm)") +
  theme_minimal() +
  scale_fill_manual(values = c("M" = "lightgreen", "F" = "lightgreen")) +
  theme(
    legend.position = "none",
    panel.grid.major = element_line(color = "grey70"),##add a backrouund grid
    panel.grid.minor = element_line(color = "grey85") ##makes reading the graph easier
  )

##plot all variables against sex, to see comaprisons between them
tort_filtered%>%
  filter(measurement_type != "weight") %>%
  ggplot(aes(x = measurement_type, y = measurement_value, fill = sex)) +
  geom_boxplot(position = position_dodge(width = 0.8),
               outlier.shape = NA) + #remove outliers to expand plots vertically
  coord_cartesian(ylim = c(0, 300)) +
  scale_y_continuous(breaks = seq(0, 300, by = 50)) + #expand y axis 
  theme_bw() +
  labs(x = "Measurement Type",
       y = "Value") +
  scale_fill_manual(values = c("M" = "yellow",##make colour blind friendly
                               "F" = "pink")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
