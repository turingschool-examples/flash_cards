require './lib/deck'
require './lib/card'
require './lib/round'
class Runner

  def self.call
    new.call
  end
  attr_reader :cards, :deck, :round, :card_total
  attr_accessor :card_num
  def initialize
    @cards = create_cards.shuffle
    @deck = Deck.new(cards)
    @round = Round.new(deck)
    @card_total = cards.count
    @card_num = card_total
  end

  def call
    puts intro
    play
    puts tally
  end

  def intro
    "Welcome! You're playing with #{card_total} cards.
    -------------------------------------------------"
  end

  def play
    while card_num > 0
      @card_num -= 1
      current_card_number = card_total - card_num
      puts "This is card number #{current_card_number} out of #{card_total}"
      puts "Question: #{round.current_card.question}"
      guess = gets.chomp
      turn = round.take_turn(guess)
      puts turn.feedback
    end
  end

  def tally
    number_correct = round.number_correct
    percent_correct = round.percent_correct
    percent_output = deck.categories.map do |category|
      "#{category} - #{round.percent_correct_by_category(category)}%"
    end

    "****** Game over! ******\n" +
    "You had #{number_correct} out of #{card_total} for a total of #{percent_correct}%.\n" +
    "#{percent_output.join("\n")}"
  end

  def create_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    [card_1, card_2, card_3]
  end

end

Runner.call
