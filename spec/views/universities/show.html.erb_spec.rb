require 'rails_helper'

RSpec.describe "universities/show", type: :view do
  before(:each) do
    @university = assign(:university, University.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
