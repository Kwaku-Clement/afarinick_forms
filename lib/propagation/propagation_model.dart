
class PropagationFields {
  static final List<String> values = [
    /// Add all fields
    id,
    truck_number,
    date_reception,
    waybill_quantity,
    suppliers_name,
    suckers_received,
    box_code,
    suckers_pared,
    standard_sized_corms,
    bull_head_corms,
    rejected_corms,
    boxes_generated,
    source_location,
    corms_buried,
    individual_corm_box,
    undersized_corms,
    time,
  ];
  static const String time = 'time';
  static const String id = '_id';
  static const String truck_number = 'truck_number';
  static const String date_reception = 'date_reception';
  static const String waybill_quantity = 'waybill_quantity';
  static const String suppliers_name = 'suppliers_name';
  static const String suckers_received = 'suckers_received';
  static const String suckers_pared = 'suckers_pared';
  static const String standard_sized_corms = 'standard_sized_corms';
  static const String box_code = 'box_code';
  static const String bull_head_corms = 'bull_head_corms';
  static const String rejected_corms = 'rejected_corms';
  static const String boxes_generated = 'boxes_generated';
  static const String source_location = 'source_location';
  static const String corms_buried = 'corms_buried';
  static const String individual_corm_box = 'individual_corm_box';
  static const String undersized_corms = 'undersized_corms';
}

class Propagation {
  final int? id;
  final String truck_number;
  final String source_location;
  final String date_reception;
  final String suppliers_name;
  final String waybill_quantity;
  final String suckers_received;
  final String suckers_pared;
  final String box_code;
  final String standard_sized_corms;
  final String bull_head_corms;
  final String undersized_corms;
  final String rejected_corms;
  final String corms_buried;
  final String boxes_generated;
  final String individual_corm_box;
  final DateTime createdTime;

  Propagation(
      { this.id,
      required this.truck_number,
      required this.source_location,
      required this.date_reception,
      required this.suppliers_name,
      required this.waybill_quantity,
      required this.suckers_received,
      required this.suckers_pared,
      required this.box_code,
      required this.standard_sized_corms,
      required this.bull_head_corms,
      required this.undersized_corms,
      required this.rejected_corms,
      required this.corms_buried,
      required this.boxes_generated,
      required this.individual_corm_box,
      required this.createdTime});

  Propagation copy({
    int? id,
    String? createdTime,
    String? truck_number,
    String? source_location,
    String? date_reception,
    String? waybill_quantity,
    String? suppliers_name,
    String? suckers_received,
    String? box_code,
    String? suckers_pared,
    String? standard_sized_corms,
    String? bull_head_corms,
    String? rejected_corms,
    String? corms_buried,
    String? boxes_generated,
    String? individual_corm_box,
    String? undersized_corms,
  }) =>
      Propagation(
        id: id ?? this.id,
        truck_number: this.truck_number,
        source_location: this.source_location,
        date_reception: this.date_reception,
        waybill_quantity: this.waybill_quantity,
        suppliers_name: this.suppliers_name,
        box_code: this.box_code,
        suckers_received: this.suckers_received,
        suckers_pared: this.suckers_pared,
        standard_sized_corms: this.standard_sized_corms,
        bull_head_corms: this.bull_head_corms,
        rejected_corms: this.rejected_corms,
        createdTime: this.createdTime,
        corms_buried: this.corms_buried,
        boxes_generated: this.boxes_generated,
        individual_corm_box: this.individual_corm_box,
        undersized_corms: this.undersized_corms,
      );

  static Propagation fromJson(Map<String, Object?> json) => Propagation(
        id: json[PropagationFields.id] as int?,
        createdTime: DateTime.parse(json[PropagationFields.time] as String),
        truck_number: json[PropagationFields.truck_number] as String,
        source_location: json[PropagationFields.source_location] as String,
        date_reception: json[PropagationFields.date_reception] as String,
        waybill_quantity: json[PropagationFields.waybill_quantity] as String,
        suppliers_name: json[PropagationFields.suppliers_name] as String,
        box_code: json[PropagationFields.box_code] as String,
        suckers_received: json[PropagationFields.suckers_received] as String,
        suckers_pared: json[PropagationFields.suckers_pared] as String,
        standard_sized_corms:
            json[PropagationFields.standard_sized_corms] as String,
        bull_head_corms: json[PropagationFields.bull_head_corms] as String,
        rejected_corms: json[PropagationFields.rejected_corms] as String,
        corms_buried: json[PropagationFields.corms_buried] as String,
        boxes_generated: json[PropagationFields.boxes_generated] as String,
        individual_corm_box:
            json[PropagationFields.individual_corm_box] as String,
        undersized_corms: json[PropagationFields.undersized_corms] as String,
      );

  Map<String, Object?> toJson() => {
        PropagationFields.id: id,
        PropagationFields.truck_number: truck_number,
        PropagationFields.source_location: source_location,
        PropagationFields.date_reception: date_reception,
        PropagationFields.waybill_quantity: waybill_quantity,
        PropagationFields.suppliers_name: suppliers_name,
        PropagationFields.box_code: box_code,
        PropagationFields.suckers_received: suckers_received,
        PropagationFields.suckers_pared: suckers_pared,
        PropagationFields.standard_sized_corms: standard_sized_corms,
        PropagationFields.bull_head_corms: bull_head_corms,
        PropagationFields.rejected_corms: rejected_corms,
        PropagationFields.time: createdTime.toIso8601String(),
        PropagationFields.corms_buried: corms_buried,
        PropagationFields.boxes_generated: boxes_generated,
        PropagationFields.individual_corm_box: individual_corm_box,
        PropagationFields.undersized_corms: undersized_corms,
      };
}
