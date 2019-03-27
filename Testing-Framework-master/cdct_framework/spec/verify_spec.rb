require_relative '../spec/spec_helper'
include ApiCall

def test(filestream,todelete = nil)
  json_payload = JSON.parse(filestream)

  #Retrieve the values from the JSON file
  url = json_payload['service_url']
  call_type = json_payload['request_type']
  request_body = json_payload['request_body'].to_json

  #Make the service call to the URL that was defined in the JSON file
  service_response = ApiCall.call_service(url, call_type,request_body)
  response_body = JSON.parse(service_response.body)
  response_body.delete(todelete)
  #Compare the service response to the expected response
  expect(service_response.code).to eq(json_payload['expected_response_code'])
  expect(response_body).to eq(json_payload['expected_response_body'])
end

describe 'test' do

  #TODO add json files with expectations for put, post, and delete
  #TODO update the get_cat_breed.json file to be for your service
  #TODO iterate over all files in the json_files folder and run this test for each one i nthe folder
  #TODO add ability to pass parameters to the JSON files
  it 'can get customer correctly' do
    #Read and parse the file into JSON format
    file = File.read('json_files/get_customer.json')
    test(file)
  end

  it 'can create a customer by post correctly' do
    file = File.read('json_files/post_customer.json')
    test(file,'cust_id')
  end
end
