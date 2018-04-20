require "sinatra"
require "./person"

people = {
  "minhal" => Person.new("minhal", 1000, "male"),
  "md" => Person.new("md", 9001, "unknown"),
  "rashid" => Person.new("rashid", 90, "unknown")
}

# routes below

get "/" do
  "Hello my name is #{name}"
end

get "/home" do
  "Hello World"
end

get "/people/:name" do
  puts params[:name]

  person = generate_person(params[:name], 18, "female")

  "<p>My name is #{ person.name }, my age #{ person.age }, my gender is #{ person.gender }</p>"
end

get "/users/new" do
  "
    <form method='post' action='/users'>
      <input type='text' name='name' placeholder='Name' />
      <input type='text' name='age' placeholder='Age' />
      <input type='text' name='gender' placeholder='Gender' />
      <input type='submit' value='Go' />
    </form>
  "
end

post "/users" do
  # create a new person here
  # psuedocode

  redirect "/users/#{ params[:name] }"
  # redirect "/users/#{}"
end

get "/users/:name" do
  # this looks whtin the people hash for the
  #   key that is represented by params[:name]
  #   e.g. minhal, rashid, md
  person = people[params[:name]]

  "<p>My name is #{ person.name }, my age #{ person.age }, my gender is #{ person.gender }</p>"
end