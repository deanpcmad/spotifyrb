require "test_helper"

class ClientTest < Minitest::Test
  def test_access_token
    client = Spotify::Client.new access_token: "abc123"
    assert_equal "abc123", client.access_token
  end
end
