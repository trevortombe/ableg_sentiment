###########################################################
# Fetches the past 10,000 tweets from #ableg once per day #
###########################################################

# Install and load the necessary package
install.packages("rtweet")
require(rtweet)

# Load the Twitter API token. Stored as GitHub secrets.
your_token <- rtweet::create_token(
  app = "vaccineplots",
  consumer_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET"),
)

# Fetch the latest tweets from #ableg
# 10k is more than sufficient for a single day. Will need to delete duplicates later when merging.
tl<-search_tweets("#ableg",n=10000,retryonratelimit=TRUE,token=your_token)

# Store the results for later analysis
filename<-paste0("Files/tweets_",Sys.Date(),".RData")
save(tl,file=filename)
