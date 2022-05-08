class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!(1)
    @turns.last
  end

  def number_correct
    correct_answer = []
    @turns.each do |turn|
      if turn.correct? == true
        correct_answer << turn
      end
    end
    correct_answer.length 
  end
end
