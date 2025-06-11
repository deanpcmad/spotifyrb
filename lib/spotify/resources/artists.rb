module Spotify
  class ArtistsResource < Resource
    def list(ids:)
      response = get_request("artists", params: { ids: ids })
      Collection.from_response(response, type: Artist, key: "artists")
    end
    def get(id:, market: nil)
      response = get_request("artists/#{id}", params: { market: market })
      Artist.new response.body
    end
    def albums(id:, **params)
      response = get_request("artists/#{id}/albums", params: params)
      Collection.from_response(response, type: Album, key: "items")
    end
    def top_tracks(id:, market: nil)
      response = get_request("artists/#{id}/top-tracks", params: { market: market })
      Collection.from_response(response, type: Track, key: "tracks")
    end
  end
end
