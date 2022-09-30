import '../../domain/view_datas/crypto_coin_view_data.dart';
import '../../domain/view_datas/list_crypto_view_data.dart';
import '../responses/get_crypto_coin_based_on_portfolio_response.dart';

extension CryptoMapper on List<GetCryptoCoinBasedOnPortfolioResponse> {
  ListCryptoViewData toViewData() {
    return ListCryptoViewData(
      listCrypto: map(
        (coin) {
          return CryptoCoinViewData(
            id: coin.id,
            symbol: coin.symbol,
            name: coin.name,
            image: coin.image,
            currentPrice: coin.current_price,
            priceChangePercentage24h: coin.price_change_percentage_24h,
          );
        },
      ).toList(),
    );
  }
}
