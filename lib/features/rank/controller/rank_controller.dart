import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:mobx/mobx.dart';
part 'rank_controller.g.dart';

class RankController = _RankControllerBase with _$RankController;

abstract class _RankControllerBase with Store {
  @observable
  double percent = 0;

  @action
  currentProgressColor1() {
    if (percent <= 0.25) {
      return AppColors.maincolor3;
    }
  }

  @action
  currentProgressColor2() {
    if (percent <= 0.26 && percent >= 0.5) {
      return percent;
    }
  }

  @action
  currentProgressColor3() {
    if (percent <= 0.51 && percent >= 0.75) {
      return percent;
    }
  }

  @action
  currentProgressColor4() {
    if (percent <= 0.76 && percent >= 0.90) {
      return percent;
    }
  }

@action
  currentProgressColor5() {
    if (percent <= 0.91 && percent >= 0.95) {
      return percent;
    }
  }
@action
  currentProgressColor6() {
    if (percent == 1.0) {
      return percent;
    }
  }

}
