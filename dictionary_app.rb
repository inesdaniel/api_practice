# The program should ask the user to enter a word, then use the wordnik API to show 
# the word’s definition, top example, and pronunciation:

# ask user to enter word
# obtain definition
# get correct from response

require 'unirest'

p "Enter a word:"

word = gets.chomp

response = Unirest.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
example = Unirest.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=")
pronunciation = Unirest.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=")

definition = response.body[0]["text"]
top_example = example.body["examples"][0]["text"]
top_pronounciation = pronunciation.body[0]["raw"]

p "#{word} is #{definition}, it is pronounced #{top_pronounciation}. An example is: #{top_example}."
