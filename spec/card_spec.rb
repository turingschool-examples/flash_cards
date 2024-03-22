require 'spec_helper'
require 'pry'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'has a question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    expect(card.question).to eq("What is the capital of Alaska?")
    expect(card_2.question).to eq("Which planet is closest to the sun?")
  end

  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    expect(card.answer).to eq("Juneau")
    expect(card_2.answer).to eq("Mercury")
  end

  it 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    expect(card.category).to eq(:Geography)
    expect(card_2.category).to eq(:STEM)
  end
end
