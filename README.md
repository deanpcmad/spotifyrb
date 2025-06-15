# SpotifyRB

SpotifyRB is the easiest and most complete Ruby library for the [Spotify API](https://developer.spotify.com/documentation/web-api).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "spotifyrb"
```

## Usage

### Set Client Details

Firstly you'll need to set an Access Token, because the Spotify API requires authentication.

```ruby
@client = Spotify::Client.new(access_token: "xyz123")
```

### Resources

The gem maps as closely as we can to the Spotify API so you can easily convert API examples to gem code.

Responses are created as objects like `Spotify::Track`. Having types like `Spotify::User` is handy for understanding what
type of object you're working with. They're built using OpenStruct so you can easily access data in a Ruby-ish way.

### Me

```ruby
# Retrieves the currently authenticated user's details
@client.me.me

# Retrieves the currently authenticated user's playlists
@client.me.playlists
@client.me.playlists(limit: 10)
```

### Users

```ruby
# Get's a user's profile. ID would be their Spotify ID
@client.users.get(id: "username")

# Gets a list of a user's playlists
@client.users.playlists(id: "username")
@client.users.playlists(id: "username", limit: 10)
```

### Playlists

```ruby
# Get a Playlist
@client.playlists.get(id: "abc123")

# Create a Playlist
@client.playlists.create(user: "userid", name: "My Playlist")
@client.playlists.create(user: "userid", name: "My Playlist", public: true)
@client.playlists.create(user: "userid", name: "My Playlist", description: "My Description")

# Update a Playlist
@client.playlists.update(id: "abc123", name: "A name change")

# Get the tracks on a Playlist
@client.playlists.tracks(id: "abc123")
@client.playlists.tracks(id: "abc123", market: "GB")

# Add a track (or multiple tracks) to a Playlist
# uris should be in the following format: 'spotify:type:id' e.g. 'spotify:track:1k2pQc5i348DCHwbn5KTdc'
# to add multiple tracks, uris should be comma separated
# If successful, returns a Snapshot ID
@client.playlists.add_tracks(id: "abc123", uris: "spotify:track:1k2pQc5i348DCHwbn5KTdc")
@client.playlists.add_tracks(id: "abc123", uris: "spotify:track:1k2pQc5i348DCHwbn5KTdc", position: 0)

# Remove a track (or multiple tracks) from a Playlist
@client.playlists.remove_tracks(id: "abc123", uris: "spotify:track:1k2pQc5i348DCHwbn5KTdc")
@client.playlists.remove_tracks(id: "abc123", snapshot_id: "123abc")
```

### Player

```ruby
# Get the Player state
@client.player.state
@client.player.state(market: "GB")

# Get the Player Devices
@client.player.devices

# Get the current playing song
@client.player.playing
@client.player.playing(market: "GB")

# Start/Resume Playback
@client.player.play
@client.player.play(device: "abc123")

# Pause Playback
@client.player.pause
@client.player.pause(device: "abc123")

# Skip to next
@client.player.next
@client.player.next(device: "abc123")

# Skip to previous
@client.player.previous
@client.player.previous(device: "abc123")

# Get the player queue
@client.player.queue

# Add an item to the queue
@client.player.add_to_queue(uri: "spotify:track:1k2pQc5i348DCHwbn5KTdc")
@client.player.add_to_queue(uri: "spotify:track:1k2pQc5i348DCHwbn5KTdc", device: "abc123")
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/spotifyrb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
