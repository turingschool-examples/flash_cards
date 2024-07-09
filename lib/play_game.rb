require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class PlayGame
  def initialize
    @deck = create_deck
    @round = Round.new(@deck)
  end

  def create_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the principal metal in the manufacturing of steel?", "Iron", :STEM)
    card_4 = Card.new("What is the imaginary horizontal line that goes around the middle of the earth?", "Equator", :Geography)
    card_5 = Card.new("What country are the Great Pyramids of Giza located in?", "Egypt", :Geography)
    card_6 = Card.new("What country has the most natural lakes?", "Canada", :Geography)
    card_7 = Card.new("What is the name of the tallest grass on earth?", "Bamboo", :STEM)
    card_8 = Card.new("Does sound travel faster in the air or in water?", "Water", :STEM)
    cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
    Deck.new(shuffle_cards(cards))
  end

  def shuffle_cards(cards)
    deck_cards = []
    deck_cards << cards.sample(4)
    deck_cards.flatten
  end

  def start 
    total_cards = @deck.count
    puts "\n Please enter your name \n"
    name = gets.chomp

    puts "\nGreetings, #{name}, Welcome to Flash Cards!\n You will be playing with #{total_cards} cards. Good luck!\n"
    puts "================================================\n "

    total_cards.times do
      puts "This is card number #{@round.turns.count + 1} out of #{total_cards}."
      puts "\nQuestion: #{@round.current_card.question} \n "
      guess = gets.chomp.capitalize
      turn = @round.take_turn(guess)
      puts " \n#{@round.turns.last.feedback} \n\n"
      if !turn.correct?
        puts "The correct answer was: #{turn.card.answer}\n\n" 
      end
    end
    game_over
  end

  def game_over
    total_cards = @round.turns.count
    puts "\nThere are no more cards. \n\n"
    puts "**********  Game Over!  ************** \n"
    puts "\n You had #{@round.number_correct} correct guesses out of #{total_cards} for a total score of #{@round.percent_correct} percent. \n"
    puts "\n In the STEM category you had - #{@round.percent_correct_by_category(:STEM)}% correct \n"
    puts "\n In the Geography category you had - #{@round.percent_correct_by_category(:Geography)}% correct \n\n"
    puts "\n +++++ If you want to play again, then press the up arrow and enter! +++++ \n\n"
  end
end




  



