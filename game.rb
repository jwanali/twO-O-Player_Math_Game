require_relative 'player'
class Game
  attr_accessor :player1 , :player2, :new_game_started
def initialize
  puts "playe1 please input your name"
  player1_name = gets.chomp
  @player1 = Player.new(player1_name,true)
  puts "playe2 please input your name"
  player2_name = gets.chomp
  @player2 = Player.new(player2_name,false)
  @new_game_started = 1
 
end

def game_over
  (player1.lives == 0) || (player2.lives == 0)
end

def winner
  player1.lives == 0 ? player2 : player1
end

def current_player
  
  player1.his_turn ? player1 : player2
end
def change_player
  if player1.his_turn
    player1.his_turn = false 
    player2.his_turn = true  
  else
    player1.his_turn = true
    player2.his_turn = false
  end
end

def start_game

  while !game_over
    if new_game_started == 1
      self.new_game_started = 0 
     
    else
      puts "----------  NEW TURN  ----------"
      
    end

    number1 = rand(1..20)
    number2 = rand(1..20)
   
   
    puts " #{current_player.name}: What does #{number1} plus #{number2} equal"
    answer = gets.chomp.to_i
    if number1 + number2 == answer
      puts "#{current_player.name}: YES! you are correct."
      change_player
    else
      puts "#{current_player.name}: Seriously? NO!"
      current_player.lives -=1
      change_player
    end
    puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
  end
  puts " #{winner.name} wins with ascore of #{winner.lives}/3"
  puts "---------- GAME OVER ----------"
  puts "Good bye!"
end

end