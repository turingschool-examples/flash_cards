# Will need to include the Card file in order to access its contents for testing
require 'rspec'
require './lib/card.rb'

RSpec.describe Card do
  context 'Initialize' do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card).to be_instance_of(Card)
    end

    it 'has a question' do
      # creating an instance of card in each spec is repetitive
      # by doing before(:each) do, we can create a spec of its own to run before
      # each spec is run so that a new instance is created automatically
      # we want to have a clean slate for each spec so that they are all
      # independent of one another
      # before(:each) do
      # card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      # https://makandracards.com/makandra/11507-using-before-all-in-rspec-will-cause-you-lots-of-trouble-unless-you-know-what-you-are-doing
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.question).to eq("What is the capital of Alaska?")
    end

    it 'has an answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.answer).to eq("Juneau")
    end

    it 'has a category' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card.category).to eq(:Geography)
    end
  end
end
