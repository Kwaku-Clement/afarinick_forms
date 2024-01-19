
class HarvestFields {
  static final List<String> values = [
    /// Add all fields
    id,
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
    time,
  ];
  static const String time = 'time';
  static const String id = '_id';
  static const String soil_sawdust = 'soil_sawdust';
  static const String comment = 'comment';
  static const String sand_sawdust = 'sand_sawdust';
  static const String transplanted_cluster_code = 'transplanted_cluster_code';
  static const String nursery_bags_requested = 'nursery_bags_requested';
  static const String nursery_bags_filled = 'nursery_bags_filled';
  static const String clusters_arranged = 'clusters_arranged';
  static const String box_code = 'box_code';
  static const String harvested = 'harvested';
  static const String loss_quantity = 'loss_quantity';
  static const String seedlings_cluster = 'seedlings_cluster';
}

class Harvest {
  final int? id;
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

  const Harvest({
    this.id,
    required this.createdTime,
    required this.comment,
    required this.nursery_bags_requested,
    required this.transplanted_cluster_code,
    required this.seedlings_cluster,
    required this.nursery_bags_filled,
    required this.clusters_arranged,
    required this.box_code,
    required this.harvested,
    required this.loss_quantity,
    required this.soil_sawdust,
    required this.sand_sawdust,
  });

  Harvest copy({
    int? id,
    String? nursery_bags_requested,
    String? comment,
    String? createdTime,
    String? transplanted_cluster_code,
    String? seedlings_cluster,
    String? nursery_bags_filled,
    String? clusters_arranged,
    String? box_code,
    String? harvested,
    String? loss_quantity,
    String? soil_sawdust,
    String? sand_sawdust,
  }) =>
      Harvest(
        id: id ?? this.id,
        soil_sawdust: this.soil_sawdust,
        comment: this.comment,
        nursery_bags_requested: this.nursery_bags_requested,
        nursery_bags_filled: this.nursery_bags_filled,
        clusters_arranged: this.clusters_arranged,
        box_code: this.box_code,
        harvested: this.harvested,
        loss_quantity: this.loss_quantity,
        sand_sawdust: this.sand_sawdust,
        transplanted_cluster_code: this.transplanted_cluster_code,
        seedlings_cluster: this.seedlings_cluster,
        createdTime: this.createdTime,
      );

  static Harvest fromJson(Map<String, Object?> json) => Harvest(
        id: json[HarvestFields.id] as int?,
    createdTime: DateTime.parse(json[HarvestFields.time] as String),
    soil_sawdust: json[HarvestFields.soil_sawdust] as String,
    comment: json[HarvestFields.comment] as String,
    nursery_bags_requested:
    json[HarvestFields.nursery_bags_requested] as String,
    nursery_bags_filled:
    json[HarvestFields.nursery_bags_filled] as String,
    clusters_arranged: json[HarvestFields.clusters_arranged] as String,
    box_code: json[HarvestFields.box_code] as String,
    harvested: json[HarvestFields.harvested] as String,
    loss_quantity: json[HarvestFields.loss_quantity] as String,
    sand_sawdust: json[HarvestFields.sand_sawdust] as String,
    transplanted_cluster_code:
    json[HarvestFields.transplanted_cluster_code] as String,
    seedlings_cluster: json[HarvestFields.seedlings_cluster] as String,
  );

  Map<String, Object?> toJson() => {
    HarvestFields.id: id,
    HarvestFields.soil_sawdust: soil_sawdust,
    HarvestFields.comment: comment,
    HarvestFields.nursery_bags_requested: nursery_bags_requested,
    HarvestFields.nursery_bags_filled: nursery_bags_filled,
    HarvestFields.clusters_arranged: clusters_arranged,
    HarvestFields.box_code: box_code,
    HarvestFields.harvested: harvested,
    HarvestFields.loss_quantity: loss_quantity,
    HarvestFields.sand_sawdust: sand_sawdust,
    HarvestFields.transplanted_cluster_code: transplanted_cluster_code,
    HarvestFields.seedlings_cluster: seedlings_cluster,
    HarvestFields.time: createdTime.toIso8601String(),
  };
}
