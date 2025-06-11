module Spotify
  class PlayerResource < Resource
    def state(**params)
      response = get_request("me/player", params: params)
      if response == true
        nil
      else
        Player.new response.body
      end
    end

    def devices
      response = get_request("me/player/devices")
      Collection.from_response(response, type: Device, key: "devices")
    end

    def playing(**params)
      response = get_request("me/player/currently-playing", params: params)
      if response == true
        nil
      else
        Player.new response.body
      end
    end

    def play(device: nil)
      response = put_request("me/player/play", body: { device_id: device }.compact)
      response.success?
    end

    def pause(device: nil)
      response = put_request("me/player/pause", body: { device_id: device }.compact)
      response.success?
    end

    def next(device: nil)
      response = post_request("me/player/next", body: { device_id: device }.compact)
      response.success?
    end

    def previous(device: nil)
      response = post_request("me/player/previous", body: { device_id: device }.compact)
      response.success?
    end
  end
end
