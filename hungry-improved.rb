puts "Welcome to Restaurant720"
puts "=-=-=-=-=-="

# Initialize the three food arrays for appetizers, entrees, and desserts
appetizers = [ "nachos", "mozerrella sticks", "chips and salsa", "SKIP"]
entrees = [ "hamburger", "chicken strips", "fried chicken", "SKIP"]
#entrees_note = { 'entrees' => 'notes' }
desserts = [ "chocolate cake", "apple pie", "SKIP"]
drinks = [ "coke", "sprite", "lemonade", "diet coke", "water", "SKIP"]
note = { 'appetizers' => 'note', 'entrees' => 'note', 'desserts' => 'note', 'drinks' => 'note'}

# Initialize an empty array to hold the user-selected menu items 
users_order = []

# This function will take in an array argument.  It will return 
# another array containing the selected menu items 
def print_function( array, note, users_order )
   puts ""
   array.each_with_index do |item,index|
      puts "#{index}: #{item}"
   end
   puts "Make your food selection here --> "
   selection = gets().chomp().to_i()
   puts "Mention any special notes to go with your order --> "
   note[array] = "no pickles"
#   entrees_note['entrees'] = "no pickles"
   puts "You entered --> #{array[selection]}"
   users_order << "#{array[selection]}"
end

# Start the main body of the program here.  
# Make three function calls. Each time use 
# a different food array. 
print_function( appetizers, note, users_order )
print_function( entrees,    note, users_order )
print_function( drinks,     note, users_order )
print_function( desserts,   note, users_order )
puts "=-=-=-=-=-="

# Print out a summary of user-selected order 
puts "Here is a summary of your order: "
users_order.each_with_index do |item, index|
   puts " * #{ users_order[index] }"
end

note.each_key { |food_notes| 
   puts "#{food_notes} is #{note[food_notes]}."
}


puts "Come again soon!"
