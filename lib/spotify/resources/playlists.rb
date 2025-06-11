module Spotify
  class PlaylistsResource < Resource
    def get(id:, **params)
      response = get_request("playlists/#{id}", params: params)
      Playlist.new response.body
    end

    def update(id:, **attrs)
      put_request("playlists/#{id}", body: attrs)
    end

    def tracks(id:, **params)
      response = get_request("playlists/#{id}/tracks", params: params)
      Collection.from_response(response, type: Track, key: "items")
    end

    def add_tracks(id:, uris:, position: nil)
      body = { uris: uris.split(",") }
      body[:position] = position if position
      response = post_request("playlists/#{id}/tracks", body: body)
      Snapshot.new response.body
    end

    def remove_tracks(id:, uris:, snapshot_id: nil)
      body = { tracks: uris.split(",").map { |uri| { uri: uri } } }
      body[:snapshot_id] = snapshot_id if snapshot_id
      response = delete_request("playlists/#{id}/tracks", body: body)
      Snapshot.new response.body
    end

    def create(user:, name:, **params)
      attrs = { name: name }
      response = post_request("users/#{user}/playlists", body: attrs.merge(params))
      Playlist.new response.body
    end
  end
end
