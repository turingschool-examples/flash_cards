require './lib/deck'

class Round
  attr_reader :deck, :turns, :number_of_cards, :discard_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_of_cards = @deck.count
    @discarded_cards = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    this_turn = Turn.new(guess, current_card)
    @turns << this_turn
    @discarded_cards << @deck.cards.shift
    this_turn
  end

  def number_correct
    correct_answer_count = 0
    turns.each do |turn|
      if turn.correct? == true
        correct_answer_count += 1
      end
    end
    correct_answer_count
  end

  def number_correct_by_category(turn_category) 
    turns_in_category = []
    @turns.each do |turn|
      if turn.card.category == turn_category
        turns_in_category << turn
      end
    end
    correct_by_category = 0
    turns_in_category.each do |turn|
      if turn.feedback == "Correct!"
        correct_by_category += 1
      end
    end
      correct_by_category
  end

  def percent_correct
    (number_correct.to_f / @turns.count * 100)
  end

  def percent_correct_by_category(category)
    turns_in_category = []
    @turns.each do |turn|
      if turn.card.category == category
        turns_in_category << turn
      end
    end
    (number_correct_by_category(category).to_f / turns_in_category.count * 100)
  end

  def start
    puts "Welcome! You're playing with #{@number_of_cards} cards."
    puts "-------------------------------------------------"
  end

  def ask_questions
    question_counter = 0
    until question_counter == @number_of_cards
      question_counter += 1
      puts "This is card number #{@turns.count + 1} out of #{@number_of_cards}."
      puts "Question: #{@deck.cards[0].question}"
      guess = gets.chomp
      feedback = take_turn(guess).feedback
      puts feedback
    end

    def game_over
      puts "****** Game over! ******"
      puts "You had #{number_correct} correct guesses out of #{@number_of_cards} for a total score of #{percent_correct}%."
      categories = []
      @discarded_cards.each do |discarded_card|
        categories << discarded_card.category
      end
      categories.uniq.each do |category|
        puts "#{category} - #{percent_correct_by_category(category)}% correct"
      end
    end
  end
end