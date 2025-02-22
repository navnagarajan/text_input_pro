abstract class InputValidator {
  String errorText = "";

  bool isValid(final String? input);
}

class RequiredValidator extends InputValidator {
  RequiredValidator({String? errorText}) {
    this.errorText = errorText?.isNotEmpty == true ? errorText! : "Required";
  }

  @override
  bool isValid(final String? input) {
    if (input == null) return false;
    if (input.isEmpty) return false;
    return true;
  }
}

class MinimumValidator extends InputValidator {
  final int min;

  MinimumValidator(this.min, {String? errorText}) {
    this.errorText = errorText?.isNotEmpty == true
        ? errorText!
        : "Minimum $min char(s) required";
  }

  @override
  bool isValid(final String? input) {
    if (input == null) return false;
    if (input.isEmpty) return false;
    if (input.length < min) return false;
    return true;
  }
}

class MaximumValidator extends InputValidator {
  final int max;

  MaximumValidator(this.max, {String? errorText}) {
    this.errorText = errorText?.isNotEmpty == true
        ? errorText!
        : "Maximum $max char(s) required";
  }

  @override
  bool isValid(final String? input) {
    if (input == null || input.isEmpty) return true;
    if (input.length >= max) return false;

    return true;
  }
}

class EmailValidator extends InputValidator {
  EmailValidator({String? errorText}) {
    this.errorText =
        errorText?.isNotEmpty == true ? errorText! : "Invalid email address";
  }

  @override
  bool isValid(final String? input) {
    if (input == null || input.isEmpty) return true;
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(input);
  }
}

class RegExpValidator extends InputValidator {
  final int exp;

  RegExpValidator(this.exp, {String? errorText}) {
    this.errorText =
        errorText?.isNotEmpty == true ? errorText! : "Please verify your input";
  }

  @override
  bool isValid(final String? input) {
    if (input == null) return false;
    if (input.isEmpty) return false;
    if (input.length < exp) return false;
    return true;
  }
}

class NumOnlyValidator extends InputValidator {
  NumOnlyValidator({String? errorText}) {
    this.errorText =
        errorText?.isNotEmpty == true ? errorText! : "Numbers only allowed";
  }

  @override
  bool isValid(final String? input) {
    if (input == null || input.isEmpty) return true;
    return RegExp(r'^[0-9]+$').hasMatch(input);
  }
}

class LettersOnlyValidator extends InputValidator {
  LettersOnlyValidator({String? errorText}) {
    this.errorText =
        errorText?.isNotEmpty == true ? errorText! : "Alphabets only allowed";
  }

  @override
  bool isValid(final String? input) {
    if (input == null || input.isEmpty) return false;

    return RegExp(r'^[a-zA-Z]+$').hasMatch(input);
  }
}
