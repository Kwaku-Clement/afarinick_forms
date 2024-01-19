part of 'propagation_bloc.dart';

abstract class PropagationState extends Equatable {
  const PropagationState();
}

class PropagationInitial extends PropagationState {
  @override
  List<Object> get props => [];
}

class DisplayPropagation extends PropagationState {
  final List<Propagation> propagation;

  const DisplayPropagation({required this.propagation});
  @override
  List<Object> get props => [propagation];
}

class DisplaySpecificPropagation extends PropagationState {
  final Propagation propagation;

  const DisplaySpecificPropagation({required this.propagation});
  @override
  List<Object> get props => [propagation];
}
