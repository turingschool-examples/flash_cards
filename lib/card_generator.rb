class CardGenerator
   attr_reader :filename

   def initialize(filename)
     @filename = filename
   end

   def cards
     card_file = File.readlines(filename).collect do |line|
       card = line.chomp.split(',')
       question = card[0]
       answer = card[1]
       category = card[2]
       Card.new(question, answer, category)
     end
   end
end
