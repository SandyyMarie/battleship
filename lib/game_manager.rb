
class GameManager
   
    def initialize

def welcome_message
    p "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."
    input = gets.chomp
    if input == "p"
        return "p"
    elsif input == "q"
        puts "Now exiting game"
        return "q"
    else
        puts "Invalid entry, please use p or q"
        input = gets.chomp
end
end 


