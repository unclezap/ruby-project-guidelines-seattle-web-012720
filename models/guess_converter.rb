class GuessConverter
    def self.run(board, guess)
        if guess == "exit"
            begin
                abort "Too hard, huh?"
            end
        end
        guess_array = guess.downcase.split('')
        if guess_array.length == 3
            i = 0
            card_array = []
            3.times do
                if guess_array[i] == "q"
                    card_array << board[0]
                elsif guess_array[i] == "w"
                    card_array << board[1]
                elsif guess_array[i] == "e"
                    card_array << board[2]
                elsif guess_array[i] == "r"
                    card_array << board[3]
                elsif guess_array[i] == "a"
                    card_array << board[4]
                elsif guess_array[i] == "s"
                    card_array << board[5]
                elsif guess_array[i] == "d"
                    card_array << board[6]
                elsif guess_array[i] == "f"
                    card_array << board[7]
                elsif guess_array[i] == "z"
                    card_array << board[8]
                elsif guess_array[i] == "x"
                    card_array << board[9]
                elsif guess_array[i] == "c"
                    card_array << board[10]
                elsif guess_array[i] == "v"
                    card_array << board[11]
                elsif guess_array[i] == "u"
                    card_array << board[12]
                elsif guess_array[i] == "i"
                    card_array << board[13]
                elsif guess_array[i] == "o"
                    card_array << board[14]
                elsif guess_array[i] == "p"
                    card_array << board[15]
                else
                    dummy_card = Card.all.first
                    return [dummy_card, dummy_card, dummy_card]
                end
                i += 1
            end
            # binding.pry
            return card_array
        end
        dummy_card = Card.all.first
        return [dummy_card, dummy_card, dummy_card]
    end
end