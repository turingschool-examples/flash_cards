require './lib/card'

RSpec.describe Card do
  it 'checks if card1 exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card1).to be_instance_of(Card)
  end

  it 'checks if card2 exists' do
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    expect(card2).to be_instance_of(Card)
  end

  it 'checks if card1 has a question' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card1.question).to eq("What is the capital of Alaska?")
  end

  it 'checks if card2 has a question' do
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    expect(card2.question).to eq("Which planet is closest to the sun?")
  end

  it 'checks if card1 has an answer' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card1.answer).to eq("Juneau")
  end

  it 'checks if card2 has an answer' do
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM))

    expect(card2.answer).to eq("Mercury")
  end

  it 'checks if card1 has a category' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card1.category).to eq(:Geography)
  end

  it 'checks if card2 has a category' do
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    expect(card2.category).to eq(:STEM)
  end
end
