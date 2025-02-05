require './lib/card'
require 'rspec'
require 'pry'

describe Card do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography) # i didnt document any of these cause I am dumb
  end

  it 'initialize' do
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

  it 'can change the question' do
    @card.instance_variable_set(:@question, "What is the capital of California?")
    expect(@card.question).to eq("What is the capital of California?")
  end

  it 'can change the answer' do
    @card.instance_variable_set(:@answer, "Sacramento")

    expect(@card.category).to eq(:Geography)
  end
end
