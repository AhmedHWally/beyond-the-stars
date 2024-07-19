import 'package:beyond_the_stars/features/edit_profile/logic/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserNameForm extends StatelessWidget {
  const EditUserNameForm({
    super.key,
    required this.profile,
  });

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: context.read<EditProfileBloc>().formKey,
        child: TextFormField(
          initialValue: profile.name,
          onChanged: (value) {
            context.read<EditProfileBloc>().name = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'We don\'t accept empty names';
            }
            return null;
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff424F66),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
