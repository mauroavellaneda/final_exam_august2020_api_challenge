require "rails_helper"

RSpec.describe "POST /api/comments", type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(redentials) }
  let(:article) { create(:article) }
end
describe "seccessfully with valid headers" do
  before do
    POST "/api/comments",
         params: {
           comment: {
             article_id: article.id,
             content: "I like the article",
           },
         },
         header: headers

    it "is expected to return 200 response status" do
      expect(response).to have_http_status 200
    end

    it "is expected to return success message" do
      expect(response_json["message"]).to eq "comment successfully created"
    end
  end
end
