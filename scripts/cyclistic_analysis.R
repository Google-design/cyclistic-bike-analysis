# Load data
df_2019 <- read_excel("Divvy_Trips_2019_Q1.xlsx")
df_2020 <- read_excel("Divvy_Trips_2020_Q1.xlsx")

# Clean column names
df_2019 <- clean_names(df_2019)
df_2020 <- clean_names(df_2020)

# Rename to unify structure
df_2019 <- df_2019 %>% 
  rename(ride_id = trip_id, 
         rideable_type = bikeid,
         started_at = start_time,
         ended_at = end_time,
         member_casual = usertype)

# Convert date columns
df_2019$started_at <- ymd_hms(df_2019$started_at)
df_2019$ended_at <- ymd_hms(df_2019$ended_at)
df_2020$started_at <- ymd_hms(df_2020$started_at)
df_2020$ended_at <- ymd_hms(df_2020$ended_at)

# Combine both datasets
df_all <- bind_rows(df_2019, df_2020)

# Add new columns
df_all <- df_all %>%
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),
    day_of_week = wday(started_at, label = TRUE),
    hour = hour(started_at)
  ) %>%
  filter(ride_length > 1 & ride_length < 1440)

# Summary statistics
summary_stats <- df_all %>%
  group_by(member_casual) %>%
  summarise(
    avg_duration = mean(ride_length),
    median_duration = median(ride_length),
    max_duration = max(ride_length),
    total_rides = n()
  )
print(summary_stats)

# Plot 1: Ride Duration by User Type
ggplot(df_all, aes(x = member_casual, y = ride_length)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 60)) +
  labs(title = "Ride Duration Distribution by User Type", y = "Duration (minutes)", x = "")

# Plot 2: Rides by Day of Week
ggplot(df_all, aes(x = day_of_week, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(title = "Ride Count by Day of Week", x = "Day", y = "Number of Rides")

# Plot 3: Rides by Hour
ggplot(df_all, aes(x = hour, fill = member_casual)) +
  geom_histogram(binwidth = 1, position = "dodge") +
  labs(title = "Hourly Ride Usage", x = "Hour of Day", y = "Number of Rides")
