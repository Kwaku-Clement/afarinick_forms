part of 'harvest_bloc.dart';

abstract class HarvestEvent extends Equatable {
  const HarvestEvent();
}

class AddHarvest extends HarvestEvent {
  final String soil_sawdust;
  final String sand_sawdust;
  final String comment;
  final String nursery_bags_requested;
  final String nursery_bags_filled;
  final String clusters_arranged;
  final String box_code;
  final String harvested;
  final String loss_quantity;
  final String transplanted_cluster_code;
  final String seedlings_cluster;
  final DateTime createdTime;

  const AddHarvest(
      {required this.soil_sawdust,
        required this.sand_sawdust,
        required this.comment,
        required this.nursery_bags_requested,
        required this.nursery_bags_filled,
        required this.clusters_arranged,
        required this.box_code,
        required this.harvested,
        required this.loss_quantity,
        required this.transplanted_cluster_code,
        required this.seedlings_cluster,
        required this.createdTime});

  @override
  List<Object?> get props => [
    soil_sawdust,
    comment,
    nursery_bags_requested,
    nursery_bags_filled,
    clusters_arranged,
    box_code,
    harvested,
    loss_quantity,
    sand_sawdust,
    transplanted_cluster_code,
    seedlings_cluster,
    createdTime
  ];
}

class UpdateHarvest extends HarvestEvent {
  final Harvest harvest;
  const UpdateHarvest({required this.harvest});
  @override
  List<Object?> get props => [harvest];
}

class FetchHarvests extends HarvestEvent {
  const FetchHarvests();

  @override
  List<Object?> get props => [];
}

class FetchSpecificHarvest extends HarvestEvent {
  final int id;
  const FetchSpecificHarvest({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteHarvest extends HarvestEvent {
  final int id;
  const DeleteHarvest({required this.id});
  @override
  List<Object?> get props => [id];
}
