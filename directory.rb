
# let's put all students into an array
# @students = [
#   {name: "Dr. Hannibal Lecter", cohort: :may},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :may},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :may},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :may},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :june},
#   {name: "Norman Bates", cohort: :november}
# ]

# Print header text
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

# Sort function and send to print
def order(students, by)
  ordered = students.sort_by { |student| student[by.to_sym] }
  print(ordered)
end

# Filter function and send to print
def selective(students, by)
  print(
    students.select { |student| student[:name].include?(by)}
  )
end

# Print function
def print(students)
  number = 1
  if students.count > 0
    students.each do |student|
      puts "#{number}. #{student[:name]} (#{student[:cohort]} cohort, age #{student[:age]})"
      number += 1
    end
    # print_footer(students)
  else
    puts "There are no students"
  end
end

# Operator method handles operation logic - choose whether to return
# student list native, sorted or filtered
# def operator
#   puts "(O)rdered, (U)nordered or (S)elective?"
#   choice = gets.chomp
#   case choice
#   when "O"
#     puts "by name, cohort or age?"
#     ordered = gets.chomp
#     order(@students, ordered)
#   when "U"
#     print(@students)
#   when "S"
#     puts "filter by names that begin with which letter?"
#     selective = gets.chomp
#     selective(@students, selective)
#
#   end
# end

# finally, we pritn the total number of students
def print_footer(names)
  case
  when names.count == 1
    puts "We have 1 great student"
  else
  puts "Overall we have #{names.count} great students"
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print menu and ask for input
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save to variable
    selection = gets.chomp
    # 3. do what user asks
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      break
    else
      puts "please enter a valid input"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "age?"
    age = gets.chomp
    puts "cohort?"
    cohort = gets.chomp
    students << { name: name, cohort: cohort.to_s, age: age }
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


# nothing happens until we call the methods

# print_header
# order(students, "name")
#
interactive_menu
