part of 'marsphotobloc_cubit.dart';

abstract class MarsphotoblocState extends Equatable {
  const MarsphotoblocState();

  @override
  List<Object> get props => [];
}

class MarsphotoblocInitial extends MarsphotoblocState {}

class MarsphotoblocLoading extends MarsphotoblocState {}

class MarsphotoblocLoaded extends MarsphotoblocState {
  final List<Marsphoto> listFromCuibt;

  MarsphotoblocLoaded({required this.listFromCuibt});
}

class MarsphotoblocEr extends MarsphotoblocState {
  final String Mess;

  MarsphotoblocEr({required this.Mess});
}
class MarsphotoblocRoverLoading extends MarsphotoblocState {}

class MarsphotoblocRoverLoaded extends MarsphotoblocState {
}

class MarsphotoblocRoverEr extends MarsphotoblocState {
  final String Mess;

  MarsphotoblocRoverEr({required this.Mess});

}
