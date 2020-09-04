correct_age <- function(age_months, gest_age_weeks) {
  avg_days_in_month = 365/12
  
  corrected_age_months = NA
  if (is.na(gest_age_weeks)) { return(corrected_age_months)}
  
  # convert age in months --> weeks  
  age_days = age_months * avg_days_in_month
  age_weeks = age_days/7
  
  # Correct age in weeks 
  corrected_age_weeks = age_weeks + (gest_age_weeks - 40) # If born < 40 weeks, then subtract from age. If born > 40 weeks, add to age. 
  
  # For most accurate conversion back to months, convert to days first 
  corrected_age_days = corrected_age_weeks * 7 
  corrected_age_months = corrected_age_days / avg_days_in_month  
  
  return(corrected_age_months)

  }