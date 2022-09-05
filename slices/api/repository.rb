# frozen_string_literal: true

# auto_register: false

module API
  class Repository < BlogService::Repository
    struct_namespace Entities
  end
end
