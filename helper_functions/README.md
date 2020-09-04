# Convert_ADOS.R  
## Description  
Function for converting the Autism Dagnositc Observation Schedule (ADOS-2) Social Affect (SA) and Restricted and Repetitive Behavior (RRB) domains into calibrated severity scores.  
Conversations for the toddler module are taken from Esler et al. (2015), and conversions for Mod 1 and Mod 2 are taken from Hus, Gotham, & Lord (2015).  
Function returns a list with converted SA & RRB scores, and warnings (when applicable).  
## Usage  
`Convert_ADOS(mod, age_in_months, verbal_flag, SA_raw, RRB_raw)`  
## Arguments

Input         | Description
------------- | -------------   
`mod` | a string indicating which module is being used. Options are `'ados2-module1'`, `'ados2-module2'`, or `'ados2-t'`.  
`age_in_months` | a double indivating infant's age in months.  
`verbal_flag` | If infant is non-verbal, set to 0. Otherwise, set to 1.  
`SA_raw` | Double indicating raw social affect score.  
`RRB_raw` | Double indicating raw restricted & repetitive behavior score.  

## Example
`Convert_ADOS(mod='ados2-module1', age_in_months=23.4, verbal_flag=0, SA_raw=9, RRB_raw=2)`

# correct_age.R  
`corrected_age <- correct_age(age_months, gest_age_weeks)`

This function converts the infant's <b>age in months</b> to <b>age in months corrected for gestation duration</b>.  It assumes that 40 weeks gestation is full-term.  
For example, if a 2-month infant is born at 39 weeks gestation, they are 1 week early (or, ~0.25 months).  
Therefore, their corrected age is 1.75 months (2 - 0.25).  





