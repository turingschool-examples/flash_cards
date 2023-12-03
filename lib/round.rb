class Round
  attr_reader :deck, :turns, :correct, :guess_counter
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
    # @incorrect = 0
    @guess_counter = 0  #1?
  end

  def current_card
    deck.cards.first
  end


 #records guesses
  def make_a_guess
    # When we make a guess, the guess is recorded
    guess = gets.chomp
    turn = take_turn(guess)
    guess_counter += 1
    add_to_correct_counter
    puts turn.feedback 
  end

    #next card in the deck becomes the current card.

  def number_correct
    # current_turn = @turns.last
    @correct += 1 if current_card.correct?
    @correct
  end

  def remove_top_card
    deck.cards.shift
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @turns << current_turn
    current_turn
    # remove_top_card
  end


  def each_turn_adds_card_to_turns
    # @turns << turn.card
    #returns a new array of @turns
  end
end



  



  #  should create a new Turn object with the appropriate guess and Card
  #  return it from the take_turn method.
#  when the take_turn method is called, the Round should move on to the next card in the dec