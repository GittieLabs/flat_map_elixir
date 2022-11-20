defmodule M do
  def flat_map_test do
    list = [1,[2],[3,4], [5,[6]], [[7, [8, 9, [10]]]]]
    answer = Enum.reduce(list, [], fn x, acc -> acc  ++ flatten_list(x) end)
    IO.inspect answer
  end

  def flatten_list(list) do
    # IO.puts "begin list"
    # IO.inspect list
    # IO.puts "-----"
    if is_list(list) do
      hasSublist = Enum.any?(list, fn x -> is_list(x) end)
      if hasSublist do
        IO.puts "contains sublist"
        IO.inspect list
        IO.puts "-----"
        nonListVars = []
        nonListVars = Enum.filter(list, fn x -> !is_list(x) end)
        subLists = Enum.filter(list, fn x -> is_list(x) end)
        if length(subLists) > 0 do
          s = flatten_list(Enum.at(subLists, 0))
          IO.puts "sub list"
          IO.inspect s
          IO.puts "temp list"
          IO.inspect nonListVars
          IO.puts "combined list"
          nonListVars = nonListVars ++ s
          IO.inspect nonListVars
          IO.puts "-----"
          nonListVars
        else
          IO.puts "sub list"
          IO.inspect subLists
          IO.puts "-----"
          nonListVars
        end
      else
        IO.puts "end list"
        IO.inspect list
        IO.puts "-----"
        list
      end
    else
      IO.puts "end list: single value"
      IO.inspect [list]
      IO.puts "-----"
      [list]
    end
  end
end
M.flat_map_test()
