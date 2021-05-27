
# let's put all students into an array
@students = [
  {name: "Dr. Hannibal Lecter", cohort: :may},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :may},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :may},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :may},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :june},
  {name: "Norman Bates", cohort: :november}
]

# and then print them
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def order(students, by)
  ordered = students.sort_by { |student| student[by.to_sym] }
  print(ordered)
end

def selective(students, by)
  print(
    students.select { |student| student[:name].include?(by)}
  )
end

def print(students)
  number = 1
  students.each do |student|
    puts "#{number}. #{student[:name]} (#{student[:cohort]} cohort, age #{student[:age]})"
    number += 1
  end
end

def operator
  puts "(O)rdered, (U)nordered or (S)elective?"
  choice = gets.chomp
  case choice
  when "O"
    puts "by name, cohort or age?"
    ordered = gets.chomp
      order(@students, ordered)
    when "U"
      print(@students)
    when "S"
      puts "filter by names that begin with which letter?"
      selective = gets.chomp
      selective(@students, selective)

  end


end

# finally, we pritn the total number of students
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   # create an empty array
#   students = []
#   # get the first name
#   name = gets.chomp
#   # while the name is not empty, repeat this code
#   while !name.empty? do
#     # add the student hash to the array
#     puts "age?"
#     age = gets.chomp
#     puts "cohort?"
#     cohort = gets.chomp
#     students << { name: name, cohort: cohort.to_s, age: age }
#     puts "Now we have #{students.count} students"
#     # get another name from the user
#     name = gets.chomp
#   end
#   # return the array of students
#   students
# end


# nothing happens until we call the methods
# students = input_students
# print_header
# order(students, "name")
# print_footer(students)
operator
