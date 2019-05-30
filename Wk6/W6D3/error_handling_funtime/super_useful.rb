# PHASE 2
def convert_to_int(str)
  begin
  raise ArgumentError if !str.is_a?(Integer)
  Integer(str)
  rescue ArgumentError => a
    puts "You must enter an Integer"
  # retry
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
  # rescue StandardError => a
  # puts "I wanted a fruit"

end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin 
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue StandardError => a
  puts "I wanted a fruit, please try again:"
  retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)

    
    raise FriendError.new "Insufficient number of years! (y'all ain't homies)" if yrs_known < 5
    raise FriendError.new "Please input name" if name.length < 1
    raise FriendError.new "Please input an activity" if fav_pastime.length  < 1
    

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class FriendError < StandardError
end


