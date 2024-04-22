import 'package:bmi_task/features/Entries/presentation/views/widgets/entries_view_body.dart';
import 'package:flutter/material.dart';

class EntriesView extends StatelessWidget {
  const EntriesView({super.key});
  static String id = "EntriesView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EntriesViewBody(),
    );
  }
}
