class Player
 def get_move
    puts "enter a position with coordinates separated with a space like '4 7'"
    coordinates = gets.chomp.split(" ").map(&:to_i)
    coordinates
 end
end