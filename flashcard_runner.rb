require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("What is the tallest mountain in Russia?", "Mount Elbrus", :Geography)
@card_4 = Card.new("Where is the world's largest living aspen grove?", "Utah", :STEM)
@card_5 = Card.new("How many paintings did Vincent Van Gogh sell during his lifetime?", "1", :Art)
@card_6 = Card.new("What Spanish painter is often referred to as both the last of the Old Masters and the first of the moderns?", "Francisco de Goya", :Art)

@cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start(round)
  puts "Welcome! You're playing with #{@cards.count} cards."
  puts "-" * 50
  # Iterate through your cards deck/array/round to have a round of cards to ask questions and get answers

  # when deck finished output results
  @round.deck.cards.each do |card|
    card_number = @round.turns.length

    puts "This is card number #{card_number + 1} out of #{@cards.count} cards."
    puts "Question: #{card.question}"
    input = gets.chomp.to_s
    @round.take_turn(input)
    puts @round.turns[-1].feedback
  end
  # @round.turns.each do |turn|
  #   card_number = @round.turns.length
  #   puts "This is card number #{card_number + 1} out of #{@cards.count + card_number} cards."
  #   puts "Question: #{turn.question}"
end


start(@round)
