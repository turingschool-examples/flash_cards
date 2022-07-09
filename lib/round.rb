class Round
  attr_accessor :deck,
                :current_card,
                :turns,
                :correct_turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards_as_array[0]
    @turns = []
    @correct_turns = []
  end

  def take_turn(string_as_guess)
    new_turn = Turn.new(string_as_guess, @current_card)
    turns << new_turn
    @current_card = deck.cards_as_array.rotate![0]
    #the @ symbol made a difference - don't quite know why yet.
    @correct_turns << new_turn if new_turn.correct?
    new_turn
  end

  def number_correct
    turns.select { |turn| turn.correct? }.size
  end

  def number_correct_by_category(category)
    turns.select { |turn| turn.correct? && turn.card.category == category}.size
  end

  def percent_correct
    ((turns.select { |turn| turn.correct? }.size).to_f / (turns.size)*100).round(1)
  end


  def percent_correct_by_category(category)
    ((correct_turns.select { |turn| turn.card.category == category}.size).to_f/
    (((turns.select { |turn| turn.card.category == category}.size)))*100).round(1)
  end

  def start
    puts "Welcome! You're playing with #{deck.cards_as_array.size} cards.
        -------------------------------------------------
        This is card number 1 out of #{deck.cards_as_array.size}.
        puts Question: #{current_card.question}"
  end

  def show_next_card(user_guess)
      take_turn(user_guess)
      puts "#{turns[-1].feedback}"
      if turns.size < deck.cards_as_array.size
        puts "This is card number #{(turns.size + 1)} out of #{deck.cards_as_array.size}."
      end
    if turns.size == deck.cards_as_array.size
      puts "****** Game over! ******
        You had #{correct_turns.size} correct guesses out of #{deck.cards_as_array.size} for a total score of #{percent_correct}%.
        Mod1 Review Questions - #{percent_correct_by_category(":CS")}% correct
        Geography - #{percent_correct_by_category(":Geography")}% correct"
    else
      puts "Question #{current_card.question}"
    end
  end



end
