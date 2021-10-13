require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

class Flashcards
  def initialize
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck   = Deck.new([@card_1, @card_2, @card_3])
    @round  = Round.new(@deck)
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "--------------------------------------------------"

    while @round.turns.length < @deck.cards.length do
      puts "This is card number #{@round.turns.length + 1} out of #{@round.deck.cards.length}."
      puts "Question: #{@round.current_card.question}"
      puts "Please enter a guess:"
      guess = gets.chomp
      @round.take_turn(guess)
      puts @round.turns.last.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.cards.length} for a total score of #{@round.percent_correct}%."
    puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"
    puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct"
  end
end

flashcards = Flashcards.new
flashcards.start
