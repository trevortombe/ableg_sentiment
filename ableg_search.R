###########################################################
# Fetches the past 10,000 tweets from #ableg once per day #
###########################################################
install.packages("rtweet")
require(rtweet)
tl<-search_tweets("#ableg",n=1000)

# Store the results for later analysis
filename<-paste0("Files/tweets_",Sys.Date(),".RData")
save(tl,file=filename)
