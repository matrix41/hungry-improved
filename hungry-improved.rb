puts "Welcome to Restaurant720"
puts "=-=-=-=-=-="

# Initialize the three food arrays for appetizers, entrees, and desserts
appetizers = [ "nachos", "mozerrella sticks", "chips and salsa", "SKIP"]
entrees = [ "hamburger", "chicken strips", "fried chicken", "SKIP"]
desserts = [ "chocolate cake", "apple pie", "SKIP"]
drinks = [ "coke", "sprite", "lemonade", "diet coke", "water", "SKIP"]

# Initialize an empty array to hold the user-selected menu items 
users_order = []

# This function will take in an array argument.  It will return 
# another array containing the selected menu items 
def print_function( array, users_order )
   puts ""
   array.each_with_index do |item,index|
      puts "#{index}: #{item}"
   end
   puts "Make your food selection here --> "
   selection = gets().chomp().to_i()
   puts "You entered --> #{array[selection]}"
   users_order << "#{array[selection]}"
end

# Start the main body of the program here.  
# Make three function calls. Each time use 
# a different food array. 
print_function( appetizers, users_order )
print_function( entrees,    users_order )
print_function( drinks,    users_order )
print_function( desserts,   users_order )
puts "=-=-=-=-=-="

# Print out a summary of user-selected order 
puts "Here is a summary of your order: "
users_order.each_with_index do |item, index|
   puts " * #{ users_order[index] }"
end
puts "Come again soon!"
