require 'pry'
class TicTacToe
    #attr_accessor :index
    def initialize
        @board = Array.new(9, " ")
    end
    
    WIN_COMBINATIONS = [
        [0,1,2],[3,4,5],[6,7,8],[0,3,6],
        [1,4,7],[2,5,8],[0,4,8],[2,4,6]
    ]


    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        index = input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            return true
        else
            false
        end #if @board[3] has an X or O, it's true
    end

    def valid_move?(index)
        
        if index.between?(0,8) && position_taken?(index) == false
           true
        else
           false
        end #index is in raange (0..8) and position_taken? == false
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn   #(board)
        puts "Please enter 1-9:" #ask for input,  get input
        input = gets.strip
        index = input_to_index(input) # translate input into index
            if valid_move?(index) # if index is valid
                token = current_player #   make the move for index
                move(index, token)
            else# else
                turn#   ask for input again
            end
    display_board
    end
     
    def won?  #if WIN_COMBINATIONS are all X's or O's
        WIN_COMBINATIONS.each do |array|
        if  (@board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X") || 
            (@board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O")
            return (array)      
            end
        end 
        return false
    end

    def full? ##in-progress game
        @board.all? {|spaces| spaces != (" ")}    
    end

    def draw? #not won?
        !won? && full?
    end

    def over?
        won? || draw?
    end

    def winner #given won?
        if array = won?  # something needs to win. you can't just put won?
        @board[array[0]] 
        end
    end

    def play#repeat turn until game is over
           turn until over?  # if !over? then turn
           if won?
           puts "Congratulations #{winner}!"
           else
            puts  "Cat's Game!"
                
            end
           #binding.pry
    end
end
