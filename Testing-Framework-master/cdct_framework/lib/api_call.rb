require 'mechanize'
module ApiCall
  #TODO Fill in the code for the PUt, POST, and DELETE
  #TODO use a switch statement or the send method to improve this code
  def call_service url, call_type, body
    agent = Mechanize.new
    agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    if call_type == 'GET'
      agent.get(url)
    elsif call_type == 'PUT'
      agent.put(url,body)
    elsif call_type == 'POST'
      agent.post(url,body)
    elsif call_type == 'DELETE'
      agent.delete(url)
    end
  end
end
