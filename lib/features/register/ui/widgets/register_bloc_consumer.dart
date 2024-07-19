import 'package:beyond_the_stars/core/constants/strings.dart';
import 'package:beyond_the_stars/core/functions/show_toast.dart';
import 'package:beyond_the_stars/core/helpers/cache_helper.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/core/widgets/auth_button.dart';
import 'package:beyond_the_stars/features/register/logic/add_user_to_firestore_bloc.dart/add_user_to_fire_store_bloc.dart';
import 'package:beyond_the_stars/features/register/logic/register_bloc/register_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterBloc, RegisterState>(listener: (context, state) {
          if (state is RegisterSuccess) {
            AppStrings.userId = state.userModel.id;
            CacheHelper.set(key: 'userId', value: state.userModel.id);
            context
                .read<AddUserToFireStoreBloc>()
                .add(AddUserToFireStoreEvent(userModel: state.userModel));
            showToast(text: 'please verify your email address');
          } else if (state is RegisterFailure) {
            showToast(text: state.errorMessage);
          }
        }),
        BlocListener<AddUserToFireStoreBloc, AddUserToFireStoreState>(
            listener: (context, state) {
          if (state is AddUserSuccess || state is AddUserFailure) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.login, (route) => false);
          }
        })
      ],
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoading) {
            return AuthButton(
              title: 'Register',
              isLoading: true,
              onPressed: () {},
            );
          } else {
            return AuthButton(
              title: 'Register',
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (context
                    .read<RegisterBloc>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<RegisterBloc>().add(RegisterAccountEvent());
                }
              },
            );
          }
        },
      ),
    );
  }
}
