class Round
  require './lib/turn'
  attr_reader :deck, :turns, :currnet_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = [] # turns taken
    @turn_counter = -1
    @number_correct = 0 
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
    verify_guess
    new_card # fetch a new card
    return new_turn
  end

  def verify_guess
    response_check = @turns[-1].correct? 
     # many ways to fetch the turn, I found it simplest just to grab the last in the list and check
     # it as we are appending new_turns to the end of the @turns list.
     # if at any point we start inserting, this code will have to be updated
    if response_check
        @number_correct += 1
    end
        
  end

    

end