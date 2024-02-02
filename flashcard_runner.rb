require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

# Documentation for class Game
class Game
  def initialize
    card_generator = CardGenerator.new('cards.txt')
    card_generator.parse_file
    card_generator.push_cards
    @cards = card_generator.cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start
    puts "\nWelcome! You're playing with #{@deck.count} cards.\n--------------------------------------\n"
    quiz_loop
  end

  def provide_question
    puts "This is card number #{@round.turn_number + 1} out of #{@deck.count}"
    puts "Question: #{@round.current_card.question}"
  end

  def provide_feedback(turn)
    puts turn.feedback
    sleep(1)
    puts "--------------------------------------\n"
  end

  def take_input
    provide_question
    guess = gets.chomp
    turn = @round.take_turn(guess)
    provide_feedback(turn)
  end

  def quiz_loop
    take_input while @round.turn_number < @deck.count
    show_results
  end

  def categories_array
    list_of_categories = []
    @deck.cards.each do |card|
      list_of_categories.push(card.category) unless list_of_categories.include?(card.category)
    end
    list_of_categories
  end

  def show_results
    puts "\n****** Game over! ******\n"
    puts "\nYou had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{(100.0 * @round.number_correct / @deck.count).round}%."
    list_of_categories = categories_array
    list_of_categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
    puts ''
  end
end

Game.new.start
