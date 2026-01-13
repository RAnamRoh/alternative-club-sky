import 'package:domain/repository/search_ticket_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';

import '../searchticket_view_model.dart';

class SearchticketBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    SearchTicketRepository searchticketRepository = await diModule.resolve<SearchTicketRepository>();
    return diModule.registerInstance(
      SearchticketViewModel(repository: searchticketRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<SearchticketViewModel>();
  }
}
