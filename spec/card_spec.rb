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
    expect(@card.question).to be_instance_of(String)
  end

  it 'has an answer' do
    expect(@card.answer).to eq("Juneau")
    expect(@card.answer).to be_instance_of(String)
  end

  it 'has a category' do
    expect(@card.category).to eq(:Geography)
    expect(@card.category).to be_instance_of Symbol
  end
end
