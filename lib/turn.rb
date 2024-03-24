require "pry"

require './lib/card'

class Turn
	attr_reader :turn,
							:card,
							:guess

	def initialize(guess, card)
		@card = card
		@guess = guess
	end

	def correct?
		@guess == card.answer
	end

	def feedback
		if correct? == true
			"Correct!"
		else
			"Incorrect."
		end
	end

end