require 'rails_helper'

RSpec.describe "personal_documents/show", type: :view do
  before(:each) do
    @personal_document = assign(:personal_document, PersonalDocument.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
