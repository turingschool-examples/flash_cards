require './lib/deck'

class Round

  attr_reader :deck, :turns, :current_card, :curr_card_idx

  def initialize(deck)
    @deck = deck
    @curr_card_idx = 0
    @current_card = @deck.cards[@curr_card_idx]
    @turns = []
    @number_correct = {total: 0, @current_card.category => 0}
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @current_card)
    initialize_card_type(@current_card.category)
    if @turns[@curr_card_idx].correct?
      @number_correct[:total] += 1
      @number_correct[@current_card.category] += 1
    end
    @curr_card_idx += 1
    @current_card = @deck.cards[@curr_card_idx]
    @turns[@curr_card_idx - 1]
  end

  def initialize_card_type(type)
    if @number_correct[type].nil?
      @number_correct[type] = 0
    end
  end

  def categories
    @deck.cards.map {|card| card.category}.uniq
  end

  def number_correct
    @number_correct[:total]
  end

  def number_correct_by_category(type)
    initialize_card_type(type)
    @number_correct[type]
  end

  def percent_correct
    calculate_percentage(:total, @turns.length)
  end

  def percent_correct_by_category(type)
    turns_by_category = @turns.count {|turn| turn.card.category == type}
    calculate_percentage(type, turns_by_category)
  end

  def calculate_percentage(type, num_turns)
    (@number_correct[type] / num_turns.to_f * 100).round(2)
  end
end
