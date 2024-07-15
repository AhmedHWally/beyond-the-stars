import 'package:beyond_the_stars/core/dependency_injection/dependency_injection.dart';
import 'package:beyond_the_stars/core/functions/show_toast.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/features/profile/logic/logout_bloc/logout_bloc.dart';
import 'package:beyond_the_stars/features/profile/ui/widgets/custom_profilescreen_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LogoutBloc>(),
      child: BlocConsumer<LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.login, (route) => false);
            showToast(text: 'Logout done successfully');
          } else if (state is LogoutFailure) {
            showToast(text: state.errMessage);
          }
        },
        builder: (context, state) => CustomProfileScreenComponent(
          title: 'Log out',
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      backgroundColor: const Color(0xff424F66),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Are you sure that you want to log out !',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                        context
                                            .read<LogoutBloc>()
                                            .add(LogoutUserEvent());
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(color: Colors.white),
                                      )))
                            ],
                          )
                        ],
                      ),
                    ));
          },
          icon: Icons.logout,
        ),
      ),
    );
  }
}
