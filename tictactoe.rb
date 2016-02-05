

# Method translates and prints board
def print_board(board)
  print "    (a) (b) (c)\n"
  for x in (0..2)
    print " (#{x + 1}) "
    for i in (0..2)
      case board[x][i]
      when 0
        print " _ "
      when 1
        print " X "
      when -1
        print " O "
      end
    end
    print "\n"
  end
end

# Method alpha turns letter value of coordinate to array position index
def alpha(value)
    case value
    when "a"
      return 0
    when "b"
      return 1
    when "c"
      return 2
    end
end

# Method returns corresponding value for X or O according to turn
def xo(moves)
  if moves.odd?
    return 1
  else
    return -1
  end
end

# Method that begins the game
def play(board, whose_turn)
  puts "Choose coordenates"
  current_play = gets.chomp
  # put the corresponding coordenate on the board
  board[(current_play.split(//)[0].to_i)-1][alpha(current_play.split(//)[1])] = xo(whose_turn)
  winner = check_for_winner(board)
  return winner
end


def check_for_winner(arr)
  line1 = arr[0][0] + arr[0][1] + arr[0][2]
  line2 = arr[1][0] + arr[1][1] + arr[1][2]
  line3 = arr[2][0] + arr[2][1] + arr[2][2]

  line4 = arr[0][0] + arr[1][0] + arr[2][0]
  line5 = arr[0][1] + arr[1][1] + arr[2][1]
  line6 = arr[0][2] + arr[1][2] + arr[2][2]

  line7 = arr[0][0] + arr[1][1] + arr[2][2]
  line8 = arr[2][0] + arr[1][1] + arr[0][2]
  winners = [line1, line2, line3, line4, line5, line6, line7, line8]
  is_it_a_winner = false
  winners.each {|x|
    if x == 3
      puts "X WINS!"
      is_it_a_winner = true
    elsif x == -3
      puts "O WINS!"
      is_it_a_winner = true
    else
      is_it_a_winner = false
    end
  }
  is_it_a_winner
end

# game method
def tictactoe
  # Define my variables
  board = []
  3.times do board << [0,0,0] end
  winner = false
  whose_turn = 0
  print "\nGreeting goes here!"
  # print "\nWhy hello, you goegeous user!\nWill you be playing with an equally attractive counterpart or should I step in?"
  # ai = gets.chomp.downcase
  # if
  while ((winner == false) && (whose_turn < 9)) == true
    whose_turn +=1
    print `clear`
    print_board(board)
    won = play(board, whose_turn)
    winner = won
  end

  if whose_turn < 9
    print_board(board)
    puts "WE HAVE A WINNER!!"
    puts "Play again? (Y/N)"
    answ = gets.chomp.downcase
    if answ == "y"
      tictactoe
    else
      exit
    end
  else
    puts "DRAW!"
    puts "Play again? (Y/N)"
    answ = gets.chomp.downcase
    if answ == "y"
      tictactoe
    else
      exit
    end
  end
end


# calling the program
print `clear`
tictactoe
