import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/dependency_injection/dependency_injection.dart';
import 'package:beyond_the_stars/core/widgets/empty_search_widget.dart';
import 'package:beyond_the_stars/features/ships/logic/ships_bloc/ships_bloc.dart';
import 'package:beyond_the_stars/features/ships/ui/widgets/go_back_button.dart';
import 'package:beyond_the_stars/features/ships/ui/widgets/ship_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  bool isSearchActive = false;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ShipsBloc>()..add(LoadShipsEvent()),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: isSearchActive
              ? Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    initialValue: searchText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (searchText != '') {
                                setState(() {
                                  isSearchActive = false;
                                });
                              } else {
                                setState(() {
                                  isSearchActive = false;
                                  searchText = '';
                                });
                              }
                            },
                            icon: const Icon(Icons.close)),
                        hintText: 'Search ships',
                        contentPadding: const EdgeInsets.all(8),
                        filled: true,
                        fillColor: const Color(0xff424F66),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                )
              : FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      isSearchActive = !isSearchActive;
                    });
                  },
                  backgroundColor: const Color(0xff424F66),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
          body: SafeArea(
            child: Stack(
              children: [
                BlocBuilder<ShipsBloc, ShipsState>(
                  builder: (context, state) {
                    if (state is LoadShipsSuccess) {
                      final ships = state.ships;
                      final filterdShips = ships
                          .where((ship) =>
                              ship.name
                                  ?.toLowerCase()
                                  .contains(searchText.toLowerCase()) ??
                              false)
                          .toList();
                      return filterdShips.isEmpty
                          ? const EmptySearchWidget()
                          : ListView.builder(
                              itemBuilder: (context, index) => ShipCard(
                                ship: filterdShips[index],
                              ),
                              itemCount: filterdShips.length,
                            );
                    } else if (state is LoadShipsFailed) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: AppTextStyles.style20W600,
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return const Center(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: SpinKitWave(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const Positioned(left: 16, child: GoBackButton())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
