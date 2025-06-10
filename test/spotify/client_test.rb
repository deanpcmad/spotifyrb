require "test_helper"

class ClientTest < Minitest::Test
  def test_client_id
    client = Spotify::Client.new client_id: "123", access_token: "abc123"
    assert_equal "123", client.client_id
  end

  def test_access_token
    client = Spotify::Client.new client_id: "123", access_token: "abc123"
    assert_equal "abc123", client.access_token
  end
end
