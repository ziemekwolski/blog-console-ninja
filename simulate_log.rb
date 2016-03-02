puts "Application will create and overwrite sample.log."
puts " Ready to continue (Y/n)"
exit if gets.chomp != "Y"

puts "Run the following command in tab"
message = "tail -f #{Dir.pwd}/sample.log"
puts "-" * message.size
puts message
puts "Ctrl + c to stop the application"
puts "-" * message.size

sample_logs = []

sample_logs << <<-log

Started GET "/clubs" for 127.0.0.1 at 2016-02-25 22:27:58 -0500
Processing by ClubsController#index as HTML
Redirected to http://localhost:3000/login
Filter chain halted as :require_login rendered or redirected
Completed 302 Found in 2ms (ActiveRecord: 0.0ms)
log

sample_logs << <<-log

Started GET "/login" for 127.0.0.1 at 2016-02-25 22:27:58 -0500
Processing by SessionsController#new as HTML
  Rendered sessions/new.html.haml within layouts/application (20.1ms)
  Rendered layouts/_alerts.html.haml (3.5ms)
Completed 200 OK in 44ms (Views: 42.8ms | ActiveRecord: 0.0ms)
log

sample_logs << <<-log

Started GET "/signup" for 127.0.0.1 at 2016-02-25 22:28:02 -0500
Processing by UsersController#new as HTML
  Rendered layouts/_form_errors.html.haml (5.9ms)
  Rendered users/_form.html.haml (13.7ms)
  Rendered users/new.html.haml within layouts/application (26.7ms)
  Rendered layouts/_alerts.html.haml (0.2ms)
Completed 200 OK in 90ms (Views: 40.6ms | ActiveRecord: 22.8ms)
log

sample_logs << <<-log

Started POST "/signup" for 127.0.0.1 at 2016-02-25 22:28:10 -0500
Processing by UsersController#create as HTML
  Parameters: {"authenticity_token"=>"nqkAcbQurtvC5eGaYbTsntvuv+UwV/WOlptJceSbgQU=", "user"=>{"name"=>"", "email"=>"", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Signup"}
   (6.0ms)  BEGIN
  User Exists (30.0ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = '' LIMIT 1
   (0.4ms)  ROLLBACK
  Rendered layouts/_form_errors.html.haml (4.1ms)
  Rendered users/_form.html.haml (5.1ms)
  Rendered users/new.html.haml within layouts/application (12.1ms)
  Rendered layouts/_alerts.html.haml (0.2ms)
Completed 200 OK in 80ms (Views: 24.2ms | ActiveRecord: 36.4ms)
log

sample_logs << <<-log

Started POST "/signup" for 127.0.0.1 at 2016-02-25 22:28:10 -0500
Processing by UsersController#create as HTML
  Parameters: {"authenticity_token"=>"nqkAcbQurtvC5eGaYbTsntvuv+UwV/WOlptJceSbgQU=", "user"=>{"name"=>"Bob", "email"=>"Bob@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Signup"}
   (6.0ms)  BEGIN
  User Exists (30.0ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = '' LIMIT 1
   (0.4ms)  ROLLBACK
  Rendered layouts/_form_errors.html.haml (4.1ms)
  Rendered users/_form.html.haml (5.1ms)
  Rendered users/new.html.haml within layouts/application (12.1ms)
  Rendered layouts/_alerts.html.haml (0.2ms)
Completed 200 OK in 80ms (Views: 24.2ms | ActiveRecord: 36.4ms)
log


while true
  File.delete('sample.log') if File.exist?('sample.log')
  10000.times do
    sleep(0.2)
    open('sample.log', 'a') do |f|
      f.puts sample_logs.sample(1)
    end
  end
end
