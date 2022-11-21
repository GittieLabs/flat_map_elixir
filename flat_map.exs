defmodule M do
  def flat_map_test do
    list = [1,[2],[3,4], [[5],[6]], [[7, [8, 9, [10]]]]]
    # reduce the list of sublists into a flattened list
    answer = Enum.reduce(list, [], fn x, acc -> acc  ++ flatten_list(x) end)
    IO.inspect answer
  end

  # Returns a flattened list
  # arg: list or single value
  def flatten_list(list) do
    if is_list(list) do # check to see if list is actually a list
      # .any? function checks to see if any of the values in the list are a list themselves
      # returns true if any item in the list is a list
      hasSublist = Enum.any?(list, fn x -> is_list(x) end)
      if hasSublist do # check to see if the list has sublists
        # reduce list that can contain sublists to a single list with a recursive call to flatten_list
        Enum.reduce(list, [], fn x, acc -> acc  ++ flatten_list(x) end)
      else
        # This is the case when we have a list that doesn't contain any sublist
        # we just return the list
        list
      end
    else
      # If we don't have a list as an argument, then we can just return the single value as a list
      [list]
    end
  end
end
M.flat_map_test()
