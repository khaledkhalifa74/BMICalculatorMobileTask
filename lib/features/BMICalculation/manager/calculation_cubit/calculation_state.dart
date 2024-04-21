abstract class CalculationState{}

class CalculationInitial extends CalculationState{}

class CalculationLoading extends CalculationState{}

class CalculationSuccess extends CalculationState{}

class CalculationFailure extends CalculationState{
  String errorMessage;
  CalculationFailure({required this.errorMessage});
}