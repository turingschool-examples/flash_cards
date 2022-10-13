class Round

  attr_reader :deck, :turns_array, :cur_turn, :cur_card, :turns_taken

  def initialize(deck)
    @deck = deck
    @turns_array = []
    @cur_turn = nil
    @cur_card = nil
    @turns_taken = 0
  end

  def count
  end

  def current_card
    @cur_card = @deck.shift
    return @cur_card
  end

  def take_turn(guess)

    @cur_turn = Turn.new(guess, @cur_card)
    @turns_taken += 1
    return @cur_turn
  end

  # def number_correct
  #   correct_counter = 0
  #     if @turns_array.correct == true
  #     correct_counter += 1
  #     end
  #   return correct_counter
  # end

####  WHERE IS THE BEST PLACE TO HOLD A METHOD TO << TURN INFO
  # def store_turn
  #   round.turns_array.push(new_turn)
  # end

end
