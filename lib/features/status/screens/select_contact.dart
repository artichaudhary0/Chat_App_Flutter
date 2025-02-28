import 'package:chat_app_flutter/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectContactScreen extends StatelessWidget {
  static const String routeName = '/select-contact';
  const SelectContactScreen({super.key});

  // void selectContact(
  //     WidgetRef ref, ContactsList selectContact, BuildContext context) {
  //
  //   ref.read(selectContactControllerPrivder).selectContact(selectContact,context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Contact"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text(
              "Arti",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/bg.png"),
            ),
          ),
        ),
      ),
    );
  }
}
