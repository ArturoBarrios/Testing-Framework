require_relative '../spec/spec_helper'
include ApiCall
describe 'test' do

  #TODO add json files with expectations for put, post, and delete
  #TODO update the get_cat_breed.json file to be for your service
  #TODO iterate over all files in the json_files folder and run this test for each one i nthe folder
  #TODO add ability to pass parameters to the JSON files
  it 'can get customer correctly' do
    #Read and parse the file into JSON format
    file = File.read('json_files/get_customer.json')
    json_payload = JSON.parse(file)

    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    call_type = json_payload['request_type']
    request_body = json_payload['request_body'].to_json

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type,request_body)
    response_body = JSON.parse(service_response.body)
    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(response_body).to eq(json_payload['expected_response_body'])
  end

  it 'can create a customer by post correctly' do
    file = File.read('json_files/post_customer.json')
    json_payload = JSON.parse(file)

    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    call_type = json_payload['request_type']
    request_body = json_payload['request_body'].to_json

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type,request_body)
    response_body = JSON.parse(service_response.body)
    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(response_body).to eq(json_payload['expected_response_body'])
    ApiCall.call_service("http://127.0.0.1:8000/myapp/customers/999",'DELETE',{})
  end

  it 'can update a customer by put correctly' do
    #Read and parse the file into JSON format
    file = File.read('json_files/put_customer.json')
    json_payload = JSON.parse(file)

    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    call_type = json_payload['request_type']
    request_body = json_payload['request_body'].to_json

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type,request_body)
    response_body = JSON.parse(service_response.body)
    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(response_body).to eq(json_payload['expected_response_body'])
  end

  it 'can delete a customer correctly' do
    file = File.read('json_files/delete_customer.json')
    json_payload = JSON.parse(file)
    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    data = ApiCall.call_service(url,'GET').body
    call_type = json_payload['request_type']
    request_body = json_payload['request_body'].to_json

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type,request_body)
    response_body = {}
    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(response_body).to eq(json_payload['expected_response_body'])
    ApiCall.call_service("http://127.0.0.1:8000/myapp/customers/",'POST',data)
  end

  it 'can get airport correctly' do
    #Read and parse the file into JSON format
    file = File.read('json_files/get_airport.json')
    json_payload = JSON.parse(file)

    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    call_type = json_payload['request_type']
    request_body = json_payload['request_body']

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type,request_body)

    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(JSON.parse(service_response.body)).to eq(json_payload['expected_response_body'])
  end
  it 'can create a airport by post correctly' do
    #Read and parse the file into JSON format
    file = File.read('json_files/post_airport.json')
    json_payload = JSON.parse(file)

    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    call_type = json_payload['request_type']
    request_body = json_payload['request_body']

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type,request_body)

    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(JSON.parse(service_response.body)).to eq(json_payload['expected_response_body'])
  end
  it 'can update a airport by put correctly' do
    #Read and parse the file into JSON format
    file = File.read('json_files/put_airport.json')
    json_payload = JSON.parse(file)

    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    call_type = json_payload['request_type']
    request_body = json_payload['request_body']

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type,request_body)

    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(JSON.parse(service_response.body)).to eq(json_payload['expected_response_body'])
  end
  it 'can delete a airplane correctly' do
    file = File.read('json_files/delete_airplane.json')
    json_payload = JSON.parse(file)
    #Retrieve the values from the JSON file
    url = json_payload['service_url']
    data = ApiCall.call_service(url,'GET').body
    call_type = json_payload['request_type']
    request_body = json_payload['request_body'].to_json

    #Make the service call to the URL that was defined in the JSON file
    service_response = ApiCall.call_service(url, call_type, request_body)
    response_body = {}
    #Compare the service response to the expected response
    expect(service_response.code).to eq(json_payload['expected_response_code'])
    expect(response_body).to eq(json_payload['expected_response_body'])
    ApiCall.call_service("http://127.0.0.1:8000/myapp/airplanes/",'POST',data)
  end
end
