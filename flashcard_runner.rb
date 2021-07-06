require './lib/round'

class FlashcardRunner
  attr_reader :round,
              :deck,
              :deck_size

  def initialize
    @round = round
    @deck = deck
    @deck_size = deck.cards.count

    start
  end

  def start
    game
    welcome
    game_over
  end

  def welcome
    puts "Welcome! You're playing with #{@deck_size} cards."
    puts "-------------------------------------------------"
    puts ">> "
  end

  def guess_messaging
    puts "This is card number 1 out of 4."
    puts "Question: #{}"
    puts ">> "
    gets.chomp
  end


  def guess_loop
    @deck_size.times do
      guess_messaging

    end
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had 3 correct guesses out of 4 for a total score of 75%."
    puts "STEM - 100% correct"
    puts "Turing Staff - 50% correct"
    puts  "Pop Culture - 100% correct"
  end

  def game
    card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    card_2 = Card.new("What is Rachel's favorite animal?", "Monkey", :Turing_Staff)
    card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
    card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
    deck = Deck.new([card_1, card_2, card_3, card_3])
    Round.new(deck)
  end
end
FlashcardRunner.new
