module Spotify
  class AlbumsResource < Resource
    def list(ids:, market: nil)
      response = get_request("albums", params: { ids: ids, market: market })
      Collection.from_response(response, type: Album, key: "albums")
    end
    def get(id:, market: nil)
      response = get_request("albums/#{id}", params: { market: market })
      Album.new response.body
    end
    def tracks(id:, **params)
      response = get_request("albums/#{id}/tracks", params: params)
      Collection.from_response(response, type: Track, key: "items")
    end
  end
end
