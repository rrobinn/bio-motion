# Convert_ADOS.R  
Function for converting the Autism Dagnositc Observation Schedule (ADOS-2) Social Affect (SA) and Restricted and Repetitive Behavior (RRB) domains into calibrated severity scores.  
Conversations for the toddler module are taken from Esler et al. (2015), and conversions for Mod 1 and Mod 2 are taken from Hus, Gotham, & Lord (2015).  

# correct_age.R  
`corrected_age <- correct_age(age_months, gest_age_weeks)`

This function converts the infant's <b>age in months</b> to <b>age in months corrected for gestation duration</b>.  It assumes that 40 weeks gestation is full-term.  
For example, if a 2-month infant is born at 39 weeks gestation, they are 1 week early (or, ~0.25 months).  
Therefore, their corrected age is 1.75 months (2 - 0.25).  





