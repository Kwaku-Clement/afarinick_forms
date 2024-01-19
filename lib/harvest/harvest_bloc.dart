import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'harvest_database.dart';
import 'harvest_model.dart';
part 'harvest_event.dart';
part 'harvest_state.dart';

class HarvestBloc extends Bloc<HarvestEvent, HarvestState> {
  HarvestBloc() : super(HarvestInitial()) {
    List<Harvest> harvests = [];
    on<AddHarvest>((event, emit) async {
      await HarvestingDatabase.instance.create(
        Harvest(
          createdTime: event.createdTime,
          soil_sawdust: event.soil_sawdust,
          sand_sawdust: event.sand_sawdust,
          comment: event.comment,
          transplanted_cluster_code: event.transplanted_cluster_code,
          nursery_bags_requested: event.nursery_bags_requested,
          nursery_bags_filled: event.nursery_bags_filled,
          box_code: event.box_code,
          clusters_arranged: event.clusters_arranged,
          harvested: event.harvested,
          loss_quantity: event.loss_quantity,
          seedlings_cluster: event.seedlings_cluster,
        ),
      );
    });

    on<UpdateHarvest>((event, emit) async {
      await HarvestingDatabase.instance.update(
        harvest: event.harvest,
      );
    });

    on<FetchHarvests>((event, emit) async {
      harvests = await HarvestingDatabase.instance.readAllHarvests();
      emit(DisplayHarvests(harvest: harvests));
    });

    on<FetchSpecificHarvest>((event, emit) async {
      Harvest harvest =
          await HarvestingDatabase.instance.readHarvest(id: event.id);
      emit(DisplaySpecificHarvest(harvest: harvest));
    });

    on<DeleteHarvest>((event, emit) async {
      await HarvestingDatabase.instance.delete(id: event.id);
      add(const FetchHarvests());
    });
  }
}
