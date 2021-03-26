require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

# @card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
# @card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
# @card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
# @card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
# @card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
@card1 = Card.new('What is the capital of CO?', '1', :Geography)
@card2 = Card.new('What is the captial of Mexico?', '2', :Geography)
@card3 = Card.new('What is the boiling point (degrees celcius) of water?', '3', :Science)
@card4 = Card.new('What position did Satchel Paige play?', '4', :Sports)
@card5 = Card.new('What element is abbreviated as Cl?', '5', :Science)
@cards = [@card1, @card2, @card3, @card4, @card5]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start
  puts "Welcome! You're playing with #{@round.deck.cards.count} cards."
  puts "--------------------------------------------------------------------"
  while @round.current_card_count < (@round.deck.cards.count) do
    puts "This is card #{@round.current_card_count + 1} of #{@round.deck.cards.count}"
    puts "Question: #{@round.deck.cards[@round.current_card_count].question}"
    @player_guess = gets.chomp
    @round.take_turn(@player_guess)
    # require "pry"; binding.pry
    puts (@round.turns[@round.current_card_count - 1].feedback)
  end
  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}%."
  @all_categories = @round.deck.cards.collect {|card| card.category}
  @unique_categories = @all_categories.uniq
  @category_string_names = @unique_categories.collect {|category| category.to_s}
  # require "pry"; binding.pry
  @category_names_final = @category_string_names.collect {|category_upcase| category_upcase.upcase}
  @categories_percent_correct = @unique_categories.collect { |category_percent| @round.percent_correct_by_category(category_percent) }
  @unique_categories.each_with_index do |category, index|
    # require "pry"; binding.pry
    puts "#{@category_names_final[index]} - #{@categories_percent_correct[index]}% correct"
  end
end

start
