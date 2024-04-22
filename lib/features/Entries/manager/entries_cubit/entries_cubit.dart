import 'dart:async';
import 'package:bmi_task/features/Entries/manager/entries_cubit/entries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EntriesCubit extends Cubit<EntriesState>{
  EntriesCubit() : super (EntriesInitial());

  static EntriesCubit get(context) => BlocProvider.of(context);
  CollectionReference entries =
  FirebaseFirestore.instance.collection('entries');

  DocumentSnapshot? lastDocument;
  final int batchSize = 10;
  late List<DocumentSnapshot> documents = [];
  QuerySnapshot? querySnapshot;
  StreamSubscription<QuerySnapshot>? subscription;
  void startRealtimeUpdates() {
    // Ensure subscription is canceled before starting a new one
    subscription?.cancel();

    subscription = FirebaseFirestore.instance
        .collection('entries')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      if (snapshot.docs.isNotEmpty) {
        // Update documents only if snapshot has data
        documents = snapshot.docs;
        emit(EntriesSuccess(documents: documents));
      } else {
        // Handle case where snapshot is empty
        emit(EntriesFailure(errorMessage: 'No data available'));
      }
    }, onError: (error) {
      // Handle Firebase errors
      emit(EntriesFailure(errorMessage: 'Error fetching data: $error'));
    });
  }

  void fetchNextPage() {
    if (documents.isEmpty) return; // No more data to fetch
    final Query query = FirebaseFirestore.instance
        .collection('entries')
        .orderBy('createdAt') // Add your orderBy field here
        .startAfterDocument(documents.last)
        .limit(batchSize);

    query.get().then((QuerySnapshot snapshot) {
      documents.addAll(snapshot.docs);
      emit(EntriesSuccess(documents: documents));
    }).catchError((error) {
      emit(EntriesFailure(errorMessage: 'Error fetching next page'));
    });
  }

  Future<void> deleteEntry({required String docID}) async {
    emit(DeleteEntryLoading());
    try {
      FirebaseFirestore.instance
          .collection('entries').doc(docID).delete()
          .then((doc) => print('Document deleted'),
        onError: (e) => print("Error updating document $e"),
      );
      emit(DeleteEntrySuccess());
    }
    on Exception catch (e) {
      emit(DeleteEntryFailure(errorMessage: 'Something went wrong'));
    }
  }

}