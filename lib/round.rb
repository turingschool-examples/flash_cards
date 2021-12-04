require './lib/turn'
class Round
  attr_reader :deck, :turns, :correct_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    # @correct_turn = []
    @correct_turn = 0
  end

  def current_card
    deck.cards.shift
    # @deck.select do |card|
    #   return [card]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    return @turns.last

    if guess == round.current_card.answer
      @correct_turn << new_turn
    end
  end

    def number_correct
      @correct_turn += 1
    end
  end
    # if @turns.last = true
    #   @correct_turn << Turn.new(guess, current_card)
    # end

    #@correct_turn << Turn.new(guess,current_card)


  # def correct?
  #   if take_turn(guess)
  #     new_turn = round.take_turn("Juneau")
  #     new_turn.correct?
  #   end
  # end
