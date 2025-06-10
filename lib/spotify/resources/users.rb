module Spotify
  class UsersResource < Resource
    def me
      response = get_request("me")
      User.new response.body
    end

    def retrieve(id:)
      response = get_request("users/#{id}")
      User.new response.body
    end
  end
end
