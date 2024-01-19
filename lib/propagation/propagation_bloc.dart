import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'propagation_database.dart';
import 'propagation_model.dart';
part 'propagation_event.dart';
part 'propagation_state.dart';

class PropagationBloc extends Bloc<PropagationEvent, PropagationState> {
  PropagationBloc() : super(PropagationInitial()) {
    List<Propagation> harvests = [];
    on<AddPropagation>((event, emit) async {
      await PropagationDatabase.instance.create(
        Propagation(
          createdTime: event.createdTime,
          truck_number: event.truck_number,
          source_location: event.source_location,
          date_reception: event.date_reception,
          waybill_quantity: event.waybill_quantity,
          suppliers_name: event.suppliers_name,
          suckers_received: event.suckers_received,
          box_code: event.box_code,
          suckers_pared: event.suckers_pared,
          standard_sized_corms: event.standard_sized_corms,
          bull_head_corms: event.bull_head_corms,
          rejected_corms: event.rejected_corms,
          corms_buried: event.corms_buried,
          boxes_generated: event.boxes_generated,
          individual_corm_box: event.individual_corm_box,
          undersized_corms: event.undersized_corms,
        ),
      );
    });

    on<UpdatePropagation>((event, emit) async {
      await PropagationDatabase.instance.update(
        harvest: event.propagation,
      );
    });

    on<FetchPropagation>((event, emit) async {
      harvests = await PropagationDatabase.instance.readAllHarvests();
      emit(DisplayPropagation(propagation: harvests));
    });

    on<FetchSpecificPropagation>((event, emit) async {
      Propagation harvest =
          await PropagationDatabase.instance.readHarvest(id: event.id);
      emit(DisplaySpecificPropagation(propagation: harvest));
    });

    on<DeletePropagation>((event, emit) async {
      await PropagationDatabase.instance.delete(id: event.id);
      add(const FetchPropagation());
    });
  }
}
