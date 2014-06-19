puts "Welcome to Restaurant720"
puts "=-=-=-=-=-="

# Initialize the four food hashes for appetizers, entrees, desserts, and drinks 
appetizers = { "nachos" => 'note', 
               "mozzerella sticks" => 'note', 
               "chips and salsa" => 'note' } 

entrees = { "hamburger" => 'note', 
            "chicken strips" => 'note', 
            "fried chicken" => 'note' }

desserts = { "chocolate cake" => 'note', 
             "apple pie" => 'note' }

drinks = { "coke" => 'note', 
           "sprite" => 'note', 
           "lemonade" => 'note', 
           "diet coke" => 'note' }


# Initialize an empty hash to hold the customer-selected menu items 
users_order = Hash.new

# This function will take in a hash argument.  It will return 
# another hash containing the customer order. 
def print_function( hash, users_order )
   puts ""
# Step 1 of 4: Display food menu by looping through the entire hash
   hash.each_key do |key|
      puts "#{key}" 
#      puts "#{key} #{hash[key]}" # THIS WORKS!!
   end
# Step 2 of 4: Prompt and record customer food selection 
   puts "Make your food selection here --> "
   selection = gets().chomp()
# Step 3 of 4: Prompt and record customer food notes 
   puts "Mention any special notes to go with your order --> "
   customer_note = gets().chomp()
   hash[selection] = customer_note
# Step 4 of 4: Shove customer food selection and customer food notes into hash 
   users_order[selection] = "#{hash[selection]}"
end

# Start the main body of the program here.  
# Make four function calls. Each time use 
# a different food array. 
print_function( appetizers, users_order )
print_function( entrees,    users_order )
print_function( drinks,     users_order )
print_function( desserts,   users_order )
puts "=-=-=-=-=-="

# Print out a summary of user-selected order 
puts "Here is a summary of your order: "
users_order.each_key do |key|
   puts " * You ordered #{key} with #{ users_order[key] }."
end

# http://pleac.sourceforge.net/pleac_ruby/hashes.html
# http://www.slideshare.net/nirusuma/ruby-arrays-hashes-examples-16776638
# http://www.tutorialspoint.com/ruby/ruby_hashes.htm

puts " "

puts "-*-*-*-*-*-*-*-*-*-*-*-*-"
# note.each { |k,v| puts "#{k} => #{v}"}
puts "-*-*-*-*-*-*-*-*-*-*-*-*-"

puts " "

puts "-+-+-+-+-+-+-+-+-+-+-+-+-"
# p note
puts "-+-+-+-+-+-+-+-+-+-+-+-+-"
puts "Come again soon!"
