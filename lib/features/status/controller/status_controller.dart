
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statusControllerProvider = Provider((ref){final statusRepository = ref.read(statusRepository);

  return StatusController(statusRepository:statusRepository,ref:ref,);
});


class StatusController{
  final StatusRepository statusRepository,
  final ProviderRef ref;
  StateController({
    required this.statusRepository,
    required this.ref
});


}