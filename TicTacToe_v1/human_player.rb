class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts 'enter a position with coordinates separated with a space like `4 7`'
        position = gets.chomp.split.map(&:to_i)
        raise "sorry, that is an invalid input" if position.length != 2 || position.any? { |num| num > 2 || num < 0 }
        position
    end
end