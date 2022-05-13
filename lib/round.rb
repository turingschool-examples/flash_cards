require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'



class Round

  attr_reader :deck, :turns, :turn_count,:used_card_array,:number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_count = 0
    @number_correct = 0
    @used_card_array = []
  end

  def current_card
    if @used_card_array == []
      @deck.cards.first
    else
      @used_card_array.last
    end
  end

  def take_turn(guess)

    new_turn = Turn.new(guess,@deck.cards.first)

    @used_card_array << @deck.cards.first

    @deck.cards.rotate!(1)

    if new_turn.guess == new_turn.card.answer
      increment_number_correct
    end

    @turns << new_turn

    increment_turn_count

    new_turn

  end

  def correct?
    take_turn.guess == take_turn.answer
  end

  def increment_number_correct
    @number_correct += 1
  end

  def increment_turn_count
    @turn_count += 1
  end

end
