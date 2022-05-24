/*
"id": "BTC",
        "currency": "BTC",
        "symbol": "BTC",
        "name": "Bitcoin",
        "logo_url": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
        "status": "active",
        "price": "29387.27009831",
        "price_date": "2022-05-24T00:00:00Z",
        "price_timestamp": "2022-05-24T09:15:00Z",
        "circulating_supply": "19048050",
        "max_supply": "21000000",
        "market_cap": "559770190196",
        "market_cap_dominance": "0.4286",
        "num_exchanges": "443",
        "num_pairs": "88306",
        "num_pairs_unmapped": "8736",
        "first_candle": "2011-08-18T00:00:00Z",
        "first_trade": "2011-08-18T00:00:00Z",
        "first_order_book": "2017-01-06T00:00:00Z",
        "rank": "1",
        "rank_delta": "0",
        "high": "67598.20412899",
        "high_timestamp": "2021-11-08T00:00:00Z",
 */
class Cryptocurrency {
  final String name;
  final String symbol;
  final String logoUrl;
  final String price;
  final String rank;
  final String priceChange1D;

  Cryptocurrency({
    required this.name,
    required this.symbol,
    required this.price,
    required this.rank,
    required this.logoUrl,
    required this.priceChange1D,
  });

  factory Cryptocurrency.fromJSON(Map<String, dynamic> map) {
    return Cryptocurrency(
      name: map["name"],
      symbol: map["symbol"],
      price: map["price"],
      rank: map["rank"],
      logoUrl: map["logo_url"],
      priceChange1D: map["1D"]["price_change_pct"],
    );
  }
}
