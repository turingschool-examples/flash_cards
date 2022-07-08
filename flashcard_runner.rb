require './lib/round'

cards = []

File.open('lib/flashcards.txt', 'r') do |file|
  for line in file.readlines
    import_card = line.split('/')
    card = Card.new(import_card[0], import_card[1], import_card[2].strip.to_sym)
    cards << card
  end
end

cards = cards.sample(cards.count)
deck = Deck.new(cards)
round = Round.new(deck)

round.start
