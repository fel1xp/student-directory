@students = [] # an empty array accessible to all methods

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # get the first name
  puts 'Enter the Villain'
  name = STDIN.gets.chomp
  # while the name if not empty, repeat this code
  until name.empty?
    # add the student hash to the array
    @students << { name: name, cohort: :april }
    if @students.length == 1
      puts "Now we have #{@students.count} great student".center(30)
    else
      puts "Overall, we have #{@students.count} great students".center(30)

    end
    # get another name from the user
    puts 'Enter the Villain'
    name = STDIN.gets.chomp
  end
end

def print_header
  puts 'The students of Villains Academy'.center(30)
  puts '-------------'.center(30)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student".center(30)
  else
    puts "Overall, we have #{@students.count} great students".center(30)
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit' # we will add more options
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
  else
    puts 'Unknown input. Please try again.'
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open('students.csv', 'w')
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students(_filename = 'students.csv')
  file = File.open('students.csv', 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
