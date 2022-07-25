import 'package:bytebankapp/dao/conatcts_dao.dart';
import 'package:bytebankapp/models/contact.dart';
import 'package:bytebankapp/view/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // const ContactList({Key? key}) : super(key: key);
  final List<Contact> contacts = [];
  final ContactDao _dao = ContactDao();

  _atualiza(contact) {
    setState(() {
      if (contact != null) {
        contacts.add(contact);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conatacts List'),
      ),
      body: FutureBuilder(
        initialData: const [],
        future: Future.delayed(const Duration(seconds: 1))
            .then((value) => _dao.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              break;
          }
          final List<Contact> contacts = snapshot.data as List<Contact>;

          return ListView.builder(
            itemBuilder: (context, index) {
              final Contact contact = contacts[index];

              return _ContactItem(contact);
            },
            itemCount: contacts.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ContactForm();
          })).then((value) {
            _atualiza(value);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  // const _ContactItem({Key? key}) : super(key: key);

  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 16.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
