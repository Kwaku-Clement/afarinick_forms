part of 'nursery_bloc.dart';

abstract class NurseryState extends Equatable {
  const NurseryState();
}

class NurseryInitial extends NurseryState {
  @override
  List<Object> get props => [];
}

class DisplayNursery extends NurseryState {
  final List<Nursery> nursery;

  const DisplayNursery({required this.nursery});
  @override
  List<Object> get props => [nursery];
}

class DisplaySpecificNursery extends NurseryState {
  final Nursery nursery;

  const DisplaySpecificNursery({required this.nursery});
  @override
  List<Object> get props => [nursery];
}
