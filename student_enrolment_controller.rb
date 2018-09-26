require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

#index
get '/student-enrolment' do
  @students = Student.all()
  erb(:index)
end

# new
get '/student-enrolment/new' do
  @houses = House.all()
  erb(:new)
end

#create

post '/student-enrolment/:id/update' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end
