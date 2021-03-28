require 'pry'
class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end


  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)

    @deck.cards.rotate!
    turns << turn
    turn
  end

  def number_correct
    sum = 0
    turns.each do |turn|
      if turn.correct?
        sum += 1
      end
    end
    sum
  end

  def number_correct_by_category(category)
    add = 0
    turns.each do |turn|
      if turn.card.category == category && turn.correct?
        add += 1
      end
    end
    add
    # binding.pry
  end

  def percent_correct
    percent_right = (number_correct.to_f / turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    add = 0
    turns.each do |turn|
      if turn.card.category == category
        add += 1
      end
    end
    add

    category_right = (number_correct_by_category(category).to_f / add.to_f) * 100
  end
end
