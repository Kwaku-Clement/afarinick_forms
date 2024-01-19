part of 'nursery_bloc.dart';

abstract class NurseryEvent extends Equatable {
  const NurseryEvent();
}

class AddNursery extends NurseryEvent {
  final String staff_contact;
  final String staff_name;
  final String date_capturing;
  final String nursery_name;
  final String sector_name;
  final String decapitation;
  final String watering;
  final String mulching;
  final String rearrangement;
  final String fertilisation;
  final String fungicide;
  final String insecticide;
  final String seedlings;
  final String leafcutting;
  final String weeding;
  final String segment;
  final String cluster_id;
  final String decapitation_comments;
  final String watering_comments;
  final String mulching_comments;
  final String rearrangement_comments;
  final String fertilisation_comments;
  final String fungicide_comments;
  final String insecticide_comments;
  final String seedlings_comments;
  final String leafcutting_comments;
  final String weeding_comments;
  final String observation;
  final DateTime createdTime;

  const AddNursery(
      {required this.staff_contact,
      required this.staff_name,
      required this.date_capturing,
      required this.nursery_name,
      required this.sector_name,
      required this.decapitation,
      required this.watering,
      required this.mulching,
      required this.rearrangement,
      required this.fertilisation,
      required this.fungicide,
      required this.insecticide,
      required this.seedlings,
      required this.leafcutting,
      required this.weeding,
      required this.segment,
      required this.cluster_id,
      required this.decapitation_comments,
      required this.watering_comments,
      required this.mulching_comments,
      required this.rearrangement_comments,
      required this.fertilisation_comments,
      required this.fungicide_comments,
      required this.insecticide_comments,
      required this.seedlings_comments,
      required this.leafcutting_comments,
      required this.weeding_comments,
      required this.observation,
      required this.createdTime});

  @override
  List<Object?> get props => [
        staff_contact,
        staff_name,
        date_capturing,
        nursery_name,
        sector_name,
        decapitation,
        watering,
        mulching,
        rearrangement,
        fertilisation,
        fungicide,
        insecticide,
        seedlings,
        leafcutting,
        weeding,
        segment,
        cluster_id,
        decapitation_comments,
        watering_comments,
        mulching_comments,
        rearrangement_comments,
        fertilisation_comments,
        fungicide_comments,
        insecticide_comments,
        seedlings_comments,
        leafcutting_comments,
        weeding_comments,
        observation,
      ];
}

class UpdateNursery extends NurseryEvent {
  final Nursery nursery;
  const UpdateNursery({required this.nursery});
  @override
  List<Object?> get props => [nursery];
}

class FetchNursery extends NurseryEvent {
  const FetchNursery();

  @override
  List<Object?> get props => [];
}

class FetchSpecificNursery extends NurseryEvent {
  final int id;
  const FetchSpecificNursery({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteNursery extends NurseryEvent {
  final int id;
  const DeleteNursery({required this.id});
  @override
  List<Object?> get props => [id];
}
