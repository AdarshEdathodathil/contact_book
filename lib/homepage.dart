import 'package:flutter/material.dart';

class ContactBook extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'Adarsh',
        phone: '9495009595',
        email: 'adarshedathodathil@gmail.com'),
    Contact(
        name: 'Haritha',
        phone: '7356526296',
        email: 'harithaedasseri@gmail.com'),
    Contact(name: 'Adhu', phone: '701267450', email: 'lioneladhu@gmail.com'),
  ];

  ContactBook({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Book',
        ),
        backgroundColor: const Color.fromARGB(255, 66, 239, 167),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(contacts[index].name[0]),
            ),
            title: Text(contacts[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contacts[index].phone),
                Text(contacts[index].email),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => contactDetail(contact: contacts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  contactDetail({required Contact contact}) {}
}

class Contact {
  final String name;
  final String phone;
  final String email;

  Contact({required this.name, required this.phone, required this.email});
}

class ContactDetail extends StatelessWidget {
  final Contact contact;

  const ContactDetail({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              contact.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Phone: ${contact.phone}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${contact.email}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
