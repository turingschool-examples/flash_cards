require_relative 'card'

class CardGenerator

  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []

    #get every line in the file
    all_lines = IO.readlines(filename, chomp:true)

    #for every line in readlines array,
    # split at the comma
    split_items = all_lines.map {|item| item.split(",")}

    # for every item in the split_items array
    split_items.each do |item|
      question = item[0]
      answer = item[1]
      category = item[2].to_sym

      #create a card object from 3 elements at a time
      @cards << Card.new(question, answer, category)

    end
  end
end
