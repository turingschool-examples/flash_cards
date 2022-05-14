require 'spec_helper'

RSpec.describe CardGenerator do
  let!(:file) {'cards.txt'}
  let!(:generator) {CardGenerator.new(file)}
  let!(:cards) {CardGenerator.new(file).cards}

  it "is an instance of" do
    expect(generator).to be_a CardGenerator
  end

  it "can make cards" do
    expect(cards).to include(Card)
  end

  it "can tell number of cards" do
    expect(cards.size).to eq(4)
  end
end
