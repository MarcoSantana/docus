require 'rails_helper'

RSpec.describe "universities/edit", type: :view do
  before(:each) do
    @university = assign(:university, University.create!())
  end

  it "renders the edit university form" do
    render

    assert_select "form[action=?][method=?]", university_path(@university), "post" do
    end
  end
end
