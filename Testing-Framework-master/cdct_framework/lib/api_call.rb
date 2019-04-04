require 'mechanize'

module ApiCall
  #TODO Fill in the code for the PUt, POST, and DELETE
  #TODO use a switch statement or the send method to improve this code
  def call_service url, parameters, call_type, body=nil
    agent = Mechanize.new
    agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    case call_type
    when 'GET'
      agent.get(url, parameters)
    when 'PUT'
      agent.put(url, parameters, body)
    when 'POST'
      agent.post(url, parameters, body)
    when 'DELETE'
      agent.delete(url, parameters)
    else
      "Not valid call type"
    end
  end
end

# if call_type == 'GET'
#   agent.get(url)
# elsif call_type == 'PUT'
#   agent.put(url,body)
# elsif call_type == 'POST'
#   agent.post(url,body)
# elsif call_type == 'DELETE'
#   agent.delete(url)
# end
