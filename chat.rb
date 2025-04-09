# Write your solution here!
pp "howdy, hello, Marta"
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

pp client
