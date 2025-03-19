import 'package:code_base/core/di/injection.dart';
import 'package:code_base/pages/user_page/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userBloc = getIt<UserBloc>();
  @override
  void initState() {
    userBloc.fetchListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UserBloc, UserState>(
          bloc: userBloc,
          buildWhen: (_, state) => state is GetUserListSuccess || state is GetUserListFailed,
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                itemCount: userBloc.listUser.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: ValueKey(index), // Tối ưu performance
                    title: Text('User: ${userBloc.listUser[index].firstName}'),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
