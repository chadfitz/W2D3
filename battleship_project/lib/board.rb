class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each { |arr| puts arr.join(" ") }
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n * n
    end

    def [](position)
        arr, index = position
        @grid[arr][index]
    end

    def []=(position, value)
        arr, index = position
        @grid[arr][index] = value
    end 

    def num_ships
        # count = 0
        # @grid.each do |arr|
        #     arr.each { |ele| count += 1 if ele == :S }
        # end
        # count
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        total_ships = @size * 0.25

        while self.num_ships < total_ships
            self[[rand(0...@grid.length), rand(0...@grid.length)]] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |arr|
            arr.map do |ele|
                if ele == :S
                    ele = :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
