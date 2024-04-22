import 'package:cloud_firestore/cloud_firestore.dart';

abstract class EntriesState{}

class EntriesInitial extends EntriesState{}

class EntriesLoading extends EntriesState{}

class EntriesSuccess extends EntriesState{
  List<DocumentSnapshot> documents;
  EntriesSuccess({required this.documents});
}

class EntriesFailure extends EntriesState{
  String errorMessage;
  EntriesFailure({required this.errorMessage});
}

class DeleteEntryLoading extends EntriesState{}

class DeleteEntrySuccess extends EntriesState{}

class DeleteEntryFailure extends EntriesState{
  String errorMessage;
  DeleteEntryFailure({required this.errorMessage});
}
