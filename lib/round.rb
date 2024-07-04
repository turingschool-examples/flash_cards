class Round
  require './lib/turn'
  attr_reader :deck, :turns, :currnet_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = -1
    new_card # find a new card
    
  end

  def new_card
    if (@deck.count - 1) > @turn_counter # subtracted -1 from deck.count so that it matches computers counting which begins from 0
      @turn_counter += 1
    # puts("Create a new card at index #{@turn_counter}")
      @currnet_card = @deck.cards[@turn_counter]
    else
      puts ("\n\n!!!You've reached your limit!!!\n\n")
    end

  end

  def take_turn(guess)
    new_turn = Turn.new(guess,@currnet_card)
    @turns << new_turn
    new_card # fetch a new card
    return new_turn
  end

end