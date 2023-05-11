def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] +=1
    end
    return (hash.select{|k,v| v == 1}).keys
end 

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []

p "-------------------------------------------------------------"

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele,i|
        return false if ele == arr[i+1]
    end
    true
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

p "-------------------------------------------------------------"

def char_indices(str)
    hash=Hash.new{|h,k| h[k]=[]}
    str.each_char.with_index do |c,i|
        hash[c]<<i
    end
    hash
end

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

p "-------------------------------------------------------------"

def longest_streak(str)
    longest = ""
    i=0
    start=0
    while i < str.length
        start = i
        while str[i] == str[i+1]
            i+=1
        end
        longest = str[start..i] if str[start..i].length >= longest.length
        i+=1
    end
    longest
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

p "-------------------------------------------------------------"

def bi_prime?(num)
    primes = primes_less(num)
    primes.each do |n|
        primes.each do |m|
            return true if n * m == num
        end
    end
    false

end


def primes_less(num)
    primes = []
    (2...num).each do |n|
      is_prime = true
  
      (2...n).each do |factor|
        if n % factor == 0
          is_prime = false
          break
        end
      end
  
      primes << n if is_prime
    end
  
    primes
  end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

p "-------------------------------------------------------------"

def vigenere_cipher(message,key)
    alphabet=("a".."z").to_a
    l = key.length 
    result=""
    message.each_char.with_index do |c,i|
        idx = alphabet.index(c)
        result+=alphabet[(idx+(key[i%l]))%26]
    end
    result
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

p "-------------------------------------------------------------"

def vowel_rotate(str)
    v='aouie'
    vowels_array=[]
    j=0
    str.each_char do |c|
        vowels_array.push(c) if v.include?(c)
    end

    vowels_array.unshift(vowels_array.pop)

    str.each_char.with_index do |c,i|
        if v.include?(c)
            str[i]=vowels_array[j]
            j+=1
        end
    end
    return str
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

p "-------------------------------------------------------------"

#Proc Problems

class String
    def select(&blc)
        new_s=""
        return "" if !blc
        self.each_char.with_index do |c,i|
            new_s+=c if blc.call(c)
        end
        new_s
    end


    def map!(&blc)
        self.each_char.with_index do |c,i|
            self[i] = blc.call(c,i)
        end
        self
    end
    
    

end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

p "-------------------------------------------------------------"

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"