class TwilioController < ApplicationController
  def text_message
    body = params['Body']
    from = params['From']

    if body =~ /^\$([0-9]+)$/
      amount_to_donate = $~[1].to_i
      donation = Donation.create! phone_number: from, amount: amount_to_donate
      message = "To donate $#{amount_to_donate} simply go this link: http://donate.100state.com/donations/#{donation.id}"
    else
      message = "Sorry, didn't understand that. If you'd like to donate just send a message with a dollar amount. Example: $20"
    end

    twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => from,
      :body => message
    )
  end
end
