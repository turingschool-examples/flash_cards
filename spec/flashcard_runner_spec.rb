require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/round'
require './lib/turn'
require './flashcard_runner'

RSpec.describe FlashcardRunner do
  it "exists" do
    cards = []
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)

    expect(flashcard_runner).to be_a(FlashcardRunner)
  end

  it "has attributes" do
    cards = []
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)

    expect(flashcard_runner.round).to eq(round)
  end

  it "has a start message" do
    cards = []
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)
  end
end
