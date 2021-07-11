require './lib/round'
require './lib/turn'
require './lib/game_flow'

class FlashcardRunner
  attr_reader :round,
              :deck,
              :cards
              :deck_size

  def initialize
    @game_objects = game_objects
    @cards        = @game_objects
    @deck         = Deck.new(@cards)
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
    guesses_by_category
  end

  def guesses_by_category
    category_count = 0

    @round.categories.count.times do
      current_category = @round.categories[category_count]
      puts "#{@round.categories_strings[category_count]} - #{@round.percent_correct_by_category(current_category)}% correct"
      category_count += 1
    end
  end

  def game_objects
    filename = 'cards.txt'

    @cards = File.readlines(filename).map do |line|
      card = line.split(",")
      Card.new(card[0], card[1], card[2].delete("\n").to_sym)
    end
  end
end
FlashcardRunner.new
