module Spotify
  class TracksResource < Resource
    def list(ids:, **params)
      response = get_request("tracks", params: { ids: ids }.merge(params))
      Collection.from_response(response, type: Track, key: "tracks")
    end
    def get(id:, **params)
      response = get_request("tracks/#{id}", params: params)
      Playlist.new response.body
    end
  end
end
