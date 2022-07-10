# require './card'

class CardGenerator
  attr_reader :card_group

  def initialize(filename)
   @card_group = [] 
   if File.exist?(filename) 
     File.open(filename).each do |line|
       answer_array = line.split(",")
       new_card = Card.new(answer_array[0],answer_array[1],answer_array[2].strip)
       @card_group << new_card
     end
   else
    p "File not read"
   end
  end

  def cards
    @card_group
  end
end
