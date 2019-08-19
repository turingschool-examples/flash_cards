require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
  end

# make & record a guess
# create a new Turn object w/ respective guess & card
# next card in deck becomes current card
# store & return new Turn object
  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    current_card = deck.cards.shift
    turns << turn
    turn
  end

  def count
    turns.count
  end

  def number_correct
    turns.find_all do |turn|
      turn.correct?
    end
    .count
  end

  def number_correct_by_category(category)
    turns.find_all do |turn|
      turn.correct? && turn.card.category == category
    end
    .count
  end

  def percent_correct
    (number_correct / count.to_f) * 100
  end

  def cards_in_category(category)
    turns.find_all do |turn|
      turn.card.category == category
    end
    .count
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / cards_in_category(category).to_f) * 100
  end

  # starts the round using start method
  def start
    total_cards = deck.count + turns.count + 1
    puts "Welcome! You're playing with #{total_cards} cards."
    puts "-------------------------------------------------"
    create_turn
  end

  def create_turn
    card_number = turns.count + 1
    total_cards = deck.count + turns.count + 1
    puts "This is card number #{card_number} out of #{total_cards}."
    puts "Question: #{@current_card.question}"
    guess = gets.chomp
    puts take_turn(guess).feedback
    if card_number == total_cards
      game_over
    else
      create_turn
    end
  end

# return new array of categories without duplicates
  def categories
    turns.map do |turn|
      turn.card.category
    end
    turns.uniq
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{turns.count} for a total score of #{percent_correct}%."
    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}% correct"
    end
  end
end
