require './card'

require './turn'

require './deck'

class Round
  attr_reader :deck, :turns, :number_correct, :turns_taken, :correct_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0.0
    @turns_taken = 0.0
    @correct_cards = []
  end

  def current_card
    current_card = @deck.cards
    current_card[turns.count]
  end

  def take_turn(guess)
    @turns.push Turn.new(guess, current_card)
    if @turns.last.card.answer.downcase == @turns.last.guess.downcase
      @number_correct += 1.0
      @correct_cards.push turns.last
    end
    @turns_taken += 1.0
    @turns.last
  end

  def number_correct_by_category(category)
    @category_correct_amount = 0.0

    @correct_cards.each do |correct_card|
      @category_correct_amount += 1.0 if correct_card.card.category.downcase == category.downcase
    end
    @category_correct_amount
  end

  def percent_correct
    @number_correct / @turns_taken * 100.0
  end

  def percent_correct_by_category(category)
    @category_asked_amount = 0.0
    @category_correct_amount = 0.0

    @correct_cards.each do |correct_card|
      @category_correct_amount += 1.0 if correct_card.card.category.downcase == category.downcase
    end

    @turns.each do |turn|
      @category_asked_amount += 1.0 if turn.card.category.downcase == category.downcase
    end

    @category_correct_amount / @category_asked_amount * 100.0
  end

  def card_number
    @turns_taken.round + 1
  end
end
