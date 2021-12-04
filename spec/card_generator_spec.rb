require '../lib/card_generator'
require '../lib/card'

describe CardGenerator do
  let(:filename) {"cards.txt"}
  subject {CardGenerator.new(filename)}

  it "accepts a filename" do
    expect(subject.filename).to eq("cards.txt")
  end

end
