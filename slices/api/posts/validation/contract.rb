module API
  module Posts
    module Validation
      class Contract < BlogService::Contract
        json do
          required(:title).filled(:string)
          required(:body).maybe(:string)
          required(:published_from).maybe(:time)
        end
      end
    end
  end
end
