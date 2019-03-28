require 'mechanize'
module ApiCall
  #TODO Fill in the code for the PUt, POST, and DELETE
  #TODO use a switch statement or the send method to improve this code
  def call_service url, call_type, body
    agent = Mechanize.new
    agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    case call_type
    when 'GET'
      agent.get(url)
    when 'PUT'
      agent.put(url)
    when 'POST'
      agent.post(url)
    when 'DELETE'
      agent.delete(url)
    else
      "Not valid call type"
    end
  end
end
