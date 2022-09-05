# frozen_string_literal: true

require "blog_service/types"

module BlogService
  class Settings < Hanami::Settings
    # Define your app settings here, for example:
    #
    # setting :my_flag, default: false, constructor: Types::Params::Bool
    setting :database_url
  end
end
