class Round
  attr_reader :deck, 
              :turns, 
              :card_position
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
  
  def number_correct_by_category(category) 
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
    new_turn
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
    game_play_over
  end

  def game_play_over
    game_over_message
    category_correct_stats
    break
  end

  def game_over_message
    p "****** GAME OVER ******"
    p "You had #{number_correct} correct guesses out of #{@deck.count} for a total score of #{percent_correct}%."
    puts
  end

  def category_correct_stats
    @deck.cards.each do |card|
      p "#{card.category}  -  #{percent_correct_by_category(card.category)}"
      puts
    end
  end

  def welcome
    puts
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "\n-----------------------------------------------"
    puts 
  end

  def show_card_message(card)
    puts
    puts "This is card number #{@card_position} out of #{@deck.count}."
  end

  def card_index(card)
    index = @deck.cards.index(card)
    return index += 1 
  end

  def get_guess_input(card)
    puts "Question: #{card.question}"
    gets.chomp  
  end

  def feedback_message
    if guess_input.correct? 
      puts @turns.last.feedback 
      puts
    end
  end

end