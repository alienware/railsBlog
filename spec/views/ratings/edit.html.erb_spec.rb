require 'spec_helper'

describe "ratings/edit" do
  before(:each) do
    @rating = assign(:rating, stub_model(Rating))
  end

  it "renders the edit rating form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do
    end
  end
end
