print 'Enter date (day month year): '
day, month, year = gets.chomp.split.map(&:to_i) # need validation input. like day = 65 or month = -23 is incorrect
days_count_of_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days_count_of_month[1] = 29 if (year % 4).zero? && (year % 100).zero? && (year % 400).zero?

i = 0
serial_number = 0
while i < month - 1
  serial_number += days_count_of_month[i]
  i += 1
end
serial_number += day
puts "serial number of the date is #{serial_number}"
