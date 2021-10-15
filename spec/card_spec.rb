require './lib/card'

RSpec.describe Card do
  # setup all tests
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  #test initialization
  it 'exists' do
    expect(@card).to be_instance_of(Card)
  end

  # check question
  it 'has a question' do
    expect(@card.question).to eq("What is the capital of Alaska?")
  end

  # check for answer
  it 'has an answer' do
    expect(@card.answer).to eq("Juneau")
  end

  # check for category
  it 'has a category' do
    expect(@card.category).to eq(:Geography)
  end
end
