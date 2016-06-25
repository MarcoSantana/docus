require 'rails_helper'

RSpec.describe "PersonalDocuments", type: :request do
  describe "GET /personal_documents" do
    it "works! (now write some real specs)" do
      get personal_documents_path
      expect(response).to have_http_status(200)
    end
  end
end
