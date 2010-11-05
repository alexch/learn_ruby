require 'rubygems'
require 'sinatra'
require 'orange_tree'
$orange_tree = OrangeTree.new(0,6)

get '/' do
  "<a href='/orange_tree'>Check on orange tree</a>" 
end

get '/orange_tree' do
  if @params[:one_year_passes] == 'true'
    $orange_tree.one_year_passes
  end
  
  if @params[:eat_orange]
    $orange_tree.eat_orange(@params[:eat_orange].to_i)
  end
  age = $orange_tree.age
  height = $orange_tree.height
  num_oranges = $orange_tree.num_oranges
  oranges_eaten = $orange_tree.oranges_eaten
  view_output = "<p><b>Your orange tree stats: </b></p>" +
  "<p>Age is #{age}</p>" +
  "<p>Height is #{height}</p>" +
  "<p>Number of Oranges is #{num_oranges}</p>" +
  "<p>Oranges Eaten is #{oranges_eaten}</p>" +
  "<p><a href='/save?age=#{age}&height=#{height}&num_oranges=#{num_oranges}&oranges_eaten=#{oranges_eaten}'>Save this information in a text file</a></p>"
end

get '/save' do
  age = @params[:age]
  height = @params[:height]
  num_oranges = @params[:num_oranges]
  oranges_eaten = @params[:oranges_eaten]
  
  print_stats = "My orange tree is #{age} years old, #{height} feet tall and has #{num_oranges} oranges.  I've eaten #{oranges_eaten} from the tree."
  
  f = File.open('orange_tree.txt', 'w') do |f|
    f.write print_stats
  end
  
  "The following was printed to orange_tree.txt: '#{print_stats}'"
end