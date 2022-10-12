require_relative "board"
require_relative "human_player"

class Game
    attr_reader :player_1_mark, :player_2_mark

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            # until @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory " + @current_player.mark.to_s + "!"
                @board.print
                @board = Board.new
                return
            else
                self.switch_turn
            end
        end
        puts "DRAW" if !@board.empty_positions? 
    end
end