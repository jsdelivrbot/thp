require 'Pry'
require 'matrix'

#Define a boardcase class
class BoardCase
	attr_accessor :value, :full

	def initialize(row,column)
		@value = " "
		@full = false
	end

end

#Define a Board class that will be displayed at each turn and used to check if someone has won
class Board
	attr_accessor :game_end, :victory_reason, :case11, :case12, :case13, :case21, :case22, :case23, :case31, :case32, :case33

	def initialize
		#Initialise game_end. If true then game is over, either tie or win for one of the two players
		@game_end = false
		#Initialize victory_reason
		@game_end_reason = " "
		#Initialise all the Boardcases
		@case11 = BoardCase.new(1,1)
		@case12 = BoardCase.new(1,2)
		@case13 = BoardCase.new(1,3)
		@case21 = BoardCase.new(2,1)
		@case22 = BoardCase.new(2,2)
		@case23 = BoardCase.new(2,3)
		@case31 = BoardCase.new(3,1)
		@case32 = BoardCase.new(3,2)
		@case33 = BoardCase.new(3,3)
	end


	#Check is there is a complete line, based on a symbol, either "X" or "O"
	def check_if_line_completed(symbol)
		#Initiate completed_line @ false / and create the vector upon which we will check the lines of the Board
		completed_line = false
		vector = [symbol,symbol,symbol]
		#Check if there is a completed line of the symbol in input of the method : check the 3 rows, 3 columns and 2 diagonals
		completed_row_or_column = ([case11.value, case12.value, case13.value] == vector || [case21.value, case22.value, case23.value] == vector || [case31.value, case32.value, case33.value] == vector || [case11.value, case21.value, case31.value] == vector || [case12.value, case22.value, case32.value] == vector || [case13.value, case23.value, case33.value] == vector)
		#Check if there is a diagonal that is completed
		completed_diagonal = false
		completed_diagonal = ([case11.value, case22.value, case33.value] == vector)
		#Check if there is the "anti" diagonal that is completed
		completed_anti_diagonal = false
		completed_anti_diagonal = ([case13.value, case22.value, case31.value] == vector)
		#Sum-um if there is a completed line
		completed_line = (completed_row_or_column || completed_diagonal || completed_anti_diagonal)
		completed_line 
	end

	#Check if all cases of the board are different from " "
	def check_if_board_full
		board_is_full = false
		if (case11.value != " ") && (case12.value  != " ") && (case13.value  != " ") && (case21.value  != " ") && (case22.value  != " ") && (case23.value  != " ") && (case31.value  != " ") && (case32.value  != " ") && (case33.value  != " ")
			board_is_full = true
		end
		board_is_full
	end	

	def display_board
		puts " ------BOARD------"
		puts "Row1 :: [#{@case11.value},#{@case12.value},#{@case13.value}]"
		puts "Row2 :: [#{@case21.value},#{@case22.value},#{@case23.value}]"
		puts "Row3 :: [#{@case31.value},#{@case32.value},#{@case33.value}]"
		puts " -----------------"
	end

	def check_if_case_already_taken(case_row,case_column)
		if eval("case#{case_row}#{case_column}.full == true")
			return true
		else
			return false
		end
	end

	def update_case(case_row,case_column,symbol)
		eval("@case#{case_row}#{case_column}.value = symbol")
		eval("@case#{case_row}#{case_column}.full = true")
	end

end


#Define a Player class that will have two instances, one for each player.
class Player
	attr_accessor :name, :symbol

	#Initialize a player instance, asking them their name
	#Symbol will we defined in Gameclass instance
	def initialize
		print "Enter your war name, brave tic-tac-toe player: "
		a= gets.chomp
		@name = a
		@symbol = ""
	end

	def chose_case
		puts "#{name}, it's your turn to play and to chose a case"
		#Select the row of the case
		puts "Select the row of the case you want, from 1 to 3"
		case_row = gets.chomp.to_i
		#Select the column of the case
		puts "Select the column of the case you want, from 1 to 3"
		case_column = gets.chomp.to_i
		return [case_row,case_column]
	end

	def def_symbol(symbols)
		@symbol = symbols
	end

end


#Define the Game class that will initiate all classes and launch the game
class Game
	attr_accessor :name_game, :board1, :player1, :player2

	def initialize(name_of_the_game)
		@name_game = name_of_the_game
		#Initialise board class
		@board1 = Board.new
		#Initialise the two players, their name, their symbol and define which player starts the game
		puts "-----------WELCOME TO TIC TAC TOE-----------"
		print "Player 1,"
		@player1 = Player.new
		player1.def_symbol("X")
		print "Player 2,"
		@player2 = Player.new
		player2.def_symbol("O")

		#Launch the game
		launch_the_game
	end

	#Update the game_end to true if we reach one of the possible ends of the game
	def update_game_status
		#Check if player 1 has won
		game_end_reason = ""
		if  board1.check_if_line_completed("X")
			@board1.game_end = true
			game_end_reason = "The game has ended. #{player1.name} has won!"
			board1.display_board
		#Check if player 2 has won
		elsif board1.check_if_line_completed("O")
			@board1.game_end = true
			game_end_reason = "The game has ended. #{player2.name} has won!"
			board1.display_board
		#Check if all Broadcases are full and then we can deduce a tie
		elsif board1.check_if_board_full
			@board1.game_end = true
			game_end_reason = "The game has ended. We have a tie."
			board1.display_board
			#Modifier et mettre tie
		end
		puts game_end_reason
		@board1.game_end
	end

	#Launch the game 
	def launch_the_game

		#Repeat until the games end the following actions
		until board1.game_end == true
			#Ask the first player to chose a case
			board1.display_board
			choice = player1.chose_case
				#Verify if case is already taken, if true, ask to chose another one
				while board1.check_if_case_already_taken(choice[0],choice[1])
					puts "Sorry this board case is already taken, chose another one"
					board1.display_board
					choice = player1.chose_case
				end
			#Assign the choice of the first player to the board
			board1.update_case(choice[0],choice[1], player1.symbol)
			
			#Update the board game status
			update_game_status
			
			if board1.game_end != true
				#Ask the second player to chose a case
				board1.display_board
				choice = player2.chose_case
					#Verify if case is already taken, if true, ask to chose another one
					while board1.check_if_case_already_taken(choice[0],choice[1])
						puts "Sorry this board case is already taken, chose another one"
						board1.display_board
						choice = player2.chose_case
					end
				#Assign the choice of the first player to the board
				board1.update_case(choice[0],choice[1], player2.symbol)
				
				#Update the board game status
				update_game_status
			end
		end
	end

	#Determine the end of the game
end


tic_tac_toe = Game.new("Tic Tac Toe")