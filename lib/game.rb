require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require './lib/message'

class Game
  @@deck      = nil
  @@num_cards = nil
  @@user_name = nil
  @@round     = nil

  def self.play
    puts Message.messages[:intro_greeting]

    @@user_name = gets.chomp
    puts "Hello #{@@user_name}"
    puts Message.messages[:play_prompt]

    create_deck

    puts "You'll be playing with #{@@num_cards} " \
        "#{@@num_cards == 1 ? 'card' : 'cards'}"
    puts Message.messages[:sec_break]

    process_round

    game_feedback
  end

  def self.create_deck
    @@num_cards = gets.chomp.to_i
    if @@num_cards.zero?
      @@num_cards = random_number(10)
    elsif @@num_cards.negative?
      @@deck = Deck.new(CardGenerator.new("./cards.txt").cards)
      @@num_cards = @@deck.count
    end
    @@deck ||= Deck.new(@@num_cards.times.map { create_card })
  end

  def self.create_card
    type_idx     = random_number(3) - 1
    problem_type = {
      operators: ["+", "-", "*"],
      types:     [:Add, :Subtract, :Multiply]
    }
    operator = problem_type[:operators][type_idx]
    category = problem_type[:types][type_idx]
    numbers  = [random_number(20), random_number(20)]
    question = "#{numbers[0]} #{operator} #{numbers[1]}"
    answer   = eval question
    question = "What is #{numbers[0]} #{operator} #{numbers[1]}?"
    Card.new(question, answer, category)
  end

  def self.process_round
    @@round = Round.new(@@deck)
    @@deck.cards.each_with_index do |_turn, idx|
      puts "This is card ##{idx + 1} out of #{@@deck.count}"
      puts "Question: #{@@round.current_card.question}"
      this_turn = @@round.take_turn(gets.chomp)
      puts this_turn.feedback
    end
  end

  def self.game_feedback
    puts Message.messages[:game_over]
    puts "You had #{@@round.number_correct} " \
         "#{@@round.number_correct == 1 ? 'correct guess' : 'correct guesses'}" \
         " out of #{@@deck.count} for a total score of " \
         "#{@@round.percent_correct}%"
    @@round.categories.each do |category|
      puts "#{category} - #{@@round.percent_correct_by_category(category)}% correct"
    end
  end

  def self.random_number(bound)
    (1..bound).to_a.sample
  end
end
