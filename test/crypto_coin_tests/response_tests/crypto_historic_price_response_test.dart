import 'package:card_02_listagem_crypto/app/infra/responses/get_crypto_historic_price_by_id_response.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN call methods from GetCryptoHistoricPriceByIdResponse THEN ensure returns accordingly',
    () async {
      var response = GetCryptoHistoricPriceByIdResponse(prices: [Decimal.ten]);
      var result = response.toJson();

      expect(result.isEmpty, false);
    },
  );
}
