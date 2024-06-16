import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration,
  });

  final String cardNumber;
  final String cardHolder;
  final String cardExpiration;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      borderOnForeground: true,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          gradient: const RadialGradient(
            center: Alignment.topRight, // Start at top-right
            radius: 1.5, // Adjust this value for spread control
            colors: [
              // Ending color
              Colors.grey, // Ending color
              Colors.black, // Starting color
            ],
            stops: [0.0, 0.7], // Fine-tune color distribution
          ),
        ),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            _buildDetailsBlock(
              label: 'CARD NUMBER',
              value: cardNumber,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'EXP DATE',
                  value: cardExpiration,
                ),
                const SizedBox(
                  width: 30,
                ),
                _buildDetailsBlock(
                  label: 'CVV',
                  value: '***',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsBlock({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 25,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            border: Border(
              bottom: BorderSide(
                color: Colors.orange,
                width: 3.0,
              ),
            ),
          ),
          padding: const EdgeInsets.all(4.0),
          // Adjust padding as needed
          child: const Center(
            child: Text(
              'FEDERAL BANK',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                decorationThickness: 2.0,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Image.asset(
            'assets/scapia.png',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
