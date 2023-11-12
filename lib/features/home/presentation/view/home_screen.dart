import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/core/components/custom_text_form_field.dart';
import 'package:hotelsgo_task/core/service_locator/service_locator.dart';
import 'package:hotelsgo_task/features/home/presentation/manager/get_hotels_data_cubit/get_hotels_data_cubit.dart';
import 'package:hotelsgo_task/features/home/presentation/view/widgets/filtering_bottom_sheet.dart';
import 'package:hotelsgo_task/features/home/presentation/view/widgets/hotel%20item.dart';
import 'package:hotelsgo_task/features/home/presentation/view/widgets/sorting_items_bottom_sheet.dart';
import '../../domain/use_cases/get_hotels_data_use_case.dart';
import '../manager/get_hotels_data_cubit/get_hotels_data_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetHotelsDataCubit(serviceLocator<GetHotelsDataUseCase>())
            ..getHotelsData(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      const CustomTextFormField(
                        label: 'Search For Hotel',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocBuilder<GetHotelsDataCubit, GetHotelsDataStates>(
                        builder: (context, state) {
                          if (state is GetHotelsDataSuccessfullyState) {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => HotelItem(
                                hotel: state.hotels[index],
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20.h,
                              ),
                              itemCount: state.hotels.length,
                            );
                          }
                          if (state is GetHotelsDataErrorState) {
                            return Center(
                              child: Text(
                                state.error,
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 3,
                          blurRadius: 10),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return const FilteringBottomSheet();
                              },
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_list,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Filters',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return const SortingItemsBottomSheet();
                              },
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sort,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sort',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
