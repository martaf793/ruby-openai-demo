# Write your solution here!
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

user_question=gets.comp

# Prepare an Array of previous messages
message_list = [
  {
    "role" => "system",
    "content" => "Hello! How can I help you today?"
  },
  {
    "role" => "user",
    "content" => user_question
  }
]
message_list.push(
  {:role=> "user", :content =>"What about NYC?"}
)
# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

#pp api_response
next_message=api_response.fetch("choices").at(0).fetch("message")
#pp next_message

message_list.push(next_message)
pp message_list
