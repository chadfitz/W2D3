class Board
    def initialize
        @grid = Array.new(3) {Array.new(3,"_")}
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end 

    def valid?(position)
        row, col = position
        if row >= @grid[0].length || row < 0 || col > @grid.length || col < 0
            puts "potition is out of bounds"
            return false
        else
            return true
        end
    end

    def empty?(position_arr)
        if self[position_arr] == "_"
            return true
        else
            puts "that position is taken"
            return false
        end
    end

    def place_mark(position, mark)
        if empty?(position) && valid?(position)
            self[position] = mark
        else
            raise_error
        end
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        first = (0...@grid.length).all? { |i| self[[i,i]] == mark }

        second = (0...@grid.length).all? { |i| self[[i,(@grid.length-1-i)]] == mark }
        first || second
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        (0...@grid.length).any? { |i| self[[i,i]] == "_"}
    end
end