module Spotify
  class SearchResource < Resource
    def search(query:, type:, market: nil, limit: nil, offset: nil)
      params = { q: query, type: type, market: market, limit: limit, offset: offset }
      response = get_request("search", params: params)

      Collection.from_search_response(response)
    end
  end
end
