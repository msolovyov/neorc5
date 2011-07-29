require 'spec_helper'

describe "high_scores/index.html.erb" do
  before(:each) do
    assign(:high_scores, [
      stub_model(HighScore,
        :game => "Game",
        :score => 1
      ),
      stub_model(HighScore,
        :game => "Game",
        :score => 1
      )
    ])
  end

  it "renders a list of high_scores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Game".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
