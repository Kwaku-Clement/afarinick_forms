part of 'propagation_bloc.dart';

abstract class PropagationEvent extends Equatable {
  const PropagationEvent();
}

class AddPropagation extends PropagationEvent {
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

  AddPropagation(
      {required this.truck_number,
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

  @override
  List<Object?> get props => [
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
        createdTime
      ];
}

class UpdatePropagation extends PropagationEvent {
  final Propagation propagation;
  const UpdatePropagation({required this.propagation});
  @override
  List<Object?> get props => [propagation];
}

class FetchPropagation extends PropagationEvent {
  const FetchPropagation();

  @override
  List<Object?> get props => [];
}

class FetchSpecificPropagation extends PropagationEvent {
  final int id;
  const FetchSpecificPropagation({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeletePropagation extends PropagationEvent {
  final int id;
  const DeletePropagation({required this.id});
  @override
  List<Object?> get props => [id];
}
