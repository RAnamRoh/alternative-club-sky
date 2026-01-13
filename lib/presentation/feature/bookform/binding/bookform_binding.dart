import 'package:domain/repository/book_form_repository.dart';
import 'package:sky_club/presentation/base/base_binding.dart';

import '../bookform_view_model.dart';

class BookformBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
     BookFormRepository bookformRepository = await diModule.resolve<BookFormRepository>();
    return diModule.registerInstance(
      BookformViewModel(bookFormRepository: bookformRepository),
    );
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<BookformViewModel>();
  }
}
