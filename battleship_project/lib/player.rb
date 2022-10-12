class Player
    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        # gets.chomp.split(" ").map { |ele| ele.to_i }
        gets.chomp.split(" ").map(&:to_i)
        #gets.chomp.split gives you the array ["num", "num"] instead of [num,num] so you 
        # need to map that array into a new array giving the values of num instead of the
        # string...    ex: ["0","1"].map(&:to_i) => [0,1]
    end
end
