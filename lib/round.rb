class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    ((number_correct * 100) / turns.length).to_f
  end

  def turns_per_cat(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_per_cat(category).to_f) * 100
  end

#   def start
#     require "pry"; binding.pry
#     puts "Welcome! You're playing with #{deck.count} cards."
#     puts "-------------------------------------------------"
#
#     until deck.cards.empty? do
#       puts "This is card number #{turns.length} out of #{deck.cards.count}."
#       puts "#{current_card.question}"
#     end
#
#   end
# end
