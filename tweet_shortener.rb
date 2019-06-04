# Write your code here.
require 'pry'

def dictionary
  {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  #transform tweet into an array that contains each word as an element
  tweet_as_array = tweet.split
  #in order to replace the inefficient word with its shorter version, we'll need to eventually reference its index, so pair this info with each element we examine
  tweet_as_array.each_with_index do |word, index|
    #create an array of dictionary's keys and reference them one at a time
    dictionary.keys.each do |key|
      if word == key
        #if above condition is true, replace current array element
        tweet_as_array[index] = dictionary[key]
      end
    end
  end
  #convert updated array back to tweet
  tweet_as_array.join(" ")
end


def bulk_tweet_shortener(array_of_tweets)
  array_of_tweets.each do |tweet|
    tweet_as_array = tweet.split
    tweet_as_array.each_with_index do |word, index|
      dictionary.keys.each do |key|
        if word == key || word == key.capitalize
          tweet_as_array[index] = dictionary[key]
        end
      end
    end
    puts tweet_as_array.join(" ")
  end
end


def selective_tweet_shortener(tweet)
  #binding.pry
  if tweet.size > 140
    tweet_as_array = tweet.split
    tweet_as_array.each_with_index do |word, index|
      dictionary.keys.each do |key|
        if word == key || word == key.capitalize
          tweet_as_array[index] = dictionary[key]
        end
      end
    end
    tweet_as_array.join(" ")
  else
    tweet
  end
end


def shortened_tweet_truncator(tweet)
  if tweet.size > 140
    tweet_as_array = tweet.split
    tweet_as_array.each_with_index do |word, index|
      dictionary.keys.each do |key|
        if word == key || word == key.capitalize
          tweet_as_array[index] = dictionary[key]
        end
      end
    end
    shortened_tweet = tweet_as_array.join(" ")
    if shortened_tweet.size > 140
      shortened_tweet[0..136] + "..."
      #binding.pry
    else
      shortened_tweet
    end
  else
    tweet
  end
end
