import 'package:bmi_task/features/BMICalculation/manager/calculation_cubit/calculation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi_task/core/utils/globals.dart' as globals;


class CalculationCubit extends Cubit<CalculationState>{
  CalculationCubit() : super (CalculationInitial());

  static CalculationCubit get(context) => BlocProvider.of(context);

  Future<void> addEntry({required String height, required String weight, required String age, required String bmi}) async {
    emit(CalculationLoading());
    try {
      final data = {"height": height, "weight": weight, "age": age, "bmi": bmi};
      await FirebaseFirestore.instance
          .collection('entries')
          .doc(globals.userId)
          .set(data);
      emit(CalculationSuccess());
    }
    on Exception catch (e) {
      emit(CalculationFailure(errorMessage: 'Something went wrong'));
    }
  }
}