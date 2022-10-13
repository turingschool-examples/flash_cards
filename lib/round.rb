class Round

  attr_reader :deck, :turns_array, :cur_turn, :cur_card, :turns_taken

  def initialize(deck)
    @deck = deck
    @turns_array = []
  end

  def count
    puts @turns_array.length
  end

  def current_card
    @deck.shift
  end

  def take_turn(guess)

    Turn.new(guess, @cur_card)

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
