# Write your solution here!
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))


# Prepare an Array of previous messages
message_list = [
    {
      "role" => "system",
      "content" => "You are a helpful assistant"
    }
  ]
user_question=""
while user_question!="bye"
    pp "Hello! How can I help you today?"
    pp "-"*50
  user_question=gets.chomp
  if user_question != "bye"
    message_list.push({ "role" => "user", "content" => user_question })

    # Send the message list to the API
    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
      }
    )

    pp nice_reply=api_response.fetch("choices").at(0).fetch("message").fetch("content").chomp
    pp "-" * 50

    # Add the assistant's response to the message list
    message_list.push({ "role" => "assistant", "content" => nice_reply })
  end
end

#HOW I DID UNTIL STEP 2. It woked the same. Understood that step3 was creating a "conversation" value, with all chat history.
#require "openai"
#require "dotenv/load"
#client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))
# Prepare an Array of previous messages
#message_list = [
#    {
#      "role" => "system",
#      "content" => "Hello! How can I help you today?"
#    }
#  ]
#user_question=""
#while user_question!="bye"
#    pp message_list.at(0).fetch("content") 
#    pp "-"*50
#  user_question=gets.chomp
#  
#  message_list.push(
#    {
#      "role" => "user",
#      "content" => user_question
#    }
#  )
# Call the API to get the next message from GPT
#  api_response = client.chat(
#    parameters: {
#      model: "gpt-3.5-turbo",
#      messages: message_list
#    }
#  )
#  pp api_response.fetch("choices").at(0).fetch("message").fetch("content").chomp
#  pp "-"*50

#next_message=api_response.fetch("choices").at(0).fetch("message")
#pp conversation=message_list.push(next_message)
