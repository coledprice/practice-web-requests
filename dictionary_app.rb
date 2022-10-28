require "http"

system "clear"

puts "Enter a word"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=APIKEY")

definition = response.parse(:json)

response2 = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=APIKEY")

pron_data = response2.parse(:json)

puts "The definition of #{word} is: #{definition[1]["text"]}"

puts "pronounciation: #{pron_data[0]["raw"]}"

response3 = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=APIKEY")

example = response3.parse(:json)

puts "example: #{example["text"]}"
