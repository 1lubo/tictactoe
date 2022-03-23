require './player'
require './board'

def get_player_name(number)
    player_name = ''

    while player_name.length < 1
        puts "What's your name player# #{number}?"
        player_name = gets.chomp.to_s
        if player_name.length < 1
            puts "Cute. But I really need a name. At least one character in length."    
            puts    
        else
            puts "Thanks #{player_name}"
            puts
            return player_name
        end
    end
end

def create_players
    players = []

    (1..2).each do |i| 
        players.push( get_player_name(i) )
    end
    
    player1 = Player.new(players[0])
    player2 = Player.new(players[1])

    return player1, player2

end



def start_game

    play_game = false
    
    puts "This is a game of ol' fashioned tic tac toe. Would you like to play a game?"

    while !play_game    
        
        player_answer = gets.chomp

        if player_answer.downcase == 'y' || player_answer.downcase == 'yes'
            puts "OK. Let's play!"
            puts
            play_game = true

        elsif player_answer.downcase == 'n' || player_answer.downcase == 'No'
            puts "K. BYEEE!"
            return play_game
        
        else
            puts "No really, would you like to play Yes / No ?"    

        end

    end

    return play_game

end

def game_loop()
    board = Board.new()
    

    play = start_game
    player1, player2 = create_players
    board.to_s
    puts
    while play
        player1_choice = player1.make_choice(board)
        board.write_square(player1.mark, player1_choice)
        board.to_s
        puts
        round_result = board.check_scores        
        if round_result
            puts round_result
            play = false
            next
        end

        player2_choice = player2.make_choice(board)
        board.write_square(player2.mark, player2_choice)
        puts
        board.to_s
        puts
        round_result = board.check_scores        
        if round_result
            puts round_result
            play = false
            next
        end
    end
end

