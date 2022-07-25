import 'package:bytebankapp/dao/conatcts_dao.dart';
import 'package:bytebankapp/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Contact'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Fullname',
                ),
                style: const TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _accountNumber,
                  decoration: const InputDecoration(
                    labelText: 'Accont Number',
                  ),
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      final String name = _nameController.text;
                      final int accountNumber = int.parse(_accountNumber.text);
                      final Contact newContact =
                          Contact(0, name, accountNumber);
                      debugPrint('$newContact');
                      _dao
                          .save(newContact)
                          .then((id) => Navigator.pop(context));
                    },
                    child: const Text('Enviar'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
