import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'nursery_database.dart';
import 'nursery_model.dart';
part 'nursery_event.dart';
part 'nursery_state.dart';

class NurseryBloc extends Bloc<NurseryEvent, NurseryState> {
  NurseryBloc() : super(NurseryInitial()) {
    List<Nursery> nurserys = [];
    on<AddNursery>((event, emit) async {
      await NurseryDatabase.instance.create(
        Nursery(
          createdTime: event.createdTime,
          staff_contact: event.staff_contact,
          staff_name: event.staff_name,
          date_capturing: event.date_capturing,
          nursery_name: event.nursery_name,
          sector_name: event.sector_name,
          decapitation: event.decapitation,
          watering: event.watering,
          mulching: event.mulching,
          rearrangement: event.rearrangement,
          fertilisation: event.fertilisation,
          fungicide: event.fungicide,
          insecticide: event.insecticide,
          seedlings: event.seedlings,
          leafcutting: event.leafcutting,
          weeding: event.weeding,
          segment: event.segment,
          cluster_id: event.cluster_id,
          decapitation_comments: event.decapitation_comments,
          watering_comments: event.watering_comments,
          mulching_comments: event.mulching_comments,
          rearrangement_comments: event.rearrangement_comments,
          fertilisation_comments: event.fertilisation_comments,
          fungicide_comments: event.fungicide_comments,
          insecticide_comments: event.insecticide_comments,
          seedlings_comments: event.seedlings_comments,
          leafcutting_comments: event.leafcutting_comments,
          weeding_comments: event.weeding_comments,
          observation: event.observation,
        ),
      );
    });

    on<UpdateNursery>((event, emit) async {
      await NurseryDatabase.instance.update(
        harvest: event.nursery,
      );
    });

    on<FetchNursery>((event, emit) async {
      nurserys = await NurseryDatabase.instance.readAllHarvests();
      emit(DisplayNursery(nursery: nurserys));
    });

    on<FetchSpecificNursery>((event, emit) async {
      Nursery harvest =
          await NurseryDatabase.instance.readHarvest(id: event.id);
      emit(DisplaySpecificNursery(nursery: harvest));
    });

    on<DeleteNursery>((event, emit) async {
      await NurseryDatabase.instance.delete(id: event.id);
      add(const FetchNursery());
    });
  }
}
