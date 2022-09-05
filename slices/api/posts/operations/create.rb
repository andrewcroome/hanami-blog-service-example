# frozen_string_literal: true

module API
  module Posts
    module Operations
      class Create < BlogService::Operation
        include Deps[
          "posts.validation.contract",
          "repositories.post_repo"
        ]

        def call(params)
          validation = contract.(params)

          if validation.success?
            post = post_repo.create(validation.to_h)

            Success(post)
          else
            Failure(validation)
          end
        end
      end
    end
  end
end
