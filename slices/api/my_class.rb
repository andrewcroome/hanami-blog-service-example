# slices/api/my_class.rb

# frozen_string_literal: true

module API
  class MyClass
    include Deps[
      "posts.operations.create",
      "logger"
    ]

    def call(input)
      logger.info "I received #{input}"
      create.call(input)
    end
  end
end
