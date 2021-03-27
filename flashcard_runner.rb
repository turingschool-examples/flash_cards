require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Start
  attr_reader  :card_1,
                    :card_2,
                    :card_3,
                    :card_4,
                    :deck,
                    :round

  def initialize
    @card_1 = Card.new("What is the capital of Washington State?", "Olympia", :Geography)
    @card_2 = Card.new("Who is the author of Green Eggs and Ham?", "Dr. Seuss", :Wisdom)
    @card_3 = Card.new("Is an avocado a fruit or a vegetable?", "Fruit", :Science)
    @card_4 = Card.new("What is Megan's dog's name?", "Nile", :Wisdom)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
  end


  def start_game

    puts "- " * 25
    puts "Welcome to flashcards! You're playing with #{deck.count} cards."
    puts "- " * 25
    puts "This is card number 1 out of #{deck.count}."
    puts "Question: #{card_1.question}"

    print "> "
    welcome = $stdin.gets.chomp

    if welcome == "Olympia"
      puts "Correct"
    end
  end

end

st = Start.new
st.start_game
