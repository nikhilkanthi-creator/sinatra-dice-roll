# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do
  erb(:elephant)
end

get ("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"
  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  erb(:two_ten)
end

get("/dice/1/20") do
  @first_die = rand(1..20)
  @outcome = "You rolled a #{@first_die}"
  erb(:one_twenty)
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die

  @outcome = "You rolled #{first_die}, #{second_die}, #{third_die}, #{fourth_die} and #{fifth_die} for a total of #{sum}"
  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = [] # create a blank array
  100.times do
    dice = rand(1..6) # generate a random number
    @rolls.push(dice) # fill up the array
  end
  erb(:one_hundred_six)
end

