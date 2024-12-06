# frozen_string_literal: true

require_relative '../lib/card'
require 'rspec'

describe Card do
  let(:card) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }

  describe 'Initialization' do
    it 'is an instance of Card' do
      expect(card).to be_instance_of(Card)
    end
  end

  describe 'Store and retrieve data' do
    it 'has a question' do
      expect(card.question).to eq('What is the capital of Alaska?')
    end

    it 'has an answer' do
      expect(card.answer).to eq('Juneau')
    end

    it 'has a category' do
      expect(card.category).to eq(:Geography)
    end
  end
end
