import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/internationalization_widget_tester.dart';
import '../helpers/setupl10n.dart';

void main() {
  testWidgets(
    'testing support to pt internationalization',
    (tester) async {
      await tester.pumpWidget(
        const InternationalizationWidgetTester(
          locale: Locale('pt', 'BR'),
          child: Setupl10n(),
        ),
      );

      expect(find.text('pt-BR'), findsOneWidget);
      expect(find.text('R\$'), findsOneWidget);
      expect(find.text('dd/MM/yyyy'), findsOneWidget);
      expect(find.text('Cripto'), findsOneWidget);
      expect(find.text('Valor total de moedas em dinheiro'), findsOneWidget);
      expect(find.text('Mudar Idioma'), findsOneWidget);
      expect(find.text('Portfólio'), findsOneWidget);
      expect(find.text('Movimentações'), findsOneWidget);
      expect(find.text('Detalhes'), findsOneWidget);
      expect(find.text('Preço Atual'), findsOneWidget);
      expect(find.text('Variação 24H'), findsOneWidget);
      expect(find.text('Quantidade'), findsOneWidget);
      expect(find.text('Valor'), findsOneWidget);
      expect(find.text('Converter Moeda'), findsOneWidget);
      expect(find.text('Saldo Disponível'), findsOneWidget);
      expect(find.text('Quanto você gostaria de converter?'), findsOneWidget);
      expect(find.text('0,00'), findsOneWidget);
      expect(find.text('Por favor insira algum valor'), findsOneWidget);
      expect(find.text('Por favor insira um valor acima de 0'), findsOneWidget);
      expect(
          find.text(
              'Por favor insira um valor abaixo ou igual a quantidade possuída'),
          findsOneWidget);
      expect(find.text('Por favor, escolha duas moedas diferentes'),
          findsOneWidget);
      expect(find.text('Total Estimado'), findsOneWidget);
      expect(find.text('Valor não foi informado'), findsOneWidget);
      expect(find.text('Revisar'), findsOneWidget);
      expect(find.text('Revise os dados da sua conversão'), findsOneWidget);
      expect(find.text('Converter'), findsOneWidget);
      expect(find.text('Receber'), findsOneWidget);
      expect(find.text('Câmbio'), findsOneWidget);
      expect(find.text('Concluir Conversão'), findsOneWidget);
      expect(find.text('Conversão efetuada'), findsOneWidget);
      expect(find.text('Conversão de moedas efetuada com successo!'),
          findsOneWidget);
      expect(find.text('Dados Bancários'), findsOneWidget);
      expect(find.text('Banco:'), findsOneWidget);
      expect(find.text('Agência:'), findsOneWidget);
      expect(find.text('Sub-conta:'), findsOneWidget);
      expect(find.text('Conta:'), findsOneWidget);
      expect(find.text('DV:'), findsOneWidget);
      expect(find.text('Detalhes da Transação'), findsOneWidget);
      expect(find.text('Moeda Convertida:'), findsOneWidget);
      expect(find.text('Quantidade Convertida:'), findsOneWidget);
      expect(find.text('Moeda Recebida:'), findsOneWidget);
      expect(find.text('Quantidade Recebida:'), findsOneWidget);
      expect(find.text('Valor Monetário:'), findsOneWidget);
      expect(find.text('Data de Transação:'), findsOneWidget);
    },
  );
}
