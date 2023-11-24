import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mars_photos/Data/Models/Model.dart';
import 'package:mars_photos/Data/Repos/Repo.dart';

part 'marsphotobloc_state.dart';

class MarsphotoblocCubit extends Cubit<MarsphotoblocState> {
  final Repo repo;
  MarsphotoblocCubit({required this.repo}) : super(MarsphotoblocInitial()) {
    fetchRoverData();
  }

  Future fetchRoverData() async {
    emit(
      MarsphotoblocRoverLoading(),
    );
    await repo.fetchCuriosityData();

    emit(
      MarsphotoblocRoverLoaded(),
    );
  }

  Future fetchDatePhotoData(DateTime? datetime) async {
    
    emit(
      MarsphotoblocLoading(),
    );
    List<Marsphoto> listFromCuibt = datetime != null
        ? await repo.fetchPhotoByEarthDate(datetime)
        : await repo.fetchPhoto();

    emit(
      MarsphotoblocLoaded(
        listFromCuibt: listFromCuibt,
      ),
    );
  }
}
