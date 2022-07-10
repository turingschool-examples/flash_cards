require './lib/round'

cards = []

File.open('lib/flashcards.txt', 'r') do |file|
  file.readlines.each do |line|
    import_card = line.split('/')
    card = Card.new(import_card[0], import_card[1], import_card[2].strip.to_sym)
    cards << card
  end
end

# prompt user for total number of cards in the game, scaleable
print "How many cards would you like to play with? (1-#{cards.count}): "
custom_deck_size = gets.chomp.to_i
cards = cards.sample(custom_deck_size)

deck = Deck.new(cards)
round = Round.new(deck)

round.start
