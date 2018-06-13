require_relative "environment"
require 'pry'


Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

Pokemon.find(1, @db)
