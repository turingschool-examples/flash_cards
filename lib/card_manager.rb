class CardManager
  attr_reader :cards_by_file

  def initialize(file_name=nil)
    @cards_by_file = {}
    load_from_file(file_name)
  end

  def load_from_file(file_name) 
    if @cards_by_file.has_key?(file_name)
      puts "File already loaded!"
    else
      if File.exist?(file_name)
        @cards_by_file[file_name] = []
        file_data = File.read(file_name).split("\n")
        file_data.map! { |data| data.split(',') }
        file_data.keep_if { |data| data.length == 3}
        file_data.each do |data| 
          @cards_by_file[file_name].push(Card.new(data[0], data[1], data[2]))
        end
      else
        puts "File does not exist!"
      end
    end
  end
end
