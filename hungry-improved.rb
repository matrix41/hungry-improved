require 'twilio-ruby'

# put Twilio credentials here
account_sid = 'AC1450a935aad2a88da38727bef47b5cb9'
auth_token  = 'f51667295646de2ef0a7a1b489761be1'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new account_sid, auth_token


puts "Welcome to Restaurant720 "
puts "=-=-=-=-=-=-=-=-=-=-=-=-="

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
   puts "Skip this food course (y/n)?"
   user_skip = gets().chomp()
   return if user_skip.match('y')
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
# a different food hash/food course. 
print_function( appetizers, users_order )
print_function( entrees,    users_order )
print_function( drinks,     users_order )
print_function( desserts,   users_order )

puts " "
puts "-*-*-*-*-*-*-*-*-*-*-*-*-"
puts "-*-*-*-*-*-*-*-*-*-*-*-*-"
# Create an array to hold customer order to be sent via text message 
twilio_output = []
# Print out a summary of customer order 
puts "Here is a summary of your order: "
users_order.each_key do |key|
   puts " * You ordered #{key} with #{ users_order[key] }."
   twilio_output << "You ordered #{key} with #{ users_order[key] }. "
end
puts "-+-+-+-+-+-+-+-+-+-+-+-+-"
puts "-+-+-+-+-+-+-+-+-+-+-+-+-"
puts " "
puts "Come again soon!"
twilio_output << "Come again soon!"

# puts "#{twilio_output}"
# The code below will send the customer order via text messaging. 
# Note to self: must include "1" before the phone number
client.account.messages.create(
  :from => '+18182769431',
  :to => '+18187202477',
  :body => twilio_output
)
