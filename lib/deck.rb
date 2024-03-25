require './lib/card'

class Deck

	attr_reader :card,
							:cards

	def initialize(cards)
		@cards = cards
		@card = card
	end

	def count
		cards.count
	end

	def cards_in_category
		

end