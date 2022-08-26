import 'package:shoping_e_commerce/features/google_map/services/repositiories/google_map_repo_impl.dart';

class LocationServicePermissionUseCase {
  final GoogleMapRepoImpl googleMapRepoImpl;

  LocationServicePermissionUseCase({required this.googleMapRepoImpl});
  Future<bool> call() async {
    return await googleMapRepoImpl.locationServicePermission();
  }
}
