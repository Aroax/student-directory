
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
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the student.csv list"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "please enter a valid input"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "age?"
    age = gets.chomp
    puts "cohort?"
    cohort = STDIN.gets.chomp
    @students << { name: name, cohort: cohort.to_s, age: age }
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name = STDIN.gets.chomp
  end
  # return the array of students
  # students
end

def show_students
  print_header
  print_student_list(@students)
  print_footer(@students)
end

# Print header text
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

# Sort function and send to print
def order(students, by)
  ordered = students.sort_by { |student| student[by.to_sym] }
  print_student_list(ordered)
end

# Filter function and send to print
def selective(students, by)
  print_student_list(
    students.select { |student| student[:name].include?(by)}
  )
end

# Print function
def print_student_list(students)
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

# Export student list to CSV file
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# Load student list from CSV file
# Will take default students.csv but can be passed a file from ARGV command line
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Loaded file"
end

def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil? # get out of the method if no filename given
  if File.exists?(filename) # if it exists, load file
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else # if it doesn't exist, exit
    puts "Sorry, #{filename} not found"
    exit
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

try_load_students
interactive_menu
