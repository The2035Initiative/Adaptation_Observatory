library(plotly)
library(dplyr)

# Columns to calculate percentages for Yes or No responses
cols_to_calc <- c("flood_year", "housing_damage", "property_loss", "contact_authority",
                  "flood_close", "stay_residence", "enough_eat", "move_rural_urban")

# Calculate percentages
multi_rep_percs <- multiple_responses %>%
  mutate(across(where(is.character), ~ifelse(. %in% c(NA, "NA"), "Not Shared", .)),
         across(where(is.numeric), ~ifelse(is.na(.), "Not Shared", .))) %>%
  mutate(path = paste(region, gender, demo_gender, age, demo_age,
                      flood_year, housing_damage, property_loss, contact_authority,
                      flood_close, stay_residence, enough_eat, move_rural_urban,
                      sep=">")) %>%
  group_by(path) %>%
  summarise(across(all_of(cols_to_calc),
                   list(
                     Yes = ~sum(. == "Yes" | . == "yes") / n(),
                     No = ~sum(. == "No" | . == "no") / n(),
                     `Not Shared` = ~sum(. == "Not Shared") / n()
                   ))) %>%
  ungroup() %>%
  mutate(path = paste(path, "Yes", sep=":")) %>%
  rename(label = path) %>%
  select(label, ends_with("_Yes"), ends_with("_No"), ends_with("_Not Shared"))

# Create hover template dynamically
hover_template <- paste(
  "<b>Path:</b> %{label}<br>",
  "<b>%{param}</b>: %{customdata[0]:.2f}%<br>",
  "<b>No:</b> %{customdata[1]:.2f}%<br>",
  "<b>Not Shared:</b> %{customdata[2]:.2f}%<extra></extra>"
)

# Plot using plotly
p <- plot_ly(data = multi_rep_percs, type = 'sunburst',
             ids = ~label,
             labels = ~label,
             parents = ~NA,
             customdata = ~list(Yes_Yes, No_No, `Not Shared_Not Shared`),
             hovertemplate = hover_template)

P

p <- plot_ly(data = multi_rep_percs, type = 'sunburst',
             ids = ~label,
             labels = ~label,
             parents = ~NA,
             customdata = ~list(Yes, No, `Not Shared`),
             #hovertemplate = hover_template
) #%>%
add_trace(
  values = ~Yes * 100,
  name = "Yes",
  marker = list(colors = 'green'),
  domain = list(column = 0)
) %>%
  add_trace(
    values = ~No * 100,
    name = "No",
    marker = list(colors = 'red'),
    domain = list(column = 1)
  ) %>%
  add_trace(
    values = ~`Not Shared` * 100,
    name = "Not Shared",
    marker = list(colors = 'gray'),
    domain = list(column = 2)
  ) %>%
  layout(
    title = "Sunburst Plot with Percentage Breakdown",
    xaxis = list(domain = c(0, 0.33)),
    yaxis = list(domain = c(0, 1))
  )

# Show plot
p



# Filter numeric columns
numeric_cols <- multi_rep_percs %>%
  select(where(is.numeric))

# Define custom hover template dynamically
hover_template <- numeric_cols %>%
  imap_chr(~ {
    percentages <- ifelse(is.na(.x), "Not Disclosed", paste0(round(100 * .x, 2), "%"))
    paste0(.y, ": ", percentages, "<br>")
  }) %>%
  paste(collapse = "") %>%
  paste("Path: %{label}<br>", ., "<extra></extra>", sep = "")paste("Path: %{label}<br>", ., "<extra></extra>", sep = "")

# Define custom hover template dynamically
hover_template <- numeric_cols %>%
  imap_chr(~ {
    percentages <- ifelse(is.na(.x), "Not Disclosed", paste0(round(100 * .x, 2), "%"))
    paste0(.y, ": ", percentages, "<br>")
  }) %>%
  paste(collapse = "") %>%
  paste("Path: %{label}<br>", ., "<extra></extra>", sep = "")




# Filter out non-numeric columns
numeric_cols <- multi_rep_percs %>%
  select(where(is.numeric))

# Define custom hover template dynamically
hover_template <- numeric_cols %>%
  imap_chr(~ {
    percentages <- ifelse(is.na(.x), "Not Disclosed", paste0(round(100 * .x, 2), "%"))
    paste0(.y, ": ", percentages, "<br>")
  }) %>%
  paste(collapse = "") %>%
  paste("Path: %{label}<br>", ., "<extra></extra>", sep = "")


