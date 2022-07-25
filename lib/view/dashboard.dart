import 'package:bytebankapp/view/contacts_list.dart';
import 'package:bytebankapp/view/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          Row(
            children: [
              _FeatureItem(
                'Transfer',
                Icons.monetization_on,
                onClick: () {
                  _showContactsList(context);
                },
              ),
              _FeatureItem(
                'Transaction Feed',
                Icons.description,
                onClick: () {
                  _showTransactionsList(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

void _showContactsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ContactList(),
    ),
  );
}

void _showTransactionsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ),
  );
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  const _FeatureItem(this.name, this.icon, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 155,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
