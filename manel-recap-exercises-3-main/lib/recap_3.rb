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