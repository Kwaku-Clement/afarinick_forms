
class NurseryFields {
  static final List<String> values = [
    /// Add all fields
    id,
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
    time,
  ];
  static const String time = 'time';
  static const String id = '_id';
  static const String staff_contact = 'staff_contact';
  static const String staff_name = 'staff_name';
  static const String date_capturing = 'date_capturing';
  static const String nursery_name = 'nursery_name';
  static const String sector_name = 'sector_name';
  static const String decapitation = 'decapitation';
  static const String watering = 'watering';
  static const String mulching = 'mulching';
  static const String rearrangement = 'rearrangement';
  static const String fertilisation = 'fertilisation';
  static const String fungicide = 'fungicide';
  static const String insecticide = 'insecticide';
  static const String seedlings = 'seedlings';
  static const String leafcutting = 'leafcutting';
  static const String weeding = 'weeding';
  static const String segment = 'segment';
  static const String cluster_id = 'cluster_id';
  static const String decapitation_comments = 'decapitation_comments';
  static const String watering_comments = 'watering_comments';
  static const String mulching_comments = 'mulching_comments';
  static const String rearrangement_comments = 'rearrangement_comments';
  static const String fertilisation_comments = 'fertilisation_comments';
  static const String fungicide_comments = 'fungicide_comments';
  static const String insecticide_comments = 'insecticide_comments';
  static const String seedlings_comments = 'seedlings_comments';
  static const String leafcutting_comments = 'leafcutting_comments';
  static const String weeding_comments = 'weeding_comments';
  static const String observation = 'observation';
}

class Nursery {
  final int? id;
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

  Nursery(
      {this.id,
        required this.staff_contact,
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

  Nursery copy({
    int? id,
    String? staff_contact,
    String? staff_name,
    String? date_capturing,
    String? nursery_name,
    String? sector_name,
    String? decapitation,
    String? watering,
    String? mulching,
    String? createdTime,
    String? rearrangement,
    String? fertilisation,
    String? fungicide,
    String? insecticide,
    String? seedlings,
    String? leafcutting,
    String? weeding,
    String? segment,
    String? cluster_id,
    String? decapitation_comments,
    String? watering_comments,
    String? mulching_comments,
    String? rearrangement_comments,
    String? fertilisation_comments,
    String? fungicide_comments,
    String? insecticide_comments,
    String? seedlings_comments,
    String? leafcutting_comments,
    String? weeding_comments,
    String? observation,
  }) =>
      Nursery(
        id: id ?? this.id,
        staff_contact: this.staff_contact,
        staff_name: this.staff_name,
        date_capturing: this.date_capturing,
        nursery_name: this.nursery_name,
        sector_name: this.sector_name,
        decapitation: this.decapitation,
        watering: this.watering,
        mulching: this.mulching,
        rearrangement: this.rearrangement,
        fertilisation: this.fertilisation,
        fungicide: this.fungicide,
        insecticide: this.insecticide,
        seedlings: this.seedlings,
        leafcutting: this.leafcutting,
        weeding: this.weeding,
        segment: this.segment,
        cluster_id: this.cluster_id,
        decapitation_comments: this.decapitation_comments,
        watering_comments: this.watering_comments,
        mulching_comments: this.mulching_comments,
        rearrangement_comments: this.rearrangement_comments,
        fertilisation_comments: this.fertilisation_comments,
        fungicide_comments: this.fungicide_comments,
        insecticide_comments: this.insecticide_comments,
        seedlings_comments: this.seedlings_comments,
        leafcutting_comments: this.leafcutting_comments,
        weeding_comments: this.weeding_comments,
        observation: this.observation,
        createdTime: this.createdTime,
      );

  static Nursery fromJson(Map<String, Object?> json) => Nursery(
    id: json[NurseryFields.id] as int?,
    createdTime: DateTime.parse(json[NurseryFields.time] as String),
    staff_contact: json[NurseryFields.staff_contact] as String,
    staff_name: json[NurseryFields.staff_name] as String,
    date_capturing: json[NurseryFields.date_capturing] as String,
    nursery_name: json[NurseryFields.nursery_name] as String,
    sector_name: json[NurseryFields.sector_name] as String,
    decapitation: json[NurseryFields.decapitation] as String,
    watering: json[NurseryFields.watering] as String,
    mulching: json[NurseryFields.mulching] as String,
    rearrangement: json[NurseryFields.rearrangement] as String,
    fertilisation: json[NurseryFields.fertilisation] as String,
    fungicide: json[NurseryFields.fungicide] as String,
    insecticide: json[NurseryFields.insecticide] as String,
    seedlings: json[NurseryFields.seedlings] as String,
    leafcutting: json[NurseryFields.leafcutting] as String,
    weeding: json[NurseryFields.weeding] as String,
    segment: json[NurseryFields.segment] as String,
    cluster_id: json[NurseryFields.cluster_id] as String,
    decapitation_comments:
    json[NurseryFields.decapitation_comments] as String,
    watering_comments: json[NurseryFields.watering_comments] as String,
    mulching_comments: json[NurseryFields.mulching_comments] as String,
    rearrangement_comments:
    json[NurseryFields.rearrangement_comments] as String,
    fertilisation_comments: json[NurseryFields.fertilisation_comments] as String,
    fungicide_comments: json[NurseryFields.fungicide_comments] as String,
    insecticide_comments: json[NurseryFields.insecticide_comments] as String,
    seedlings_comments: json[NurseryFields.seedlings_comments] as String,
    leafcutting_comments: json[NurseryFields.leafcutting_comments] as String,
    weeding_comments: json[NurseryFields.weeding_comments] as String,
    observation: json[NurseryFields.observation] as String,
  );

  Map<String, Object?> toJson() => {
    NurseryFields.id: id,
    NurseryFields.staff_contact: staff_contact,
    NurseryFields.staff_name: staff_name,
    NurseryFields.date_capturing: date_capturing,
    NurseryFields.nursery_name: nursery_name,
    NurseryFields.sector_name: sector_name,
    NurseryFields.decapitation: decapitation,
    NurseryFields.watering: watering,
    NurseryFields.mulching: mulching,
    NurseryFields.rearrangement: rearrangement,
    NurseryFields.fertilisation: fertilisation,
    NurseryFields.time: createdTime.toIso8601String(),
    NurseryFields.fungicide: fungicide,
    NurseryFields.insecticide: insecticide,
    NurseryFields.seedlings: seedlings,
    NurseryFields.leafcutting: leafcutting,
    NurseryFields.weeding: weeding,
    NurseryFields.mulching_comments: mulching_comments,
    NurseryFields.segment: segment,
    NurseryFields.cluster_id: cluster_id,
    NurseryFields.decapitation_comments: decapitation_comments,
    NurseryFields.watering_comments: watering_comments,
    NurseryFields.rearrangement_comments: rearrangement_comments,
    NurseryFields.fertilisation_comments: fertilisation_comments,
    NurseryFields.fungicide_comments: fungicide_comments,
    NurseryFields.insecticide_comments: insecticide_comments,
    NurseryFields.seedlings_comments: seedlings_comments,
    NurseryFields.leafcutting_comments: leafcutting_comments,
    NurseryFields.weeding_comments: weeding_comments,
    NurseryFields.observation: observation,
  };
}
