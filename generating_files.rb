require "Date"
NUMBER_OF_FILES = 200

date = Date.today - NUMBER_OF_FILES
current_date = Date.today

NUMBER_OF_FILES.times do |i|
  date += 1
  File.open("log-file-#{date}.log", "w") {}
end
