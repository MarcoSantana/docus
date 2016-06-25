require 'rails_helper'

RSpec.describe "personal_documents/new", type: :view do
  before(:each) do
    assign(:personal_document, PersonalDocument.new())
  end

  it "renders new personal_document form" do
    render

    assert_select "form[action=?][method=?]", personal_documents_path, "post" do
    end
  end
end
