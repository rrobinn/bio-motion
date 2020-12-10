# Robin Sifre <robinsifre@gmail.com>
# Function for converting raw ADOS-2 scores to calibrated severity scores (CSS) for the RRB and SA subscales.
# Assumes Conversions for 2-3 years. 
# Conversions for Mods1-3 taken from Hus, Gotham, & Lord (2015). 
# Conversion for Mod-t taken from Esler et al. (2015)

Convert_ADOS <- function(mod, age_in_months, verbal_flag, SA_raw, RRB_raw) { 
  # Default outout in case of error 
  out = list(RRB_CSS = NA, SA_CSS=NA, warning = NA)
  
  # error checking
  mods = c("ados2-module1", "ados2-module2", "ados2-t")
  if (!(mod %in% mods)) { # Make sure that module is correct
    out$warning=paste('Module', mod, 'is not a valid entry')
    return(out)
    } 
  if (RRB_raw<0 | RRB_raw>10) { # Make sure that RRB raw score is in expected range 
    out$warning=paste('RRB score', RRB_raw, 'is out of allowed range (0-10)')
    return(out)
    } 
  if (SA_raw<0 |SA_raw>20) { # Make sure that RRB raw score is in expected range 
    out$warning=paste('RRB score', RRB_raw, 'is out of allowed range (0-10)')
    return(out)
    } 
  
  if (mod == "ados2-module1" & verbal_flag == 0) {
    
    # Convert RRB score (ranges from 0-8)
    RRB_CSS = switch(RRB_raw + 1, # Add 1 bc it uses indices starting at 1 
                    1, # Raw = 0
                    5, # Raw = 1
                    6, # Raw = 2
                    7, # Raw = 3
                    8, # Raw = 4
                    9, # Raw = 6
                    10, # Raw = 6-8
                    10, # Raw = 6-8
                    10) # Raw = 6-8
    
    # Convert SA 
    SA_CSS = switch(SA_raw + 1,
                   1, # Raw = 0-3      
                   1, # Raw = 0-3 
                   1, # Raw = 0-3
                   1, # Raw = 0-3
                   2, # Raw = 4-5
                   2, # Raw = 4-5
                   3, # Raw = 6-8
                   3, # Raw = 6-8
                   3, # Raw = 6-8
                   4, # Raw = 9
                   5, # Raw = 10-13
                   5, # Raw = 10-13
                   5, # Raw = 10-13
                   5, # Raw = 10-13
                   6, # Raw = 14-16
                   6, # Raw = 14-16
                   6, # Raw = 14-16
                   7, # Raw = 17
                   8, # Raw = 18
                   9, # Raw = 19
                   10) # Raw = 20
    
  }else if (mod == "ados2-module1" & verbal_flag == 1){
    RRB_CSS = switch(RRB_raw + 1,
                    1, # Raw = 0
                    5, # Raw = 1
                    6, # Raw = 2
                    7, # Raw = 3
                    8, # Raw = 4
                    9, # Raw = 5
                    10, # Raw = 6-8
                    10, # Raw = 6-8
                    10) # Raw = 6-8
    
    SA_CSS = switch(SA_raw + 1,
                   1, # Raw = 0-1
                   1, # Raw = 0-1
                   2, # Raw = 2-4
                   2, # Raw = 2-4
                   2, # Raw = 2-4
                   3, # Raw = 5
                   4, # Raw = 6-7
                   4, # Raw = 6-7
                   5, # Raw = 8
                   6, # Raw = 9-11
                   6, # Raw = 9-11
                   6, # Raw = 9-11
                   7, # Raw = 12-13
                   7, # Raw = 12-13
                   8, # Raw = 14-15
                   8, # Raw = 14-15
                   9, # Raw = 16-17
                   9, # Raw = 16-17
                   10, # Raw = 18-20,
                   10,# Raw = 18-20,
                   10 # Raw = 18-20
    )
  } else if (mod == "ados2-module2") {
    RRB_CSS = switch(RRB_raw + 1,
                    1, # Raw = 0
                    5, # Raw = 1
                    6, # Raw = 2
                    7, # Raw = 3
                    8, # Raw = 4
                    9, # Raw = 5-6
                    9, # Raw = 5-6
                    10, # Raw = 7-8
                    10) # Raw = 7-8
    
    SA_CSS = switch(SA_raw + 1,
                   1, # Raw = 0-1 
                   1, # Raw = 0-1
                   2, # Raw = 2-3
                   2, # Raw = 2-3
                   3, # Raw = 4
                   4, # Raw = 5
                   5, # Raw = 6
                   6, # Raw = 7-8
                   6, # Raw = 7-8
                   7, # Raw = 9-10
                   7,# Raw = 9-10
                   8, # Raw = 11
                   9, # Raw=12-14
                   9, # Raw=12-14
                   9,# Raw=12-14
                   10, # Raw = 15-20
                   10,# Raw = 15-20
                   10,# Raw = 15-20
                   10,# Raw = 15-20
                   10# Raw = 15-20)
    )
    
  } else if (mod == "ados2-t") { 
    if (age_in_months<21 | verbal_flag == FALSE) { # If 12-30 months OR non-verbal
      
      RRB_CSS = switch(RRB_raw + 1,
                      1, # Raw = 0
                      5, # Raw = 1-2
                      5, # Raw = 1-2
                      6, # Raw = 3
                      7, # Raw = 4
                      8, # Raw = 5
                      9, # Raw = 6
                      10, # Raw = 7-8
                      10)  # Raw = 7-8
      
      SA_CSS = switch(SA_raw + 1,
                     1, # Raw = 0-2
                     1, # Raw = 0-2
                     1, # Raw = 0-2
                     2, # Raw = 3-4
                     2,# Raw = 3-4
                     3,# Raw = 5-6
                     3, # Raw = 5-6
                     4, # Raw = 7-9
                     4,# Raw = 7-9
                     4,# Raw = 7-9
                     5, # Raw = 10
                     6, # Raw=11-12
                     6, # Raw=11-12
                     7, # Raw=13-14
                     7, # Raw=13-14
                     8, # Raw=15-16
                     8, # Raw = 15-16
                     9, # Raw = 17-18
                     9,# Raw = 17-18
                     10,# Raw = 19-20
                     10) # Raw = 19-20
      
    } else { # Older kids who use single words
      RRB_CSS = switch(RRB_raw + 1,
                      1, # Raw = 0
                      5, # Raw = 1
                      6, # Raw = 2
                      7, # Raw = 3
                      8, # Raw = 4
                      9, # Raw = 5
                      10, # Raw = 6
                      10)  # Raw = 6
      
      SA_CSS = switch(SA_raw + 1, 
                     1, #0-1
                     1, #0-1
                     2, #2-3
                     2, #2-3
                     3, #4-5
                     3, #4-5
                     4, #6-8
                     4, #6-8
                     4, #6-8
                     5, #9-10
                     5, #9-10
                     6, #11
                     7, #12-13
                     7, #12-13
                     8, #14-15
                     8, #14-15
                     9, #16-18
                     9, #16-18
                     9, #16-18
                     10, #19-22
                     10, #19-22
                     10, #19-22
                     10) #19-22 
    } # End if/else check for Age/verbal group within ADOS-T
    
  } # End ADOS-T code 
  
  out$RRB_CSS = RRB_CSS
  out$SA_CSS = SA_CSS
  return(out)
} # End function

