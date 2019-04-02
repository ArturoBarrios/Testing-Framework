require_relative '../spec/spec_helper'
include ApiCall

describe 'test' do

  #TODO add json files with expectations for put, post, and delete
  #TODO update the get_cat_breed.json file to be for your service
  #TODO iterate over all files in the json_files folder and run this test for each one i nthe folder
  #TODO add ability to pass parameters to the JSON files


  Dir.foreach("json_files") do |filename|
    if filename[0] != '.'
      it "#{filename} passed" do
        file = File.read("json_files/#{filename}")
        json_payload = JSON.parse(file)
        url = json_payload['service_url']
        call_type = json_payload['request_type']
        request_body = json_payload['request_body'].to_json

        case call_type
        when 'GET'
          #Make the service call to the URL that was defined in the JSON file
          service_response = ApiCall.call_service(url, call_type,request_body)
          response_body = JSON.parse(service_response.body)
          #Compare the service response to the expected response
          expect(service_response.code).to eq(json_payload['expected_response_code'])
          expect(response_body).to eq(json_payload['expected_response_body'])
        when 'POST'
          #Make the service call to the URL that was defined in the JSON file
          service_response = ApiCall.call_service(url, call_type,request_body)
          response_body = JSON.parse(service_response.body)
          #Compare the service response to the expected response
          expect(service_response.code).to eq(json_payload['expected_response_code'])
          expect(response_body).to eq(json_payload['expected_response_body'])
          ApiCall.call_service(url+"999",'DELETE',{})
        when 'PUT'
          #Make the service call to the URL that was defined in the JSON file
          service_response = ApiCall.call_service(url, call_type,request_body)
          response_body = JSON.parse(service_response.body)
          #Compare the service response to the expected response
          expect(service_response.code).to eq(json_payload['expected_response_code'])
          expect(response_body).to eq(json_payload['expected_response_body'])
        when 'DELETE'
          data = ApiCall.call_service(url,'GET').body
          #Make the service call to the URL that was defined in the JSON file
          service_response = ApiCall.call_service(url, call_type,request_body)
          response_body = {}
          #Compare the service response to the expected response
          expect(service_response.code).to eq(json_payload['expected_response_code'])
          expect(response_body).to eq(json_payload['expected_response_body'])
          ApiCall.call_service(url.delete("1"),'POST',data)
        end
      end
    end
  end
end
