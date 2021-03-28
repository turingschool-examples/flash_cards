class Round
  attr_reader :deck,
              :turns,
              :current_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_turn = 0
  end

  def current_card
    card = @deck.cards[@current_turn]
    @current_turn += 1
    card
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    number_right = 0
    @turns.each do |turn|
      if turn.correct?
        number_right += 1
      end
    end
    number_right
  end
end 
