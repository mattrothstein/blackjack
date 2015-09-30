module BlackjackMethods
	def game_title
		sleep(1)                                                        
		puts"..............................................................." 
		sleep(0.15)                                                       
		puts"..............................................................."                                                       
		sleep(0.15)
		puts"..............................................................."
		sleep(0.15)
		puts"....######.######.#####..##...##.######.##..##..####..##......."
		sleep(0.15)
		puts"......##...##.....##..##.###.###...##...###.##.##..##.##......."
		sleep(0.15)
		puts"......##...####...#####..##.#.##...##...##.###.######.##......."
		sleep(0.15)
		puts"......##...##.....##..##.##...##...##...##..##.##..##.##......."
		sleep(0.15)
		puts"......##...######.##..##.##...##.######.##..##.##..##.######..."
		sleep(0.15)
		puts"..............................................................."
		sleep(0.15)
		puts"..............................................................."                                                   
		sleep(0.15)
		puts"..............................................................."     
		sleep(0.15)
		puts"..........................####....##..........................."
		sleep(0.15)
		puts".............................##..###..........................."
		sleep(0.15)
		puts"..........................####....##..........................."
		sleep(0.15)
		puts".........................##.......##..........................."
		sleep(0.15)
		puts".........................######.######........................."
		sleep(0.15)
		puts"..............................................................."                                                      
		sleep(0.15)
		puts"..............................................................."                                                       
		sleep(0.15)
		puts"..............................................................."                                                        
		sleep(0.15)
	end	

	def outro
		sleep(0.15)
		puts"..............................................................." 
		sleep(0.15)
		puts".########.##.....##....###....##....##.##....##..######........"
		sleep(0.15)
		puts"....##....##.....##...##.##...###...##.##...##..##....##......."
		sleep(0.15)
		puts"....##....##.....##..##...##..####..##.##..##...##............."
		sleep(0.15)
		puts"....##....#########.##.....##.##.##.##.#####.....######........"
		sleep(0.15)
		puts"....##....##.....##.#########.##..####.##..##.........##......."
		sleep(0.15)
		puts"....##....##.....##.##.....##.##...###.##...##..##....##......."
		sleep(0.15)
		puts"....##....##.....##.##.....##.##....##.##....##..######........"
		sleep(0.15)
		puts"..............................................................." 
		sleep(0.15)
		puts"..............................................................." 
		sleep(0.15)
		puts"..............................................................." 
		sleep(0.15)
		puts"................########..#######..########...................."
		sleep(0.15)
		puts"................##.......##.....##.##.....##..................."
		sleep(0.15)
		puts"................##.......##.....##.##.....##..................."
		sleep(0.15)
		puts"................######...##.....##.########...................."
		sleep(0.15)
		puts"................##.......##.....##.##...##....................."
		sleep(0.15)
		puts"................##.......##.....##.##....##...................."
		sleep(0.15)
		puts"................##........#######..##.....##..................."
		sleep(0.15)
		puts"..............................................................." 
		sleep(0.15)
		puts"..............................................................." 
		sleep(0.15)
		puts"..............................................................." 
		sleep(0.15)
		puts".########..##..........###....##....##.####.##....##..######..."
		sleep(0.15)
		puts".##.....##.##.........##.##....##..##...##..###...##.##....##.."
		sleep(0.15)
		puts".##.....##.##........##...##....####....##..####..##.##........"
		sleep(0.15)
		puts".########..##.......##.....##....##.....##..##.##.##.##...####."
		sleep(0.15)
		puts".##........##.......#########....##.....##..##..####.##....##.."
		sleep(0.15)
		puts".##........##.......##.....##....##.....##..##...###.##....##.."
		sleep(0.15)
		puts".##........########.##.....##....##....####.##....##..######..."
		sleep(0.15)	
		puts"..............................................................." 
		sleep(0.15)	
	end


	def formatter
		sleep(0.5)
		puts"..............................................................."                                                                                                      
		sleep(0.5)
		puts"..............................................................."                                                       
		sleep(0.5)
		puts"..............................................................."                                                        
		sleep(0.5) 
	end

	def wanna_play # Prompt player
		puts "Would you like to play some BlackJack?"
		formatter
		puts "Please answer yes or no."
		gets.chomp.downcase
	end

	def draw_card #  Draw a card from the deck.
		card = $playing_keys[rand($playing_keys.length)]
		remove_card (card)
		card
	end

	def remove_card(card) #  Remove the card from deck.
		$playing_keys -= [card]
		$playing_deck.delete(card)
	end

	def sum (value) # Calculates Sum of all elements in the Hand Array.
		count = 0
			value.each do 
				|a| count+=a 
			end
		count
	end

	def add_hand (hand, key, value ) #  Adds the total value of a hand. Passed an array.
		value_for_card = []
			hand.each do |x| 
				y = key.index(x); 
				value_for_card.push(value[y])
			end
		sum(value_for_card)
	end

	def my_first_card(my_hand) # Display my first card
		formatter
 		puts "Your first card is a #{my_hand}."
 	end

 	def my_second_card(my_hand)
		formatter
 		puts "Your second card is a #{my_hand}."
 	end	

	def dealer_first_card(dealer) # Display the Dealers first card
		formatter
 		puts "The Dealer's first card is a #{dealer}."
 	end	

 	def your_hand_total(my_hand, key_deck, value_deck)
		formatter
 		puts "You have a total of #{add_hand(my_hand, key_deck, value_deck)}."
 	end	

	def dealer_rule # The Dealer cannot stay with a value of 15 or less.
		formatter
		puts "The dealer cannot STAY with less than or on 15."
		formatter
		puts "The dealer takes a HIT!"	
	end

	def action_regulator #Confirm the user has made a selection
		begin
			formatter
	 		puts "You must take a HIT or STAY before seeing the dealers second card."
	 		action = gets.chomp.downcase
	 	end	until (action == "hit" || action == "stay")
		action	 
	 end	

	def declare_winner (my_counter, dealer_counter) # Declare the Winner of the game.
		formatter
		puts "You have #{my_counter} and the dealer has #{dealer_counter}."
		formatter
			if (dealer_counter == my_counter)
	 			puts "Its a tie!"
	 		elsif (dealer_counter != 21 && my_counter == 21)
	 			puts "You Win!"
	 		elsif (dealer_counter == 21 && my_counter != 21)
	 			puts "Dealer Wins!"
	 		elsif ((dealer_counter < 21) && (dealer_counter > my_counter))
	 			puts "Dealer Wins!"
	 		elsif ((dealer_counter < my_counter) && (my_counter < 21))
	 			puts "You Win!"
	 		elsif (dealer_counter > 21 && my_counter > 21)
	 			puts "You both BUST!"
	 		elsif ((dealer_counter > 21) && (my_counter <= 21))
	 			puts "You Win! Dealer BUST!"
	 		elsif ((my_counter > 21) && (dealer_counter <= 21))
	 			puts "Dealer Wins! You BUST!"
	 		else
	 			puts "I'm Confused..."
	 			puts "I don't know who the winner is." 	
	 		end
	end

end