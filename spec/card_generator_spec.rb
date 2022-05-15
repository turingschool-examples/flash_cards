require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do

  cards = CardGenerator.new("cards2.txt").cards

  card_1 = Card.new("What is the capital of Togo?", "Lome", :Geography)
  card_2 = Card.new("The _______ Trench is the deepest point on Earth.", "Mariana", :Geography)
  # card_3 = Card.new("What year did the Titanic sink?", "1912", :History)
  card_4 = Card.new("Salvador _______ is a Spanish surrealist painter.", "Dali", :Art)
  # card_5 = Card.new("Who painted 'La Guernica'?", "Picasso", :Art)
  # card_6 = Card.new("The Count of Monte Cristo is set in which country?", "France", :Literature)
  # card_7 = Card.new("What does the Spanish word 'embarazada' mean?", "Pregnant", :Languages)
  card_8 = Card.new("What county is Centennial CO in?", "Arapahoe", :Geography)

  it "can create an array of cards" do
    expect(cards).to be_a(Array)
  end

  it "creates all cards" do
    expect(cards.length).to eq(10)
  end

  it "creates equivalent cards" do
    expect(cards.first.question).to eq(card_1.question)
    expect(cards[1].answer).to eq(card_2.answer)
    expect(cards[3].category).to eq(card_4.category)
    expect(cards[7].category).to eq(card_8.category)
  end
end
