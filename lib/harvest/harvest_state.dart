part of 'harvest_bloc.dart';

abstract class HarvestState extends Equatable {
  const HarvestState();
}

class HarvestInitial extends HarvestState {
  @override
  List<Object> get props => [];
}

class DisplayHarvests extends HarvestState {
  final List<Harvest> harvest;

  const DisplayHarvests({required this.harvest});
  @override
  List<Object> get props => [harvest];
}

class DisplaySpecificHarvest extends HarvestState {
  final Harvest harvest;

  const DisplaySpecificHarvest({required this.harvest});
  @override
  List<Object> get props => [harvest];
}
