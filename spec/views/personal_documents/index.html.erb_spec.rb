require 'rails_helper'

RSpec.describe "personal_documents/index", type: :view do
  before(:each) do
    assign(:personal_documents, [
      PersonalDocument.create!(),
      PersonalDocument.create!()
    ])
  end

  it "renders a list of personal_documents" do
    render
  end
end
