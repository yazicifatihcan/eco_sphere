import '../../core/i10n/i10n.dart';

extension TSRegEx on String {
  String? isMail() {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return AppLocalization.getLabels.enterEmailAddressReqExMessage;
    } else if (!regExp.hasMatch(this)) {
      return AppLocalization.getLabels.enterValidEmailReqExMessage;
    }
    return null;
  }

  String? isName() {
    String pattern =
        r"^[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]+(([',. -][a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ])?[a-zA-ZüğişçöĞÜİŞÇÖıIZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]*)*$";
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return 'Name field can not be empty.';
    } else if (length == 1 || !regExp.hasMatch(this)) {
      return 'Please enter valid name.';
    }
    return null;
  }

   String? isValidUsername() {
    if (length < 3 || length > 16) {
      return 'Length must be between 3 and 16 characters.';
    }
    if (contains("..")) {
      return 'Cannot contain consecutive dots (..).';
    }
    if (startsWith(".")) {
      return 'Cannot start with a dot.';
    }
    if (endsWith(".")) {
      return 'Cannot end with a dot.';
    }
    final regex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!regex.hasMatch(this)) {
      return 'Must only contain alphanumeric characters and underscores.';
    }
    return null;
  }

  String? isValidAge() {
    String pattern = r'^[1-9][0-9]?$|^100$';
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return 'Age field can not be empty.';
    } else if (!regExp.hasMatch(this) || int.parse(this)>=18) {
      return 'Please enter valid age.';
    }
    return null;
  }


  String? isValidDate() {
    String datePattern = r'^\d{2}/\d{2}/\d{4}$';
    RegExp regExp = RegExp(datePattern);

    if (isEmpty) {
      return 'Date field can not be empty.';
    } else if (!regExp.hasMatch(this)) {
      return 'Please enter valid date.';
    }
    return null;
  }

  String? isValidOpeningTime() {

    RegExp regExp = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    if (isEmpty) {
      return 'Time field can not be empty.';
    } else if (!regExp.hasMatch(this)) {
      return 'Please enter valid time.';
    }
    return null;
  }

  String? isValidWebsite() {
    RegExp regExp = RegExp(
    r'^(http(s)?:\/\/)?(www\.)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$'
);
    if (isEmpty) {
      return 'Website field can not be empty.';
    } else if (!regExp.hasMatch(this)) {
      return 'Please enter valid website.';
    }
    return null;
  }

  String? isValidPassword({bool isChange=false}) {
    if(isChange && isEmpty){
      return null;
    }
    else if (isEmpty) {
      return 'Password field can not be empty.';
    } else if (length < 8) {
      return AppLocalization.getLabels.enterValidPasswordReqExMessage;
    }
    return null;
  }

  String? isValidRepeatPassword(String otherPassword) {
    if (isEmpty) {
      return 'Password repeat field can not be empty.';
    } else if (this!=otherPassword) {
      return 'Passwords must match.';
    }
    return null;
  }

  String? lenghtChecker(int desiredLenght) {
    if (isEmpty) {
      return 'This field can not be empty.';
    } else if (length<desiredLenght) {
      return 'Please enter at least $desiredLenght char.';
    }
    return null;
  }

  String? isNotEmptyController() {
    if (isEmpty) {
      return AppLocalization.getLabels.requiredFieldReqExMessage;
    }
    return null;
  }
}
