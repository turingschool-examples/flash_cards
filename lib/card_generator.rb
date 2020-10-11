class CardGenerator

    attr_reader :filename 
    def initialize ( filename)
        @filename = filename
        
    end

    def create_objects
        card_data =  File.readlines(@filename)
        card_data.inject([]) do |line_arr , line|
            new_line = line.chomp.split(",")
            line_arr << Card.new(new_line[0].strip, new_line[1].strip , new_line[2].strip.to_sym)
        end
    end
end