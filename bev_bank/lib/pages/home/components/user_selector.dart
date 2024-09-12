import 'package:bev_bank/application/user/user_bloc.dart';
import 'package:bev_bank/application/user_selection/user_selection_bloc.dart';
import 'package:bev_bank/components/cards/user_card.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:bev_bank/routing/router.dart';
import 'package:bev_bank/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSelector extends StatelessWidget {
  const UserSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        switch (state) {
          case UsersLoading _:
            return const Center(child: CircularProgressIndicator());
          case UsersLoaded state:
            return _userSelector(state.users);
          case UsersLoadError state:
            return Center(child: Text("ERROR: ${state.message}"));
        }
      },
    );
  }

  Widget _userSelector(List<User> users) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 120,
              ),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserCard(
                  user: users[index],
                  onTap: () {
                    context
                        .read<UserSelectionBloc>()
                        .add(UserSelectedEvent(users[index]));
                    PageRouter.goToPage(AppRoute.selection, context);
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
