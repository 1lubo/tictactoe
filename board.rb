
class Board
    attr_accessor :board

    def initialize
        @board = Array.new(3) {Array.new(3, "-")}


    end

    def to_s
        @board.each_with_index do |row, ind|
           if ind < 2
            puts build_rows_one_two(row)
           else
            puts build_row_three(row)
           end
        end   
        puts 
    end

    def build_rows_one_two(row)
        
        result = ""
        row.each_with_index do |mark, ind|
            if mark == "-" && ind < 2
                result = result + "_|"
            elsif mark == "-" && ind == 2
                result = result + "_"
            elsif mark != "-" && ind < 2
                result = result + mark + "|"
            else 
                result = result + mark
            end            
        end

        return result
    end

    def build_row_three(row)
        result = ""
        row.each_with_index do |mark, ind|
            if mark == "-" && ind < 2
                result = result + " |"  

            elsif mark == "-" && ind == 2          
                result = result + " "
            elsif mark != "-" && ind < 2
                result = result + mark + "|"
            else
                result = result + mark
            end            
        end

        return result
    end


    def check_sqaure(row, column)
        
        if @board[row][column] == 'X' || @board[row][column] == 'O'
            return false
        else
            return true
        end
    end

    def write_square(player_mark, coordinates)

        square_empty = check_sqaure(coordinates[0], coordinates[1])

        if square_empty
            @board[coordinates[0]][coordinates[1]] = player_mark
            return true
        else
            puts "This square is already taken. Make another choice."
            return false
        end
    end

    def check_scores
        
        winner = false
        round_winner = [check_rows, check_columns,check_diagonals]
        round_winner.each do |score|
            if score
                winner = score
                return winner
            end
        end

        return winner

    end
    
    def check_rows
        winner = false
        @board.each do |row|
            if row.all? { |mark| mark == "X" }
                winner = "Player 1 wins"
                return winner
            elsif row.all? { |mark| mark == "O" }
                winner = "Player 2 wins"
                return winner
            end

        end

        return winner
    end

    def check_columns
        columns = Array.new(3) {Array.new(3)}
        columns[0] = [@board[0][0], @board[1][0], @board[2][0]]
        columns[1] = [@board[0][1], @board[1][1], @board[2][1]]
        columns[2] = [@board[0][2], @board[1][2], @board[2][2]]

        winner = false
        columns.each do |column|
            if column.all? { |mark| mark == "X" }
                winner = "Player 1 wins"
                return winner
            elsif column.all? { |mark| mark == "O" }
                winner = "Player 2 wins"
                return winner
            end

        end

        return winner

    end

    def check_diagonals
        diagonals = Array.new(2) {Array.new(3)}
        diagonals[0] = [@board[0][0], @board[1][1], @board[2][2]]
        diagonals[1] = [@board[0][2], @board[1][1], @board[2][0]]
        

        winner = false
        diagonals.each do |diagonal|
            if diagonal.all? { |mark| mark == "X" }
                winner = "Player 1 wins"
                return winner
            elsif diagonal.all? { |mark| mark == "O" }
                winner = "Player 2 wins"
                return winner
            end

        end

        return winner

    end


end
             