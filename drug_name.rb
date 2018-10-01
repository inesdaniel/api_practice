require 'unirest'

p "type in a medication name"
drug_name = gets.chomp

response = Unirest.get("https://rxnav.nlm.nih.gov/REST/rxclass/spellingsuggestions.json?term=#{drug_name}&type=DRUG")

puts JSON.pretty_generate(response.body['suggestionList']['suggestion'])