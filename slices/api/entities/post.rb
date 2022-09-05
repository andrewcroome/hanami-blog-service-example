module API
  module Entities
    class Post < BlogService::Entities::Post
      def display_date
        published_from.strftime("%-d %B %Y")
      end
    end
  end
end
