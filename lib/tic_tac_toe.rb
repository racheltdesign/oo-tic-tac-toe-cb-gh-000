class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,4,8], # diagonal 1
    [2,4,6], # diagonal 2
    [0,3,6], # vertical 1
    [2,5,8], # vertical 2
    [1,4,7] # vertical 3
  ]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(input)
     index = input.to_i - 1
   end

   def move(index, player="X")
     @board[index] = player
   end

   def position_taken?(index)
     if @board[index] == " " || @board[index] == "" || @board[index] == nil
       return false
     else
       return true
     end
   end

   def valid_move?(index)
     if position_taken?(index)
      return false
     elsif index <= 8 && index >= 0
      return true
     else
      return false
     end
   end

   def turn
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       move(index, current_player)
       display_board
     else
      turn
     end
   end

   def turn_count
     count = 0
     @board.each do |position|
       if position == "X" || position == "O"
        count += 1
       end
     end
     return count
   end

   def current_player
     if turn_count % 2 == 0
        return "X"
      else
        return "O"
      end
    end

    def won?
    won = false
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        won = true
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        won = true
        return win_combination
        end
      end
      return false
    end

    def full?
       if @board.find {|position| position == " "} == nil
      return true
    else
      return false
      end
    end

     def draw?
       if full? == true && won? == false
          return true
        else
          return false
        end
      end

     def over?
       if full? || won? || draw?
        return true
      else
        return false
        end
      end

     def winner
       if won?
       win_positions = won?
       if @board[win_positions[1]] == "X"
         return "X"
       elsif @board[win_positions[1]] == "O"
         return "O"
       else
         return nil
       end
     end
   end

     def play
       until over? do
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
end
