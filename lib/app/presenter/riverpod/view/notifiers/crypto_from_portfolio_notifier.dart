// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../domain/use_cases/models/crypto_coin_model.dart';
// import '../../../../domain/use_cases/models/portfolio_model.dart';

// class CryptoFromPortfolioNotifier extends StateNotifier<List<CryptoCoinModel>> {
//   CryptoFromPortfolioNotifier(
//     this.portfolio,
//   ) : super([]) {
//     getAllCryptoFromPortfolio(portfolio);
//   }

//   final PortfolioModel portfolio;

//   void getAllCryptoFromPortfolio(PortfolioModel portfolio) async {
//     GetCryptoByIdWebService getCryptoByIdWebService = GetCryptoByIdWebService();
//     List<CryptoCoinModel> list = [];
//     for (int i = 0; i < portfolio.coins.length; i++) {
//       list.add(
//         await getCryptoByIdWebService.getCryptoById(
//           portfolio.coins[i].name.toLowerCase(),
//         ),
//       );
//     }

//     state = list;
//   }
// }
