class Round
  attr_reader :deck, :turns

  def initialize(round_deck)
    @deck = round_deck
    @turns = []
  end

  def current_card
    deck.draw
  end

  def take_turn(guess)
    hey = Turn.new(guess, current_card)
    @turns << hey
    return hey
  end

  def number_correct
    correct_turn = []
    @turns.each do |accuracy_check|
      if accuracy_check.correct?
        correct_turn << accuracy_check
      end
    end
    return correct_turn.count
  end








end
