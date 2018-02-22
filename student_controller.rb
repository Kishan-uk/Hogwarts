require('sinatra')
require('sinatra/contrib/all')
require_relative ('./models/student_details.rb')
require('pry-byebug')

get '/student-details' do
  @records = StudentDetails.all()
  erb(:index)
end

get '/student-details/:id' do
  @record = StudentDetails.find(params[:id].to_i)
  erb(:show)
end
