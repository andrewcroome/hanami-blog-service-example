module BlogService
  module Persistence
    module Relations
      class Posts < ROM::Relation[:sql]
        schema(:posts, infer: true)

        def published
          where { published_from < Time.now }
        end

        def latest
          published.order { published_from.desc }.limit(5)
        end
      end
    end
  end
end
