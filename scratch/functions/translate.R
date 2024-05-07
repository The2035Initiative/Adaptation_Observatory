translate_dataframe <- function(df) {
  
  
  # Language codes for each dialect/language
  source_languages <- c("bn", "hi", "gu", "te", "ta", "or", "mr", "ml")
  
  # Function to translate text using Google Translate API
  translate_to_english_google <- function(text, source_languages) {
    # Translate the text to English
    translated_text <- google_translate(text, target_language = "en", source_language = source_languages[1])
    return(translated_text)
  }
  
  # Subset the data by unique language codes in the q_language column
  language_groups <- split(df, df$q_language)
  
  # Translate each group separately
  for (lang_code in names(language_groups)) {
    group_df <- language_groups[[lang_code]]
    
    # Translate demo_age column if it's not NA
    if (!is.na(group_df$demo_age[1])) {
      group_df$demo_age_english <- translate_to_english_google(group_df$demo_age, source_language = lang_code)
    }
    
    # Translate demo_income column if it's not NA
    if (!is.na(group_df$demo_income[1])) {
      group_df$demo_income_english <- translate_to_english_google(group_df$demo_income, source_language = lang_code)
    }
    
    # Update the original dataframe with translated columns
    df[df$q_language == lang_code, paste0("demo_age_english")] <- group_df$demo_age_english
    df[df$q_language == lang_code, paste0("demo_income_english")] <- group_df$demo_income_english
  }
  
  return(df)
}

translate_dataframe <- function(df) {
  # Function to translate text using Google Translate API
  translate_to_english_google <- function(text, source_language) {
    print(paste("Source language:", source_language))  # Debugging print statement
    # Translate the text to English
    translated_text <- google_translate(text, target_language = "en", source_language = source_language)  # Pass the single language code
    return(translated_text)
  }
  
  # Subset the data by unique language codes in the q_language column
  language_groups <- split(df, df$q_language)
  
  # Translate each group separately
  for (lang_code in names(language_groups)) {
    group_df <- language_groups[[lang_code]]
    
    # Translate demo_age column if it's not NA
    if (!is.na(group_df$demo_age[1])) {
      group_df$demo_age_english <- translate_to_english_google(group_df$demo_age, source_language = lang_code)
    }
    
    # Translate demo_income column if it's not NA
    if (!is.na(group_df$demo_income[1])) {
      group_df$demo_income_english <- translate_to_english_google(group_df$demo_income, source_language = lang_code)
    }
    
    # Update the original dataframe with translated columns
    df[df$q_language == lang_code, paste0("demo_age_english")] <- group_df$demo_age_english
    df[df$q_language == lang_code, paste0("demo_income_english")] <- group_df$demo_income_english
  }
  return(df)
}
translate_dataframe <- function(df) {
  # Function to translate text using Google Translate API
  translate_to_english_google <- function(text, source_language) {
    # Translate the text to English
    translated_text <- google_translate(text, target_language = "en", source_language = source_language)
    return(translated_text)
  }
  
  # Get unique language codes from the q_language column
  language_codes <- unique(df$q_language)
  
  # Iterate through each language group
  for (lang_code in language_codes) {
    # Subset data for the current language group
    group_df <- df[df$q_language == lang_code, ]
    
    # Translate demo_age column if it's not NA
    if (!is.na(group_df$demo_age[1])) {
      group_df$demo_age_english <- translate_to_english_google(group_df$demo_age, source_language = lang_code)
    }
    
    # Translate demo_income column if it's not NA
    if (!is.na(group_df$demo_income[1])) {
      group_df$demo_income_english <- translate_to_english_google(group_df$demo_income, source_language = lang_code)
    }
    
    # Update the original dataframe with translated columns
    df[df$q_language == lang_code, paste0("demo_age_english_", lang_code)] <- group_df$demo_age_english
    df[df$q_language == lang_code, paste0("demo_income_english_", lang_code)] <- group_df$demo_income_english
  }
  
  return(df)
}