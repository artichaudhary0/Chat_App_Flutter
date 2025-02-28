import 'package:chat_app_flutter/models/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Statuscontactscreen extends StatelessWidget {
  const Statuscontactscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Status>>(future: ref.read(), builder: builder);
  }
}
