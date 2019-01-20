    # This method takes 10 digits as a phone number and 
    #generates words based on the conditions.

    def print_words_based_on_phone_no(ph_no)
        if (ph_no.is_a?(Integer) && (ph_no.to_s.split("").include?("1") || ph_no.to_s.split("").include?("0")))
            puts "Phone number should be Number and should not include 0 and 1 digits"
        else
            initializeDigits = { 
                                "2" => ["a","b","c"],
                                "3" => ["d","e","f"],
                                "4" => ["g","h","i"],
                                "5" => ["j","k","l"],
                                "6" => ["m","n","o"],
                                "7" => ["p","q","r", "s"],
                                "8" => ["t","u","v"],
                                "9" => ["w","x","y", "z"]
                            }
            file_read = File.read("dictionary.txt")
            hash_file = file_read.split(" ").group_by {|k| k[0,1].downcase}
            ph_no_array = ph_no.to_s.split("")
            result = []
            default_val = 3
            ph_no_array.each_with_index do |x,i|
                if default_val < 8
                    one = hash_file[initializeDigits[ph_no_array[i...default_val].first].first].detect{ |e| e.length == default_val }
                    if (default_val > 5)
                        two = hash_file[initializeDigits[ph_no_array[i..9].first].last].detect{ |e| e.length == 9 - (default_val - 1) } 
                    else
                        two = hash_file[initializeDigits[ph_no_array[i+1..9].first].first].detect{ |e| e.length == 9 - (default_val - 1) } 
                    end
                    result << [one, two]
                    default_val+=1
                    result << hash_file[initializeDigits[ph_no_array.first].first].detect{ |e| e.length == 10 } if(default_val == 8)
               end
            end
            puts result.to_s          
        end
    end


ARGV[0] = ARGV[0].to_i
print_words_based_on_phone_no(ARGV[0])
