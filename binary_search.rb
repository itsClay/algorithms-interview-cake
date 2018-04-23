def binary_search(target, arr)
  floor_idx = -1
  ceil_idx = arr.length
  guess_idx = arr.length / 2

  while floor_idx + 1 < ceil_idx
    size = ceil_idx - floor_idx
    halfway = size / 2

    guess_idx = floor_idx + halfway # set to halfway of the new size
    guess_val = arr[guess_idx]

    return guess_idx if guess_val == target
    if guess_val > target
      # shrink down our ceiling if guess val is too high
      ceil_idx = guess_idx 
    else
      floor_idx = guess_idx
    end
  end

  false
end

p binary_search(7, [1,2,3,4,5,6,7,8,9,0]) == 6
p binary_search(-1, [1,2,3,4,5,6,7,8,9,0]) == false
p binary_search(10, [1,2,3,4,5,6,7,8,9,0]) == false
