require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class FlashcardRunner
  attr_reader :round

  def initialize
  cards = [card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography),
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)]
  deck = Deck.new(cards)
  @round = Round.new(deck)
  end

  def start
    puts "Welcome! You're playing with #{round.deck.cards.length} cards."#print number of elements in the deck.
    puts "-------------------------------------------------------"
  while round.turns.length + 1 <= round.deck.cards.length #while the number of elements length in the current turn is less than or equal the total amount of the cards do this.
    puts "This is card number #{round.turns.length + 1} out of #{round.deck.cards.length}."#add one to the number of elements length in the current turn, do this until it is larger than the current card elements in the deck.
    puts "Question: #{round.current_card.question}"#returns the current card's question argument.
    guess = gets.chomp#setup for user input
    round.take_turn(guess)#takes guess and rotates next card in deck.
    puts round.turns.last.feedback#prints whether last turn was correct or incorrect.
  end
    puts '****** Game over! ******'
    puts "You had #{round.number_correct} correct guesse(s) out of #{round.deck.cards.length} for a total score of #{round.percent_correct.round}%."#number of over all turns correct, out of total amount of cards, for a total score of the total percent correct.
    puts "STEM - #{round.percent_correct_by_category(:STEM)}%"
    puts "Geography - #{round.percent_correct_by_category(:Geography)}%"
    end
  end

game = FlashcardRunner.new
game.start
