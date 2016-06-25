require 'rails_helper'

RSpec.describe "personal_documents/edit", type: :view do
  before(:each) do
    @personal_document = assign(:personal_document, PersonalDocument.create!())
  end

  it "renders the edit personal_document form" do
    render

    assert_select "form[action=?][method=?]", personal_document_path(@personal_document), "post" do
    end
  end
end
