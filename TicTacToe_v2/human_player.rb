require_relative "board"
require_relative "game"

class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts 'enter a position with coordinates separated with a space like `0 2`'
        position = gets.chomp.split.map(&:to_i)
        raise "sorry, that is an invalid input" if position.length != 2 || position.any? { |num| num > 2 || num < 0 }
        # while position.length != 2 || position.any? { |num| num > 2 || num < 0 }
        #     puts "sorry, invalid input"
        #     puts 'enter a position with coordinates separated with a space like `0 2`'
        #     position = gets.chomp.split.map(&:to_i)
        # end
        position
    end
end