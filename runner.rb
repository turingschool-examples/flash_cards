# require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'lib/card'
require_relative 'lib/turn'
require_relative 'lib/deck'
require_relative 'lib/round'

card_0 = Card.new("The number 3.14 is better known as ______?", "pi", :STEM)
card_1 = Card.new("What is the capital of Alaska?", "juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "north north west", :STEM)
card_4 = Card.new("What rock group is best known for the song Bohemian Rhapsody?", "queen", :PopCulture)
card_5 = Card.new("What is the southernmost continent?", "antarctica", :Geography)
card_6 = Card.new("What is the name of Jon Snow's direwolf in Game of Thrones?", "ghost", :PopCulture)
card_7 = Card.new("What is the capital of Russia?", "moscow", :Geography)
card_8 = Card.new("The number 1.618 is known as the _______ _____.", "golden ratio", :STEM)
card_9 = Card.new("In 2009, Heath Ledger posthumously won an Oscar for what role?", "the joker", :PopCulture)


@cards = [card_0, card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9]
@original_cards = [card_0, card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9]
@deck = Deck.new(@cards)
@round = Round.new(@deck)
@total_cards = @cards.count

puts "-" * 50
puts "Welcome! You're playing with #{@total_cards} cards!"
puts "-" * 50

def start
  while @round.deck.count > 0
    puts "-" * 50
    puts "This is card #{@round.turns.length + 1} out of #{@total_cards}"
    puts "Question: #{@round.current_card.question}"
    @round.take_turn(gets.chomp.downcase)
    puts @round.turns[@round.turns.count - 1].feedback
    puts "-" * 50
  end
end

def game_over
  puts "********** GAME OVER! **********"
  puts "You had #{@round.number_correct} correct guesses out of #{@total_cards} for a total of #{@round.percent_correct}%"
end

def print_results_by_category
  all_cats = @original_cards.map do |card|
    card.category
  end

  all_cats.uniq.each do |category|
    puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
  end
  puts ""
end

start
game_over
print_results_by_category
