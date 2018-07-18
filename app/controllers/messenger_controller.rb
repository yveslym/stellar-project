# YOUR_APP/app/controllers/messenger_controller.rb
class MessengerController < Messenger::MessengerController
  #protect_from_forgery with: :null_session
  protect_from_forgery unless: -> { request.format.json? }
  def webhook

    msg = message
    print(msg)
    case msg

    when 'Mentor'
    send_message("Thank you, You will be register as Mentee")
  when 'Mentee'
    if   mentor.save!
    send_message("Thank you, You will be register as mentor")
    end

    else
    name = profile["first_name"]
    Messenger::Client.send(
      Messenger::Request.new(
        Messenger::Elements::Text.new(text: "hey #{name}, I am a bot"),
        sender_id
      )
    )
    quick_replys
    end



  head :ok
  end

def send_message(text)
  Messenger::Client.send(
    Messenger::Request.new(
      Messenger::Elements::Text.new(text: text),
      sender_id
    )
  )
end
def quick_replys
  print("----------------------quick------------------")
  profile
  #define quick_replies here...
      quick_replies = Messenger::Templates::QuickReplies.new(
        text: "Are you Looking for a Mentor or Mentee?",
        quick_replies: [
            Messenger::Elements::QuickReply.new(
              content_type: 'text',
              title: 'Mentor',
              payload: 'GREEN'
            ),
            Messenger::Elements::QuickReply.new(
                content_type: 'text',
                title: 'Mentee',
                payload: "RED"
            )
        ]
      )

      #now send quick_replies to the user
      Messenger::Client.send(
        Messenger::Request.new(quick_replies, sender_id)
      )
end

  def message
    jsonRequest = request.body.read
    data = JSON.parse(jsonRequest)
    messageEntry = data["entry"][0]["messaging"][0]["message"]["text"]
    print(messageEntry)
    return messageEntry
  end
  def sender_id
    jsonRequest = request.body.read
    data = JSON.parse(jsonRequest)
    id = data["entry"][0]["messaging"][0]["sender"]["id"]
    return id
  end
  def profile
  prof =  Messenger::Client.get_user_profile(sender_id)
  return prof
  end

  def mentor
    prof = profile
      @mentor = Mentee.new(first_name: prof["first_name"], last_name: prof["last_name"],
      facebook_id: sender_id, gender: prof["gender"], locale: ["locale"])
      @mentor
  end
end
