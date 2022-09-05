# frozen_string_literal: true

module API
  module Repositories
    class PostRepo < Repository[:posts]
      commands :create, update: :by_pk

      def get!(id)
        posts.by_pk(id).one!
      end

      def latest
        posts.latest.to_a
      end
    end
  end
end
