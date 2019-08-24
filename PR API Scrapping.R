# Title     : Twitter API Scraping
# Objective : To Scrap Twitter with API

# Step 1: Install and load rtweet package 

#install.packages("rtweet")
#library(rtweet)

#install.packages("devtools")
#library(devtools)
#install_github("mkearney/rtweet")
library(rtweet)

# Step 2: API Authorization 

# Find out how to get consumer_key and consumer_secret here: 
# https://www.nurandi.id/blog/twitter-authentication-dengan-r/
# https://www.nurandi.id/blog/rtweet-crawling-data-twitter-menggunakan-r/

# Option 1 - not working 
# token <- create_token(
#   consumer_key = "r8j6JhG8nhoRWW2oib0N5P1sx",
#   consumer_secret = "r8QXIBWIhhz30KpeRBEW9NVKHKBBOvSvZLfS8pk0bKr10fNzxC")

# With access token / secret
token <- create_token(
  consumer_key = "4OF8QCNlOHzxemZKUFeuARDI4",#"xxxxG8nhoRWW2oib0N5P1sx",
  consumer_secret = "p943ntn1HVLVpBSWBIaXqpsmjCjTmjDllikdW8icMOyi5y95sQ",#"xxxxxxrWIhhz30KpeRBEW9NVKHKBBOvSvZLfS8pk0bKr10fNzxC",
  access_token = "161673589-Mcf2LR8aXCL1pLjFgZK5ZhWEqvHrLvYLxnMV77p0",#"xxxxxxx-j6Tmxt1k1jYSXEMkasJIM7FS0T94K2YWlnxI1wi46",
  access_secret = "wmRbrC0SDhIuEMCvSt5rRNMplsts3Gj6B5k73QXXZmwOO")#"xxxxxxxx29Z578DG1LPxHGfGMjZicHkpaCpx7q9WaWheQU")

# Step 3: Crawling Data Twitter 

# Define your twitter username 
my_username='lizardius_k'

# Setelah proses otentikasi berhasil, kita siap untuk “menambang” data (crawling) dari Twitter. Untuk kepeluan ini, rtweet mengemas berbagai fungsi yang cukup lengkap, di antaranya:
#   
#   search_tweets() : mencari tweet dengan kata kunci tertentu
# lookup_users() : menampilkan data detail dari satu atau lebih user(s)
# get_timelines() : menampilkan status/tweet yang pernah diposting oleh user tertentu aka timeline
# get_followers() : menampilkan list followers dari user tertentu
# get_friends() : menampilkan list fiends/followings atau yang di-follow user tentu
# dan masih banyak yang lain seperti untuk menampilkan retweet, siapa yang me-retweet, mendapatkan list favorite, menampilkan trending topics, cleansing tweet, dan juga ekspor data ke file csv.

# find 1000 tweets with keywords: "#WhenYouWerentLooking"
tweet <- search_tweets(q = "#WhenYouWerentLooking", n = 5000)

# to know the column names of tweet 
colnames(tweet)
dim(tweet)

# let's take a look at three columns
k <- tweet[,c("created_at", "screen_name", "text")]

#Save Tweet
write.csv(k,"TweetWhenYouWerentLooking.csv")

# Remember!
# "kota bogor" - kata “kota” dan kata “bogor” (tidak memperhatikan urutan)
# "\"kota bogor\"" - 	frase “kota bogor”
# "kota OR bogor"	kata “kota” atau kata “bogor” atau keduanya
# "kota -bogor"	kata “kota” tapi tidak memuat kata “bogor”
# "#bogor"	hashtag “bogor”
# "@bogor"	mention “bogor”

# Menampilkan timeline atau status/tweet terbaru yang pernah di-posting oleh satu atau beberapa user(s). Setiap user akan ditampilkan hingga maksimal 3.200 tweet.
# menampilkan timeline dari arikunc0r0
timeline <- get_timeline(my_username)

# filter or select three columns
timeline[,c("created_at", "source", "text")]

# Menampilkan data detail dari satu atau lebih akun/user(s).
user <- lookup_users(my_username)

# filter or select three columns
user[,c("created_at", "screen_name", "name", "location", "description")]

head(user)

# followers <- get_followers()
# followings <- get_friends()
# lookup_users(followings$user_id)


