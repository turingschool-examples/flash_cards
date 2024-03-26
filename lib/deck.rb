# require './lib/card' don't need this because you're creating the card in the test
# if you are 

class Deck

	attr_reader :cards

	def initialize(cards)
		@cards = cards
	end

	def count
		cards.count
	end

	def cards_in_category(category)
		@cards.find_all do |card|
			card.category == category
		end
	end 

end