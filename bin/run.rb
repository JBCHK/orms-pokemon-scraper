require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon")

pokemon = Pokemon.new("Pikachu", "Electric")

pokemon.save

Pokemon.find(1, @db)



