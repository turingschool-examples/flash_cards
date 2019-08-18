class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
     new_turn = Turn.new(guess, current_card)
     @deck.cards.rotate!
     @turns << new_turn
     new_turn
  end

  def number_correct
    @turns.select! { |turn| turn.correct? }
      @turns.count
  end


  def number_correct_by_category
  end

  def percent_correct
    
  end




end
