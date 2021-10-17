require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

@card_1 = Card.new("What is 5 + 5?", "10", :STEM)
@card_2 = Card.new("What is Rachel's favorite animal?", "lion", "Turing Staff")
@card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
@card_4 = Card.new("What cardboard cutout lives at Turing?", "justin bieber", "Pop Culture")

@cards = [@card_1, @card_2, @card_3, @card_4]
@deck = Deck.new(@cards)
@round = Round.new(@deck)
# require "pry"; binding.pry
@round.start
@round.play_round
# require "pry"; binding.pry
# During refactor will move code below from
# Round file to this flashcard_runner

  # until @turns.length == @deck.cards.length
  #   guess = gets.chomp
  #   take_turn(guess)
  #   puts @turns.last.feedback
  #   puts "This is card #{@count} out of 4."
  #   puts "Question: #{current_card.question}"
  # end
  #   puts "****** Game over! ******"
  #   puts "You had #{number_correct} out of #{turns.count} for a score of #{percent_correct.to_i.to_s.insert(-1, "%")}"
  #   @round.turns.map do |card|
  #     puts card.category
  #   end
  #   #need dynamic way to access each card category and interpolate,
  #   #into a string with % appended (i.e. STEM - 100% correct)
  #   puts "STEM - #{percent_correct_by_category(:STEM).to_i.to_s.insert(-1, '%')}"
  #   puts "Turing Staff - #{percent_correct_by_category("Turing Staff").to_i.to_s.insert(-1, '%')}"
  #   puts "Pop Culture - #{percent_correct_by_category("Pop Culture").to_i.to_s.insert(-1, '%')}"
