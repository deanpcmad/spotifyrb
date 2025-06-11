module Spotify
  class MeResource < Resource
    def me
      response = get_request("me")
      User.new response.body
    end

    def playlists(**params)
      response = get_request("me/playlists", params: params)
      Collection.from_response(response, type: Playlist, key: "items")
    end
  end
end
