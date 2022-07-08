require './lib/deck'

class Round
  attr_reader :deck,
              :turns
  attr_accessor :correct_answers,
                :turn_count,
                :total_cards,
                :categories

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_answers = 0
    @turn_count = 1
    @total_cards = 0
    @categories = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(answer, card = current_card)
    @deck.cards.shift
    @turn_count += 1
    new_turn = Turn.new(answer, card)
    @turns << new_turn
    @correct_answers += 1 if @turns.last.correct?
    new_turn
  end

  def number_correct
    @correct_answers
  end

  def percent_correct
    (@correct_answers.to_f / turns.count) * 100
  end

  def number_correct_by_category(cat)
    num_by_cat = 0
    turns.each do |turn|
      num_by_cat = + 1 if turn.correct? && turn.card.category == cat
    end
    num_by_cat
  end

  def percent_correct_by_category(cat)
    total_by_cat = 0
    @turns.each do |turn|
      total_by_cat += 1 if turn.card.category == cat
    end
    (number_correct_by_category(cat).to_f / total_by_cat) * 100
  end

  def collect_category
    deck.cards.each do |card|
      @categories << card.category if categories.include?(card.category) == false
    end
  end

  def start
    @total_cards = deck.cards.count
    collect_category
    puts "\n\n"
    puts "Welcome! You're playing with #{total_cards} cards."
    puts "#{'-' * 40}\n\n"
    rounds
  end

  def rounds
    @total_cards.times do
      puts "This is card number #{turn_count} out of #{total_cards}."
      puts ' '
      puts "Question: #{current_card.question}"
      # gather and sanitize user input
      answer = gets.chomp.split.map(&:capitalize).join(' ')
      take_turn(answer, current_card)
      puts "#{turns.last.feedback} \n\n"
    end
    end_game
  end

  def end_game
    puts "****** Game over! ******\n\n"
    puts "You had #{correct_answers} correct guesses out of #{total_cards} \nfor a total score of %#{format('%.1f', percent_correct)}.\n"
    @categories.each do |category|
      puts "#{category} - %#{format('%.1f', percent_correct_by_category(category))} correct"
    end
    puts "\n\n"
  end
end
