require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class FlashCards
  attr_reader :card_1,
              :card_2,
              :card_3,
              :card_4,
              :cards,
              :deck,
              :round
  def initialize
    @card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)
    @card_2 = Card.new("What is Rachel's favorite animal?", "panda", :Turing)
    @card_3 = Card.new("Question: What is Mike's middle name?", "Lancelot", :Turing)
    @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Turing)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(@deck)
    @cards_count = deck.cards.count
  end
  def start
    puts "Welcome! You're playing with #{@cards_count} cards."
    puts "-------------------------------------------------"
      until @round.turns.count && @deck.cards.count == 0
        puts "This is card number #{@round.turns.count} out of #{@round.deck.cards.length}"
        puts "Question: #{@round.current_card.question}"
        guess = gets.chomp
        @round.take_turn(guess)
        puts @round.turns.last.feedback
      end
        puts "****** Game over! ******"
        puts "You had #{@round.number_correct} correct guesses out of #{@round.deck.cards.length} for a total score of #{round.percent_correct}."
        puts "STEM - #{@round.percent_correct_by_category(:STEM )} correct"
        puts "Turing Staff - #{@round.percent_correct_by_category(:Turing )} correct"
    end
end
flashcards = FlashCards.new
flashcards.start
