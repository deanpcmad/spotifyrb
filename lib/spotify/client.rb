module Spotify
  class Client
    BASE_URL = "https://api.spotify.com/v1"

    attr_reader :access_token, :adapter

    def initialize(access_token:, adapter: Faraday.default_adapter)
      @access_token = access_token
      @adapter = adapter
    end

    def me
      MeResource.new(self)
    end

    def search
      SearchResource.new(self)
    end

    def player
      PlayerResource.new(self)
    end

    def users
      UsersResource.new(self)
    end

    def albums
      AlbumsResource.new(self)
    end

    def artists
      ArtistsResource.new(self)
    end

    def playlists
      PlaylistsResource.new(self)
    end

    def tracks
      TracksResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, access_token

        conn.headers = {
          "User-Agent" => "spotifyrb/v#{VERSION} (github.com/deanpcmad/spotifyrb)"
        }

        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end
