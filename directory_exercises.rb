def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first name
  puts "Enter the Villain"
  name = gets.chomp
  puts "Enter the cohort"
  month = gets.chomp
  # while the name if not empty, repeat this code
  until name.empty?
    # add the student has to the array
    students << { name: name, cohort: month, hobbies: :model_railways, favourite_pet: :dogs }
    if students.length == 1
      puts "Now we have #{students.count} great student".center(30)
    else 
      puts "Overall, we have #{students.count} great students".center(30)
    # get another name from the user
    end 
    puts "Enter the Villain"
    name = gets.chomp
    puts "Enter the cohort"
    month = gets.chomp
  end
  # return array of students
  students
end

def print_header
  puts 'The students of Villains Academy'.center(30)
  puts '-------------'.center(30)
end

def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.count} great student".center(30)
  else 
    puts "Overall, we have #{students.count} great students".center(30)
  end 
end

# now we call the methods instead
students = input_students
print_header
# exercise 1 - print each student like "1. Student Name"
num = 1
students.each do |student|
  puts "#{num}. #{student[:name]}".center(30)
  num += 1
end
print_footer(students)

# print student beginning with a specific letter.
puts 'Print villains beginning with which letter? '
user_input = gets.chomp
students.each do |student|
  puts student[:name].center(30) if (student[:name])[0] == user_input
end

# print students with a length less than 12 characters
puts 'print character with less than 12 characters'
students.each do |student|
  puts student[:name].center(30) if student[:name].length < 12
end
