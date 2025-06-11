module Spotify
  class Collection
    attr_reader :data, :total

    def self.from_response(response, type:, key: nil)
      body = response.body

      if key.is_a?(String)
        data = body[key].map { |attrs| type.new(attrs) }
      else
        data = body.map { |attrs| type.new(attrs) }
      end

      new(
        data: data,
        total: data.count,
      )
    end

    def self.from_search_response(response)
      body = response.body

      data = []

      puts body["tracks"].count

      if body["tracks"] && body["tracks"]["items"]
        data.concat(body["tracks"]["items"].map { |attrs| Track.new(attrs) })
      end

      if body["artists"] && body["artists"]["items"]
        data.concat(body["artists"]["items"].map { |attrs| Artist.new(attrs) })
      end

      if body["albums"] && body["albums"]["items"]
        data.concat(body["albums"]["items"].map { |attrs| Album.new(attrs) })
      end

      if body["playlists"] && body["playlists"]["items"]
        data.concat(body["playlists"]["items"].map { |attrs| Playlist.new(attrs) })
      end

      if body["shows"] && body["shows"]["items"]
        data.concat(body["shows"]["items"].map { |attrs| Show.new(attrs) })
      end

      if body["episodes"] && body["episodes"]["items"]
        data.concat(body["episodes"]["items"].map { |attrs| Episode.new(attrs) })
      end

      if body["audiobooks"] && body["audiobooks"]["items"]
        data.concat(body["audiobooks"]["items"].map { |attrs| Audiobook.new(attrs) })
      end

      new(
        data: data,
        total: data.count,
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end

    def each(&block)
      data.each(&block)
    end

    def first
      data.first
    end

    def last
      data.last
    end

    def count
      data.count
    end
  end
end
