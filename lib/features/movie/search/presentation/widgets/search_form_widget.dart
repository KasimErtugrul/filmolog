import 'package:filmolog/features/movie/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageFormWidget extends StatefulWidget {
  const SearchPageFormWidget({
    super.key,
  });

  @override
  State<SearchPageFormWidget> createState() => _SearchPageFormWidgetState();
}

class _SearchPageFormWidgetState extends State<SearchPageFormWidget> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
              context.read()<SearchBloc>().add(
                    FetchSearchMulti(controller.text),
                  );
            },
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.blue,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onChanged: (value) {
          context.read<SearchBloc>().add(FetchSearchMulti(value));
        },
      ),
    );
  }
}
