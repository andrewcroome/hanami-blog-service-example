# frozen_string_literal: true

module API
  module Actions
    module Posts
      class Create < API::Action
        include Deps["posts.operations.create"]

        def handle(request, response)
          response.format = format(:json)

          create.(request.params.to_h) do |m|
            m.success do |post|
              response.status = 201
            end

            m.failure do |validation|
              response.status = 422
              response.body = {errors: validation.errors.to_h}.to_json
            end
          end
        end
      end
    end
  end
end
