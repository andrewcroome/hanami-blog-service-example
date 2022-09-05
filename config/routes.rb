# frozen_string_literal: true

module BlogService
  class Routes < Hanami::Routes
    define do
      root { "Hello from Hanami" }
      
      slice :api, at: "/api" do
        post "/posts", to: "posts.create"
      end
    end
  end
end
