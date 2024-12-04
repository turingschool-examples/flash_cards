# frozen_string_literal: true

require_relative '../lib/card'
require 'rspec'

RSpec.describe Card do
  describe 'Initialization' do
    it 'is an instance of Card' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      expect(card).to be_instance_of(Card)
    end
  end

  describe 'Store and retrieve data' do
    it 'has a question' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      expect(card.question).to eq('What is the capital of Alaska?')
    end

    it 'has an answer' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      expect(card.answer).to eq('Juneau')
    end

    it 'has a category' do
      card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)

      expect(card.category).to eq(:Geography)
    end
  end
end
