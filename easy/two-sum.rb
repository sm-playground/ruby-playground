def two_sum(nums, target)
    nums.each_with_index do |num, ind|
        (ind + 1...nums.length).each do |inner_ind|
            if nums[ind] + nums[inner_ind] == target
                return [ind, inner_ind]
            end
        end
    end

    return nil
end

def two_sum_optimized(nums, target)
  complements = {}
  nums.each_with_index do |num, ind|
    complement = target - num
    if !complements[complement].nil?
      return[complements[complement], ind]
    else
      complements[num] = ind
    end
  end
  nil
end

[
  {
    input: { arr: [2,7,11,15], target: 9 },
    expected: [0,1]
  },
  {
    input: { arr: [3,2,4], target: 6 },
    expected: [1,2]
  },
  {
    input: { arr: [3, 3], target: 6 },
    expected: [0,1]
  }
].each do |test_info|
  actual = two_sum(test_info[:input][:arr], test_info[:input][:target])
  if test_info[:expected].sort != actual.sort
    raise ('ERROR')
  end
  actual = two_sum_optimized(test_info[:input][:arr], test_info[:input][:target])
  if test_info[:expected].sort != actual.sort
    raise ('ERROR')
  end
end

puts "DONE"
