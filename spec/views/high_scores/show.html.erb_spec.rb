require 'spec_helper'

describe "high_scores/show.html.erb" do
  before(:each) do
    @high_score = assign(:high_score, stub_model(HighScore,
      :game => "Game",
      :score => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Game/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
