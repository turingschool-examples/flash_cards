require './lib/round'
require './lib/deck'

class FlashcardRunner
  attr_reader :round,
              :decksize

  def initialize
    @deck     = Deck.new(deck)
    @round    = Round.new(@deck)
    @decksize = round.deck.count
    @turns    = 1

    start
  end

  def start
    deck
    welcome_message
    game
    game_over
  end


  def welcome_message
    puts "Welcome! You're playing with #{@decksize} cards."
    puts "-------------------------------------------------"
  end

  def show_question
    puts "This is card number #{@turns} out of #{@decksize}."
    puts "Question: #{@round.current_card.question}"
    print ">>  "
  end

  def game
    @decksize.times do
      show_question
      guess = gets.chomp
      current_turn = @round.take_turn(guess)
      puts current_turn.feedback
      @turns += 1
    end
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@decksize} for a total score of #{@round.percent_correct}%."
    puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct"
    puts "Turing Staff - #{@round.percent_correct_by_category(:Turing_Staff)}0% correct"
    puts "Pop Culture - #{@round.percent_correct_by_category(:Pop_Culture)}% correct"
  end

  def deck
    card1 = Card.new("What is 5 + 5?", "10", :STEM)
    card2 = Card.new("What is Rachel's favorite animal?", "monkey", :Turing_Staff)
    card3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
    card4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
    [card1, card2, card3, card4]
  end
end

FlashcardRunner.new
