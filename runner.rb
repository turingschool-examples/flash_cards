# require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'lib/card'
require_relative 'lib/turn'
require_relative 'lib/deck'
require_relative 'lib/round'

card_0 = Card.new("What is 1+1?", "two", :Math)
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

@cards = [card_0, card_1, card_2, card_3]
@deck = Deck.new(@cards)
@round = Round.new(@deck)
@total_cards = @cards.count

def start
  while @round.deck.count > 0
    p "Welcome! You're playing with #{@total_cards} cards!"
    p "-" * 50
    p "This is card #{@round.turns.length + 1} out of #{@total_cards}"
    p "Question: #{@round.current_card.question}"
    @round.take_turn(gets.chomp)
    p @round.turns.first.feedback
    puts ""
  end
end

def game_over
  p "********** GAME OVER! **********"
  p "You had #{@round.number_correct} correct guesses out of #{@total_cards} for a total of #{@round.percent_correct}%"
end

def get_categories
  @cards.map do |card|
    card.category
  end
end

def print_results_by_category
  all_cats = get_categories

  all_cats.uniq.each do |category|
    # require "pry"; binding.pry
    p "#{category} - #{@round.percent_correct}"
  end
end

# require "pry"; binding.pry
start
game_over
print_results_by_category
