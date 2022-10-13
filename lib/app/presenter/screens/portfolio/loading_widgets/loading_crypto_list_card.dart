import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCryptoListCard extends StatelessWidget {
  const LoadingCryptoListCard({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: ListTile(
        horizontalTitleGap: 8,
        shape: const Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
          ),
        ),
        leading: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(100)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 22,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                height: 22,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 15,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                height: 15,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
        trailing: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 2,
                bottom: 6,
                left: 9,
                right: 8,
              ),
              child: Icon(
                Icons.chevron_right,
                size: 24,
                color: Color.fromARGB(255, 117, 118, 128),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
