require "rails_helper"

RSpec.describe TimeBlocksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/time_blocks").to route_to("time_blocks#index")
    end

    it "routes to #new" do
      expect(get: "/time_blocks/new").to route_to("time_blocks#new")
    end

    it "routes to #show" do
      expect(get: "/time_blocks/1").to route_to("time_blocks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/time_blocks/1/edit").to route_to("time_blocks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/time_blocks").to route_to("time_blocks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/time_blocks/1").to route_to("time_blocks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/time_blocks/1").to route_to("time_blocks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/time_blocks/1").to route_to("time_blocks#destroy", id: "1")
    end
  end
end
