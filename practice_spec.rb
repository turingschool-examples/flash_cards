RSpec.describe Board do 

    it 'can mark spaces' do 
        board = Board.new("", "", "",
                          "", "", "", 
                          "", "", "",)

    expect(board.mark(x, 4)).to eq("", "", "",
                                   "", "x", "", 
                                   "", "", "",)
    end 

    it 'wont mark space twice' do 
        board = Board.new("", "", "",
                          "", "", "", 
                          "", "", "",)
    board.mark(x, 4)
    expect(board.mark(o, 4)).to eq("space taken")
    end 
end 
        