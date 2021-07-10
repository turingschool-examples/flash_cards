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
    card_1 = Card.new("Question: What is 5 + 5?", 10, :STEM)
    cards = [card_1]
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)

    expect(flashcard_runner.start_message).to eq("Welcome! You're playing with 1 cards. \n
    ------------------------------------------------- \n")
  end

  it "has card count ratio" do
    card_1 = Card.new("Question: What is 5 + 5?", 10, :STEM)
    cards = [card_1, card_1]
    deck = Deck.new(cards)
    round = Round.new(deck)
    flashcard_runner = FlashcardRunner.new(round)

    expect(flashcard_runner.card_count_ratio).to eq("This is card number 1 out of 2. \n")
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
