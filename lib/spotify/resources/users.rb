module Spotify
  class UsersResource < Resource
    def get(id:)
      response = get_request("users/#{id}")
      User.new response.body
    end

    def playlists(id:, **params)
      response = get_request("users/#{id}/playlists", params: params)
      Collection.from_response(response, type: Playlist, key: "items")
    end
  end
end
