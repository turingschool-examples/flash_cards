require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@cards = [@card_1, @card_2, @card_3]
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
end

start
