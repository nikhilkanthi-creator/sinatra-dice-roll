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
  html = <<-HTML
  <h1>Dice Roll</h1>
  <p>Click the links to get started</p>
  <a href="https://refactored-space-spork-7vwprvjrw69rfwr45-4567.app.github.dev/dice/2/6"> Roll two 6-sided dye </a>
  <a href="https://refactored-space-spork-7vwprvjrw69rfwr45-4567.app.github.dev/dice/2/10"> Roll two 10-sided dye </a>
  <a href="https://refactored-space-spork-7vwprvjrw69rfwr45-4567.app.github.dev/dice/5/4"> Roll five 4-sided dye </a>


  HTML

  return html
end

get ("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  first_die = rand(1..20)
  outcome = "You rolled a #{first_die}"
  "<h1>1d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "You rolled #{first_die}, #{second_die}, #{third_die}, #{fourth_die} and #{fifth_die} for a total of #{sum}"
  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
