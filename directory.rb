
# let's put all students into an array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

# and then print them
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  number = 1
  students.each do |student|
    puts "#{number}. #{student[:name]} (#{student[:cohort]} cohort, age #{student[:age]})"
    number += 1
  end
end

# finally, we pritn the total number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
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
    students << { name: name, cohort: :november, age: age }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
