class Round
	attr_reader :deck, :turns

	def initialize(deck)
		@deck = deck
		@turns = []
	end

	def current_card
		current_card = @turns.length
		@deck.cards[current_card]
	end

	def take_turn(guess)
		turn = Turn.new(guess, current_card)
		@turns << turn
		return turn
	end

	def number_correct
		number_correct = 0
		@turns.each do |turn|
			if turn.correct?
				number_correct += 1
			end
		end
		number_correct
	end

	def number_correct_by_category(category)
		correct_in_category = 0
		@turns.each do |turn|
			if turn.card.category == category
				if turn.correct?
					correct_in_category += 1
				end
			end
		end
		correct_in_category
	end

	def percent_correct
		(number_correct.to_f / @turns.length) * 100
	end

	def percent_correct_by_category(category)
		total_in_category = 0
		@turns.each do |turn|
			if turn.card.category == category
				total_in_category += 1
			end
		end
		(number_correct_by_category(category).to_f / total_in_category) * 100

	end

	def start
		card_number = 1
		puts "Welcome! You're playing with #{deck.cards.count} cards. "
		puts "-" * 50

			while card_number <= deck.count
				puts "This is card number #{card_number} out of #{deck.cards.count}."
				puts "Question: #{current_card.question}"
				guess = gets.chomp.downcase
				next_turn = take_turn(guess)
				puts next_turn.feedback
				card_number += 1
			end
	end

	def end
		puts "****** Game over! ******"
		puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct.to_i}%."
	end

	def final_score
		categories = []
		turns.each do |turn|
			if categories.include?(turn.card.category)
				next
			else
				puts "#{turn.card.category} – #{percent_correct_by_category(turn.card.category).to_i}% correct"
			end
			categories << turn.card.category
		end

	end
end
