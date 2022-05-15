require './lib/card_generator'

RSpec.describe CardGenerator do
	it "exists" do
		filename = "cards.txt"
		cards = CardGenerator.new(filename).cards

		expect(cards).to be_instance_of(CardGenerator)
	end
end
