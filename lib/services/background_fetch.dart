import 'package:food_app/services/database_helper.dart';
import 'package:workmanager/workmanager.dart';

const dropUser = 'dropUser';

DatabaseHelper db = DatabaseHelper();

void callbackDispatcher() {
  Workmanager().executeTask(
    (taskName, inputData) async {
      switch (taskName) {
        case dropUser:
          await db.deleteUser();
          break;
      }
      return Future.value(true);
    },
  );
}
