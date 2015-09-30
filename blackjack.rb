require './BlackjackMethods.rb'
include BlackjackMethods



#################################### VARIABLES & CONSTANTS ##################################

$NEW_DECK = {

"2 of Hearts" => 2, "2 of Clubs" => 2, "2 of Diamonds" => 2, "2 of Spades" => 2,

"3 of Hearts" => 3, "3 of Clubs" => 3, "3 of Diamonds" => 3, "3 of Spades" => 3,

"4 of Hearts" => 4, "4 of Clubs" => 4, "4 of Diamonds" => 4, "4 of Spades" => 4,

"5 of Hearts" => 5, "5 of Clubs" => 5, "5 of Diamonds" => 5, "5 of Spades" => 5,

"6 of Hearts" => 6, "6 of Clubs" => 6, "6 of Diamonds" => 6, "6 of Spades" => 6,

"7 of Hearts" => 7, "7 of Clubs" => 7, "7 of Diamonds" => 7, "7 of Spades" => 7,

"8 of Hearts" => 8, "8 of Clubs" => 8, "8 of Diamonds" => 8, "8 of Spades" => 8,

"9 of Hearts" => 9, "9 of Clubs" => 9, "9 of Diamonds" => 9, "9 of Spades" => 9,

"10 of Hearts" => 10, "10 of Clubs" => 10, "10 of Diamonds" => 10, "10 of Spades" => 10,

"Jack of Hearts" => 10, "Jack of Clubs" => 10, "Jack of Diamonds" => 10, "Jack of Spades" => 10,

"Queen of Hearts" => 10, "Queen of Clubs" => 10, "Queen of Diamonds" => 10, "Queen of Spades" => 10,

"King of Hearts" => 10, "King of Clubs" => 10, "King of Diamonds" => 10, "King of Spades" => 10,

"Ace of Hearts" => 11, "Ace of Clubs" => 11, "Ace of Diamonds" => 11, "Ace of Spades" => 11,

}
$playing_deck = $NEW_DECK;
$playing_keys = $playing_deck.keys
key_deck = $NEW_DECK.keys
value_deck = $NEW_DECK.values
dealer = [] #  Dealer's cards.
my_hand = [] #  Player's cards.
my_counter = 0 #  Sum of Player's hand.
dealer_counter = 0 #  Sum of Dealer's hand.




######################################## THE GAME #######################################
game_title
answer = wanna_play
until (answer == "yes" || answer == "no")
	formatter
	puts "That isn't a valid response"
	answer = wanna_play
end

if (answer == "yes")
 	my_hand.push(draw_card)
 	my_first_card(my_hand[0])
 	dealer.push(draw_card)
 	dealer_first_card(dealer[0])
 	my_hand.push(draw_card)
 	my_second_card(my_hand[1])
 	dealer.push(draw_card)
 	your_hand_total(my_hand, key_deck, value_deck)
 	my_counter = add_hand(my_hand, key_deck, value_deck)
 	dealer_counter = add_hand(dealer, key_deck, value_deck)
 	
 	if (my_counter <=21)
	 	action = action_regulator
 		if (action == "hit")
 			
 			until (answer == "stay" || my_counter >= 21)
 				formatter
 				puts "You take a HIT!"
				formatter
 				my_hand.push(draw_card)
 				puts "You drew a #{my_hand.last}"
 				formatter
 				puts "You have a total of #{add_hand(my_hand, key_deck, value_deck)}."
 				my_counter = add_hand(my_hand, key_deck, value_deck)
 					if (my_counter > 21)
						formatter
						puts "BUST!"
	 				elsif (my_counter == 21)
	 					formatter
 						puts "You got 21!"
 					else
 						formatter
 						puts "HIT or STAY?"
 						answer = gets.chomp.downcase
 					end
 			end
 			formatter
 			puts "The dealer's second card is #{dealer[1]}."
 			formatter
			puts "The dealer has a total of #{add_hand(dealer, key_deck, value_deck)}."

 			until (dealer_counter > 15)
				dealer_rule
				dealer.push(draw_card)
				formatter
				puts "dealer drew a #{dealer.last}"
				formatter	
				dealer_counter = add_hand(dealer, key_deck, value_deck)
				puts "The dealer has a total of #{add_hand(dealer, key_deck, value_deck)}."
			end
 		elsif (action == "stay")
 			formatter
 			puts "The dealer's second card is #{dealer[1]}."
			formatter
			puts "The dealer has a total of #{add_hand(dealer, key_deck, value_deck)}."
			
						
 			until (dealer_counter > 15)
				dealer_rule
				dealer.push(draw_card)
				formatter
				puts "dealer drew a #{dealer.last}"
				formatter
				dealer_counter = add_hand(dealer, key_deck, value_deck)
				puts "The dealer has a total of #{add_hand(dealer, key_deck, value_deck)}."
			end	
 		end
 		declare_winner(my_counter, dealer_counter) 
 		formatter
 		outro
 		formatter
 	end	
else (answer == "no")
	formatter	
	puts "Good! I was gonna beat you anyways!"
	puts "GAME OVER!"
	formatter
end


