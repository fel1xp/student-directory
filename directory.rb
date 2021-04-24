def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first name
  puts 'Enter the Villain'
  name = gets.chomp
  # while the name if not empty, repeat this code
  until name.empty?
    # add the student has to the array
    students << { name: name, cohort: :april}
    if students.length == 1
      puts "Now we have #{students.count} great student".center(30)
    else
      puts "Overall, we have #{students.count} great students".center(30)
      # get another name from the user
    end
    puts 'Enter the Villain'
    name = gets.chomp
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

def interactive_menu
  students = []
  loop do
    # 1 print the menu and ask the user what to do
    puts '1. Input the students'
    puts '2. Show the students'
    puts '9. Exit'
    # 2 read the input and save it into a variable
    selection = gets.chomp
    # 3 do what the user has asked
    case selection
    when '1'
      students = input_students
    when '2'
      print_header
      print(students)
      print_footer(students)
    when '9'
      exit # this will terminate the programme
    else
      puts 'Unknown input. Please try again.'
    end
  end
  # method end, dont use
end

interactive_menu