import 'package:bmi_task/core/widgets/custom_loading_indicator.dart';
import 'package:bmi_task/features/Entries/manager/entries_cubit/entries_cubit.dart';
import 'package:bmi_task/features/Entries/manager/entries_cubit/entries_state.dart';
import 'package:bmi_task/features/Entries/presentation/views/widgets/entry_item.dart';
import 'package:bmi_task/features/Entries/presentation/views/widgets/no_items_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntriesViewBody extends StatefulWidget {
  const EntriesViewBody({super.key});

  @override
  State<EntriesViewBody> createState() => _EntriesViewBodyState();
}

class _EntriesViewBodyState extends State<EntriesViewBody> {
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  late EntriesCubit _entriesCubit;

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Reached the bottom of the list
      _entriesCubit.fetchNextPage(); // Fetch next page of entries
    }
  }

  @override
  void initState() {
    super.initState();
    _entriesCubit = context.read<EntriesCubit>();
    _entriesCubit.startRealtimeUpdates();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntriesCubit, EntriesState>(builder: (context, state) {
      if (state is EntriesLoading && _entriesCubit.documents.isEmpty) {
        return const CustomLoadingIndicator();
      } else if (state is EntriesSuccess) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: state.documents.length + 1,
                        itemBuilder: (context, index) {
                          if (index < state.documents.length) {
                            final documentData = state.documents[index].data()
                                as Map<String, dynamic>?;
                            final docID = state.documents[index].id;
                            if (documentData != null) {
                              final height = documentData['height']?.toString() ??
                                      '';
                              final weight = documentData['weight']?.toString() ??
                                  '';
                              final age = documentData['age']?.toString() ??
                                  '';
                              final bmi = documentData['bmi']?.toString() ??
                                  '';
                              return EntryItem(
                                  height: height, weight: weight,
                                  age: age, bmi: bmi,
                                  deleteOnPressed: (){
                                    EntriesCubit.get(context).deleteEntry(docID: docID);
                                    _entriesCubit.startRealtimeUpdates();
                                  },
                              );
                            }
                            else {
                              return const SizedBox();
                            }
                          }
                          else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
            ],
          ),
        );
      } else {
        return const NoItemsFound();
      }
    });
  }
}
