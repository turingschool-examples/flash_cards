require 'spec_helper'

RSpec.describe CardGenerator do
  let!(:file) {'cards.txt'}
  let!(:generate) {CardGenerator.new(file).cards}
  let!(:cards) {generate.cards}

  it "is an instance of" do
    expect(generate).to be_a CardGenerator
  end

  it "can make cards" do
    expect(cards.first).to be_instance_of(Card)
  end
end
