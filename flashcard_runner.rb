require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

# Documentation for class Game
class Game
  def initialize
    card1 = Card.new('What is 1 + 1?', '2', :math)
    card2 = Card.new('What is the author\'s first name?', 'Neil', :other)
    card3 = Card.new('What is the integral of (x dx) evaluated from 0 to 2?', '2', :math)
    card4 = Card.new('Who is the president of the United States as of January 2024?', 'Joe Biden', :other)
    @cards = [card1, card2, card3, card4]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start
    puts "\nWelcome! You're playing with #{@deck.count} cards.\n--------------------------------------\n"
    quiz_loop
  end

  def take_input
    puts "This is card number #{@round.turn + 1} out of #{@deck.count}"
    puts "Question: #{@round.current_card.question}"
    guess = gets
    guess[-1] = '' # remove line break
    turn = @round.take_turn(guess)
    puts turn.feedback
    sleep(1)
    puts "--------------------------------------\n"
  end

  def quiz_loop
    take_input while @round.turn < @deck.count
    show_results
  end

  def show_results # rubocop:disable Metrics/AbcSize
    puts "\n****** Game over! ******\n"
    puts "\nYou had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{(100.0 * @round.number_correct / @deck.count).round}%."
    categories = []
    @deck.cards.each do |card|
      categories.push(card.category) unless categories.include?(card.category)
    end
    categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
    puts ''
  end
end

Game.new.start
