# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
def coprime?(num1, num2)
    prim1 = (2..num1).select { |ele1| num1 % ele1 == 0}
    prim2 = (2..num2).select { |ele2| num2 % ele2 == 0}
    prim1.each do |ele3| 
        if prim2.include?(ele3)
            return false
        end 
    end
    true
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
