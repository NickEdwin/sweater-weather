# require 'rails_helper'
#
# describe "Image API" do
#   it "receives a 200 response", :vcr do
#     get '/api/v1/forecast?location=denver,co'
#     JSON.parse(response.body)
#
#     expect(response).to be_successful
#     expect(response.status).to eq(200)
#   end
#
#   it "shows an image for the city entered", :vcr do
#     get '/api/v1/forecast?location=denver,co'
#     data = JSON.parse(response.body)
#
#     epect(data[""])
#   end
# end
