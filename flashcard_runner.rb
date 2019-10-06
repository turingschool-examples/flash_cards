require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


@card_1 = Card.new("What is the capital of California?", "Sacramento", :California)
@card_2 = Card.new("What ocean borders New York?", "Atlantic", :"New York")
@card_3 = Card.new("What is Colorado's state flower?", "Columbine", :Colorado)
@card_4 = Card.new("What famed wine region is California known for?", "Napa", :California)
@card_5 = Card.new("What is the capital of Colorado?", "Denver", :Colorado)
@card_6 = Card.new("What other name is New York City called by?", "Manhattan", :"New York")
@card_7 = Card.new("What is the state fruit of California?", "Avocado", :California)
@card_8 = Card.new("What is Denver's blue and orange-repping NFL team?", "Broncos", :Colorado)
@card_9 = Card.new("What is the capital of New York?", "Albany", :"New York")
@card_10 = Card.new("What kind of geological activity / natural disasters is California known for having?", "Earthquakes", :California)
@card_11 = Card.new("What state borders Colorado to the north?", "Wyoming", :Colorado)
@card_12 = Card.new("How many boroughs exist in New York City?", "5", :"New York")
@cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7, @card_8, @card_9, @card_10, @card_11, @card_12]
@deck = Deck.new(@cards)
@round = Round.new(@deck)


def start
  puts "-" * 50
  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "-" * 50

  until @round.turns.count == @deck.count

    puts "This is card number #{@round.turns.count + 1} out of #{@deck.count}."
    puts "Question: #{@deck.cards.first.question}"
    @round.take_turn(gets.chomp.capitalize)
    puts "-" * 50
    puts "#{@round.turns.last.feedback}"
    puts "-" * 50
  end

  puts "****** Game Over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}%."

  cat_names = []
  @round.turns.find_all do |turn|
    cat_names << turn.card.category
  end

  cat_names.uniq.each do |name|
    puts "#{name} - #{@round.percent_correct_by_category(name)}%"
  end

  puts "-" * 50
end

start
