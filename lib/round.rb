class Round

  attr_reader :deck, :turns_array, :cur_card

  def initialize(deck)
    @deck = deck
    @turns_array = []
    @cur_card = nil
  end

  def count
    puts @turns_array.length
  end

  def current_card
    @cur_card = @deck.shift
  end

  def take_turn(guess)
    Turn.new(guess, @cur_card)
  end

  def number_correct
    correct_turns = []
    @turns_array.each do |turn|
      correct_turns << turn if (turn.correct? == true)
    end
    return correct_turns.length
  end

  def number_correct_by_category(cat)
    #this will be similar to number_correct but && will be used to get
    #correct && same_cat :)
    correct_and_cat = []
    @turns_array.each do |turn|
      if ((turn.correct? == true) && (turn.card.category == cat))
        correct_and_cat << turn
      end
    end
    return correct_and_cat.length
  end

  def percent_correct
    #take number_correct / @turns_array.count
    #display as xx% (multiply by 100.0 to keep float)
    correct_turns = []
    @turns_array.each do |turn|
      # could rephrase this line, might be redundant, but I'm scared to touch it.
      correct_turns << turn if (turn.correct? == true)
    end
    return ((correct_turns.length * 1.0) / (@turns_array.length * 1.0)) * 100.0
  end

  def percent_correct_by_category(cat)
    single_cat = []
    correct_and_cat = []
    @turns_array.each do |turn|
      if turn.card.category == cat
        single_cat << turn
      end
      # same here with the turn.correct? likely returning true anyway? idk if == true is needed.
      if((turn.correct? == true) && (turn.card.category == cat))
        correct_and_cat << turn
      end
    end
    return ((correct_and_cat.length * 1.0) / (single_cat.length * 1.0)) * 100.0
  end

  def turn_number
    @turns_array.length + 1
  end

end
