require './lib/round'
require './lib/turn'

class FlashcardRunner
  attr_reader :round,
              :deck,
              :deck_size

  def initialize
    @game_objects = game_objects
    @deck         = deck
    @turn_counter = 1
    @round        = Round.new(@deck)
    @deck_size    = deck.cards.count

    start
  end

  def start
    welcome
    guess_loop
    game_over
  end

  def welcome
    puts "Welcome! You're playing with #{@deck_size} cards."
    puts "-------------------------------------------------"
  end

  def guess_messaging
    puts "This is card number #{@turn_counter} out of #{@deck_size}."
    puts "Question: #{@round.current_card.question}"
    print ">> "
  end


  def guess_loop
    @deck_size.times do
      guess_messaging
      guess = gets.chomp
      current_turn = @round.take_turn(guess)
      puts current_turn.feedback
      @turn_counter += 1
    end
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@deck_size} for a total score of #{@round.percent_correct}%."
    puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct"
    puts "Turing Staff - #{@round.percent_correct_by_category(:turing_staff)} correct"
    puts  "Pop Culture - #{@round.percent_correct_by_category(:pop_culture)} correct"
  end

  def game_objects
    card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    card_2 = Card.new("What is Rachel's favorite animal?", "Monkey", :turing_staff)
    card_3 = Card.new("What is Mike's middle name?", "nobody knows", :turing_staff)
    card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :pop_culture)
    @deck = Deck.new([card_1, card_2, card_3, card_4])
  end
end
FlashcardRunner.new
