require "rails_helper"

RSpec.describe PersonalDocumentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/personal_documents").to route_to("personal_documents#index")
    end

    it "routes to #new" do
      expect(:get => "/personal_documents/new").to route_to("personal_documents#new")
    end

    it "routes to #show" do
      expect(:get => "/personal_documents/1").to route_to("personal_documents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/personal_documents/1/edit").to route_to("personal_documents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/personal_documents").to route_to("personal_documents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/personal_documents/1").to route_to("personal_documents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/personal_documents/1").to route_to("personal_documents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/personal_documents/1").to route_to("personal_documents#destroy", :id => "1")
    end

  end
end
