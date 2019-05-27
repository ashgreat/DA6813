
# Make sure that you have your Twitter token loaded in the global environment

library(rtweet)

mex_loc <- c(mexico_city = "19.43,-99.13,50mi",
             guadalajara = "20.67,-103.35,50mi",
             monterrey   = "25.67,-100.3,50mi",
             puebla      = "19.03,-98.18,50mi",
             toluca      = "19.28,-99.66,50mi")

# I have added the 5 largest metropolitan areas in Mexico above. You can add more.

myquery <- "#FelizLunes" # Add your query here.

mytweets <- list()

for (i in 1:length(mex_loc)) {
  mytweets[[i]] <- search_tweets(q = myquery,
                              n = 5000,
                              lang = "es",
                              geocode = mex_loc[i],
                              include_rts = FALSE,
                              retryonratelimit = TRUE)
}

tweet_dt <- data.table::rbindlist(mytweets)
