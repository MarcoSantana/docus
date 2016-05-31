require 'rails_helper'

RSpec.describe "universities/index", type: :view do
  before(:each) do
    assign(:universities, [
      University.create!(),
      University.create!()
    ])
  end

  it "renders a list of universities" do
    render
  end
end
