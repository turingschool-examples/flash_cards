require './lib/card'

class Deck

	attr_reader :card,
							:cards

	def initialize(cards)
		@cards = cards
		@card = card
	end


end