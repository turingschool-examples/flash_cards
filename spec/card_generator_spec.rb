require './lib/card_generator'

RSpec.describe CardGenerator do
  context '#initialize' do
    it 'exists' do
      filename = 'cards.txt'
      card_generator = CardGenerator.new(filename)

      expect(card_generator).to be_instance_of(CardGenerator)
    end

    # I'm not sure this filename needs a reader?
    it 'has a filename' do
      filename = 'cards.txt'
      card_generator = CardGenerator.new(filename)

      expect(card_generator.filename).to eq('cards.txt')
    end

    # I have no idea how to test this.
    # Also I'm not sure @raw_cards needs to be readable outside the class.
    it 'has raw cards from file' do

    end
  end

  # This just opens cards, read-only. I'm not sure how to test this.
  context '#open_cards' do

  end

  # Similar to above, the following test is difficult since the file may change.
  # context '#raw_cards_by_line' do
  #   it 'outputs array with each line' do
  #     filename = 'cards.txt'
  #     card_generator = CardGenerator.new(filename)
  #
  #     raw_cards = card_generator.raw_cards_by_line
  #
  #     expect(raw_cards).to be_instance_of(Array)
  #
  #     # I assume this is a faux paux? Just curious.
  #     raw_cards.each do |element|
  #       expect(element).to be_instance_of(String)
  #     end
  #   end
  # end

  context '#remove_newlines' do
    it 'removes \n from an array of strings' do
      filename = 'cards.txt'
      card_generator = CardGenerator.new(filename)

      array = [
        "this is my array, wow it is neat, do you not like it?\n",
        "for reals, what a good, test it really is\n"
      ]

      expect(card_generator.remove_newlines(array)).to eq(['this is my array, wow it is neat, do you not like it?','for reals, what a good, test it really is'])
    end
  end

  context '#split_on_commas' do
    it 'Splits string elements into array of strings, within an array' do
      filename = 'cards.txt'
      card_generator = CardGenerator.new(filename)

      array = [
        'this is my array,wow it is neat,do you not like it?',
        'for reals,what a good,test it really is'
      ]

      expect(card_generator.split_on_commas(array)).to eq([['this is my array','wow it is neat','do you not like it?'],['for reals','what a good','test it really is']])
    end
  end

  context '#make_cards_from_array' do
    it 'makes an array of cards' do
      filename = 'cards.txt'
      card_generator = CardGenerator.new(filename)

      array = [
        ['whats up doc?','i tot i taw a putty tat','looney tunes'],
        ['all you need is:','pizza','john lennon']
      ]
      cards = card_generator.make_cards_from_array(array)

      cards.each do |card|
        expect(card).to be_instance_of(Card)
      end
    end
  end

  # Script method. Nothing to test?
  context '#cards' do

  end
end
