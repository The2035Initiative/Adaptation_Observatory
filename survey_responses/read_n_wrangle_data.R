# function to load the data 
read_n_wrangle_data <- function(file_path) {
  # Read data
  responses <- read_csv(file_path, show_col_types = FALSE)
  
  # Select and clean columns
  demos <- responses %>%
    dplyr::select(IPAddress, age, gender, region, LocationLatitude, LocationLongitude, demo_age, demo_gender,
                  # Impact of floods
                  flood_year, housing_damage, property_loss, contact_authority, flood_close,
                  # Socioeconomic factors & resiliency / scarcity 
                  stay_residence, flood_prepared, housing_safe, enough_eat, move_rural_urban, demo_income, 
                  # Sentiments 
                  climate_problem, trust_government) %>%
    
    janitor::clean_names() %>%
    
    mutate(location_latitude = as.numeric(location_longitude),
           location_longitude = as.numeric(location_longitude)) %>%
    
    # Remove incomplete geolocations
    filter(complete.cases(location_latitude, location_longitude)) %>% 
    
    # Remove rows with missing or non-numeric longitude or latitude values
    filter(!is.na(location_longitude) & !is.na(location_latitude)) %>% 
    
    # Count the occurrences of each IPAddress
    group_by(ip_address) %>%
    
    mutate(number_of_surverys_submitted = n()) %>%
    
    ungroup() %>%
    # remove first two rows
    # this is because there's facebook survey questions
    # if you want to see the questions, look first before running this line
    slice(-c(1, 2))
  
  return(demos)
}
