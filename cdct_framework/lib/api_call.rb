require 'mechanize'
module ApiCall
  #TODO Fill in the code for the PUt, POST, and DELETE
  #TODO use a switch statement or the send method to improve this code
  def call_service url, call_type, body
    if call_type == 'GET'
      agent = Mechanize.new
      agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
      agent.get(url)
    elsif call_type == 'PUT'

    elsif call_type == 'POST'

    elsif call_type == 'DELETE'

    end
  end
end