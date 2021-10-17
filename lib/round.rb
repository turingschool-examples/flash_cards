require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_accessor :deck
  attr_reader :turns, :index

  def initialize(input_deck)
    @deck = input_deck
    @turns = []
    @index = 0
  end

  def current_card
    @deck.cards[@index]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @index += 1
    @turns.last
  end

  def number_correct
    counter = 0
    @turns.each do |turn|
      if turn.correct?
        counter += 1
      end
    end
    counter
  end

  def number_correct_by_category(category)
    counter = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        counter += 1
      end
    end
    counter
  end

  def percent_correct
    ((Float(self.number_correct) / @turns.count).round(2) * 100).to_i
  end

  def percent_correct_by_category(category)
    count = 0
    correct = number_correct_by_category(category)
    @turns.each do |turn|
      if turn.card.category == category
        count += 1
      end
    end
    ((Float(correct) / count).round(2) * 100).to_i
  end

  def start
    card_count = self.deck.cards.count

    puts "Welcome! You're playing with #{card_count} cards."
    puts " * * * * * * * * * * * * * * * *"

    while self.index + 1 <= card_count

      puts "This is card #{self.index + 1} out of #{card_count}"
      puts "Question: #{self.current_card.question}"
      response = gets.chomp

      self.take_turn(response)
      puts @turns[@index - 1].feedback
    end

    puts "* * * * Game Over! * * * *"
    puts "You had #{number_correct} correct guesses out of #{card_count} for a total score of #{percent_correct}%"

    category_array = []
    turns.each do |turn|
      category_array << turn.card.category
    end
    category_array = category_array.uniq

    category_array.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}% correct"
    end
    
  end

end
