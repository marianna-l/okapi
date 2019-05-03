library(googleAnalyticsR)
library(tidyverse)
library(lubridate)

googleAnalyticsR::ga_auth()

al <- googleAnalyticsR::ga_account_list()

meta <- googleAnalyticsR::meta

view_id <- al[[215, 9]]

data_ga <- google_analytics(view_id,
                            date_range = c("2018-01-01", "2019-01-01"),
                            metrics = "ga:transactionsPerSession",
                            dimensions = "date")

ggplot(data = data_ga, aes(x = ymd(date), y = transactionsPerSession)) +
  geom_smooth(colour = "snow", size = 2)

