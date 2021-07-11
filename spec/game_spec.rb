require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/round'
require './lib/turn'
require './lib/game'

RSpec.describe FlashcardRunner do
  it "exists" do
    cards = []
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)
    flashcard_runner.game_over_categories
    expect(flashcard_runner).to be_a(FlashcardRunner)
  end

  it "has attributes" do
    cards = []
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)

    expect(flashcard_runner.round).to eq(round)
  end

  it "gets user input" do
    cards = []
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)

    allow_any_instance_of(FlashcardRunner).to receive(:get_user_input).and_return("input")
    expect(flashcard_runner.get_user_input).to eq("input")
  end

end
