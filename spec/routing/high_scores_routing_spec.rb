require "spec_helper"

describe HighScoresController do
  describe "routing" do

    it "routes to #index" do
      get("/high_scores").should route_to("high_scores#index")
    end

    it "routes to #new" do
      get("/high_scores/new").should route_to("high_scores#new")
    end

    it "routes to #show" do
      get("/high_scores/1").should route_to("high_scores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/high_scores/1/edit").should route_to("high_scores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/high_scores").should route_to("high_scores#create")
    end

    it "routes to #update" do
      put("/high_scores/1").should route_to("high_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/high_scores/1").should route_to("high_scores#destroy", :id => "1")
    end

  end
end
