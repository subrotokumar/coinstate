// {
// "id": "bitcoin",
// "symbol": "btc",
// "name": "Bitcoin",
// "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
// "current_price": 1659004,
// "market_cap": 31813754846049,
// "market_cap_rank": 1,
// "fully_diluted_valuation": 35035475348874,
// "total_volume": 3277157934123,
// "high_24h": 1781796,
// "low_24h": 1575092,
// "price_change_24h": 83912,
// "price_change_percentage_24h": 5.32744,
// "market_cap_change_24h": 1706981901318,
// "market_cap_change_percentage_24h": 5.66976,
// "circulating_supply": 19068925,
// "total_supply": 21000000,
// "max_supply": 21000000,
// "ath": 5128383,
// "ath_change_percentage": -67.33448,
// "ath_date": "2021-11-10T14:24:11.849Z",
// "atl": 3993.42,
// "atl_change_percentage": 41849.33464,
// "atl_date": "2013-07-05T00:00:00.000Z",
// "roi": null,
// "last_updated": "2022-06-16T09:37:22.527Z"
// }

class Cryptocurrency {
  final String id;
  final String name;
  final String symbol;
  final String logoUrl;
  final String price;
  final String rank;
  final String priceChange1D;

  Cryptocurrency({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.rank,
    required this.logoUrl,
    required this.priceChange1D,
  });

  factory Cryptocurrency.fromJSON(Map<String, dynamic> map) {
    return Cryptocurrency(
      id: map["id"],
      name: map["name"],
      symbol: map["symbol"],
      price: map["current_price"].toString(),
      rank: map["market_cap_rank"].toString(),
      logoUrl: map["image"],
      priceChange1D: map["price_change_percentage_24h"].toString(),
    );
  }
}
