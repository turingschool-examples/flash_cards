class Round
  attr_reader :deck, :turns, :count

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end


  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.card.category == category
        turn.correct?
      end
    end
  end

  def percent_correct
      amount = @turns.length.to_f
       percentage= number_correct.to_f / amount
       percentage *100
       require 'pry'; binding.pry
    end
  end

  #require 'pry'; binding.pry
