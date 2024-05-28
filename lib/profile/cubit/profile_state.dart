part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  error,
  loadingPending,
  loadingActive,
  loadingBoard,
  loadingDisabled,
  loadingRejected,
  loadingPlaces
}

/// {@template history}
/// HistoryState description
/// {@endtemplate}
class ProfileState extends Equatable {
  /// {@macro history}
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.message = '',
    this.places=const[],
 
  });

  final ProfileStatus status;
 
  final String message;
final List<Places>places;

  bool get isLoading => status == ProfileStatus.loading;
  bool get loadingPending => status == ProfileStatus.loadingPending;
  bool get loadingActive => status == ProfileStatus.loadingActive;
  bool get loadingBorad => status == ProfileStatus.loadingBoard;
  bool get loadingDisabled => status == ProfileStatus.loadingDisabled;
  bool get loadingRejected => status == ProfileStatus.loadingRejected;
  bool get loadingPlaces => status == ProfileStatus.loadingPlaces;


  @override
  List<Object> get props => [
        status,
        message,
        places,
       
      ];

  /// Creates a copy of the current HistoryState with property changes
  ProfileState copyWith({
    ProfileStatus? status,
    String? message,
    List<Places>?places,
   
  }) {
    return ProfileState(
      status: status ?? this.status,
      message: message ?? this.message,
      places: places?? this.places,
     
    );
  }
}
