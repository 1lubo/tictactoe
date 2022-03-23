require './board'

class Player
    @@Instances = 0

    attr_reader :mark

    def initialize(name)
        @name = name
        @mark = assign_mark
        @@Instances += 1
    end

    def mark
        @mark
    end

    def assign_mark
        if @@Instances == 0
            return 'X'
        elsif @@Instances == 1
            return 'O'
        end
    end

    def make_choice(board)

        choice = false

        puts
        puts "OK #{@name}. Your mark is #{@mark}"
        puts "Rows and columns start at 0 and go to 2"
        puts "Entering letters instead of integers will automatically convert the letter to the number 0"

        while !choice
            puts "Please enter the row and column number where you would like to put your mark. Please use format row#,column#"
            puts
            
            choice = gets.chomp
            puts
            
            if !(choice.include?",")
                puts "Please make sure to use the correct format"   
                puts 
                choice = false
                next
            else
                choice = choice.split(',')
            end

            if choice.length < 2
                puts "Please make sure to use the correct format"   
                puts 
                choice = false
                next
                         
            else
                choice = choice.map { |coord| coord.to_i.abs }
            end

            if choice[0] > 2 || choice[1] > 2
                puts "Please enter numbers between 0 and 2"
                puts
                choice = false
            end

            if !board.check_sqaure(choice[0], choice[1])
                puts "That square is already take. Please select another one."
                puts
                choice = false
                next
            end
            
        end
        return choice
    end

    
end



