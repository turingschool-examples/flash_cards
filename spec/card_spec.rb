require './lib/card'

RSpec.describe Card do

  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  it 'exists' do
    expect(@card).to be_instance_of(Card)
  end

  it 'has a question' do
    expect(@card.question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    expect(@card.answer).to eq("Juneau")
  end

  it 'has a category' do
    expect(@card.category).to eq(:Geography)
  end
end
