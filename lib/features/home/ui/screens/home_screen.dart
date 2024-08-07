import 'package:beyond_the_stars/features/home/ui/widgets/home_screen_body.dart';
import 'package:beyond_the_stars/features/profile/logic/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreenBody();
  }
}
