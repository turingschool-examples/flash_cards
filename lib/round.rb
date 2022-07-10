require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0.0
    @number_correct_by_category = {}
    @total_turns_by_category = {}
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards[0])

    if !@total_turns_by_category.has_key?(@deck.cards[0].category)
      @total_turns_by_category[@deck.cards[0].category] = 1.0
      @number_correct_by_category[@deck.cards[0].category] = 0.0
    else
      @total_turns_by_category[@deck.cards[0].category] += 1
    end

    if new_turn.correct?
      @number_correct += 1
      @number_correct_by_category[@deck.cards[0].category] += 1
    end

    @turns << new_turn
    @deck.cards.shift
    new_turn.feedback
  end

  def number_correct_by_category(category)
    @number_correct_by_category[category]
  end

  def percent_correct
    @number_correct / @turns.length
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category) / @total_turns_by_category[category]
  end

  def list_percent_correct
    @total_turns_by_category.each {|key, value| puts "#{key} - #{percent_correct_by_category(key) * 100}% correct"}
  end



end
