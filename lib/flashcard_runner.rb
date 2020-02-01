require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What country has the most natural lakes?", "Canada", :Geography)
card2 = Card.new("What is the only sea without any coasts?", "Sargasso Sea", :Geography)
card3 = Card.new("What is Michael Bluth's son's name in the television show, Arrested Development?", "George Michael", :Pop_Culture)
card4 = Card.new("Who plays Moira Rose in the television show, Schitt's Creek?", "Catherine O'Hara", :Pop_Culture)

cards = [card1, card2, card3, card4]
card_total = cards.length
new_deck = Deck.new(cards)
new_round = Round.new(new_deck)

puts "Welcome! You're playing with #{cards.length} cards."
puts "-------------------------------------------------"

loop do
  if new_round.turns.length == 0
    puts "This card is number 1 out of #{card_total}."
    puts new_deck.cards.first.question
    print "> "
    user_guess_input = gets.chomp
    new_turn = Turn.new(user_guess_input, new_deck.cards.first)
    new_round.take_turn(new_turn.guess)
    puts new_turn.feedback
    new_round.current_card
  else
    puts "This card is number #{new_round.turns.length + 1} out of #{card_total}."
    puts new_round.current_card.question
    print "> "
    user_guess_input = gets.chomp
    new_turn = Turn.new(user_guess_input, new_round.current_card)
    new_round.take_turn(new_turn.guess)
    puts new_turn.feedback
    new_round.current_card

    if new_round.turns.length == 4
      break
    end
  end
end


puts  "****** Game over! *******"
puts "You had #{new_round.number_correct} out of 4 for a total score of #{new_round.percent_correct} %."
puts "Geography - #{new_round.percent_correct_by_category(:Geography)} % correct."
puts "Pop Culture - #{new_round.percent_correct_by_category(:Pop_Culture)} % correct."
