require 'feishu/api/user'

module Feishu
  class UserClient < Feishu::Client
    include Feishu::Api::User

    def initialize(authorization)
      self.class.default_options.merge!(
        headers: {
          "Authorization": "Bearer #{authorization}",
          "Content-Type": 'application/json; charset=utf-8',
        }
      )
      self.class.base_uri(Feishu.config.uri)
    end
  end
end