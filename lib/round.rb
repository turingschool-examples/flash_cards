require './lib/turn'

class Round
  attr_reader :deck, :turns, :correct_turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
  end

  def current_card
    current_card = @deck.cards
    current_card[turns.count]
  end

  def take_turn(guess)
    @turns.push Turn.new(guess, current_card)
    if @turns.last.card.answer.downcase == @turns.last.guess.downcase
      @correct_turns.push turns.last
    end
    @turns.last
  end

  def number_correct
    @correct_turns.length
  end

  def number_correct_by_category(category_input)

    @correct_turns.count do |correct_card|
      correct_card.card.category.downcase == category_input.downcase
    end
  end

  def percent_correct
    @correct_turns.length.to_f / @turns.length * 100.0
  end

  def percent_correct_by_category(category)
    

    category_correct_amount = @correct_turns.count do |correct_card|
      correct_card.card.category.downcase == category.downcase
    end

    
    category_asked_amount = @turns.count do |turn|
      turn.card.category.downcase == category.downcase
    end

    category_correct_amount.to_f / category_asked_amount * 100.0
  end

  def card_number
    @turns.length + 1
  end
end
