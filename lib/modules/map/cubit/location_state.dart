part of 'location_cubit.dart';

enum LocationStatus { initial, loading, success, failure }

class LocationState extends Equatable {
  final LocationStatus locationStatus;
  final Placemark? address;
  final double? lat;
  final double? long;

  final String? exception;
  const LocationState(
      {this.exception,
      this.locationStatus = LocationStatus.initial,
      this.lat,
      this.long,
      this.address});
  @override
  List<Object?> get props => [locationStatus, exception, address, lat, long];
  LocationState copyWith(
      {LocationStatus? locationStatus,
      String? exception,
      Placemark? address,
      double? lat,
      double? long}) {
    return LocationState(
        exception: exception ?? this.exception,
        address: address ?? this.address,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        locationStatus: locationStatus ?? LocationStatus.loading);
  }
}
