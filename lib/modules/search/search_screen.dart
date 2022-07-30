import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var list = AppCubit.get(context).search;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: defultTextFormField(
                      controller: searchController,
                      TextInputType: TextInputType.text,
                      validatorText: '',
                      hintText: 'search...',
                      prefixIcon: Icons.search,
                      onChanged: (value) {
                        cubit.getSearchData(value);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: articleBuilder(list),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
