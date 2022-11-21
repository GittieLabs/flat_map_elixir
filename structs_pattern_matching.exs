defmodule Student do
  defstruct [:name, :id]
end

defmodule TestStructs do
  def register_student(list_of_students, starting_index \\ 0) do
    IO.inspect list_of_students #prints list of students
    IO.puts starting_index #prints starting index
    list = Enum.with_index(list_of_students) #get a list of tuples (value, index)
    IO.inspect list #print the list

    #Go through each item in the list and call a function to create a Student struct
    # Each list item is a tuple. We use pattern matching to assign each item a name and index.
    # The anonymous function takes a tuple as it's parameter. Notice that the fn uses "{name, id}" which is a
    # tuple that matches the format of each item in the list
    # The function body creates a Student struct and uses the index plus the starting_index to give
    # incrementing ids to each student based on their index in the list
    Enum.map(list, fn {name, id} -> %Student{name: name, id: id + starting_index} end)
  end

  def run do
    IO.puts "registering students with starting index ..."
    # Test with a list and providing a starting index
    IO.inspect(register_student(["Jack", "Mary", "Bruce"], 1000))
    IO.puts "[------------------------]"
    IO.puts "\n\nregistering students with default index of 0"
    # Test with a list using default index of 0
    IO.inspect(register_student(["Jack", "Mary", "Bruce"]))
    IO.puts "[------------------------]"
  end
end
TestStructs.run()
