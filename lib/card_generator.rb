class CardGenerator

    def initialize(file)
        @file = file
        @file_data = []
        @separate_data = []
    end

    def read_file
        @file_data = File.read(@file).split("\n")
    end

    def separate_data
        @file_data.each do |raw_card_data|
            @separate_data << raw_card_data.split(",")
        end
    end
end