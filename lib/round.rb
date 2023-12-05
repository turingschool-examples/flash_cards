class Round
  attr_reader :deck, 
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_position = 1
  end

  def current_card
    @deck.cards.first
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end
  
  def number_correct_by_category(category)  # will count the return value of iteration. 
    @turns.count do |turn|
      turn.correct? && turn.card.category == category 
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @deck.cards_in_category(category).count.to_f) * 100
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @card_position += 1 if @deck.cards.rotate!
    puts new_turn.feedback
  end

  def start
    welcome 
    show_card_message(current_card)
    guess = get_guess_input(current_card)
    take_turn(guess)
    continue
  end

  def continue
    show_card_message(current_card)
    guess = get_guess_input(current_card)
    take_turn(guess) 
    continue until @card_position == 5
    # need to end the game loop when #53
    # game_over, game_over_score or something should return final interaction pattern. 
  end

  def game_over
    p "You had {number_correct} correct guesses out of 4 for a total score of 75%.
    "
  end

  def welcome
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-----------------------------------------------"
  end

  def show_card_message(card)
    # add a counter as cards rotate with guess?
    puts "This is card number #{@card_position} out of #{@deck.count}."
  end

  def card_index(card)
    index = @deck.cards.index(card)
    return index += 1   #to_i?
  end

  def get_guess_input(card)
    puts "Question: #{card.question}"
    gets.chomp  # can I do this?
  end

  def feedback_message
    if guess_input.correct? #method in Turn evaluating that @guess == card.answer
      puts @turns.last.feedback #method in Turn that evaluates .correct? and returns response
    end
  end

end