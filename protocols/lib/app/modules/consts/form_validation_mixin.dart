mixin InputValidationMixin {
  bool isPasswordValid(String password) {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password);
  }

  bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool isNameValid(String name) {
    return RegExp(r"^[A-Za-z\s]*$",
            caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(name);
  }

  bool isCompanyNameValid(String company) {
    return RegExp(
      r"^[a-zA-Z0-9-@.{}#&!()]+(\s[a-zA-Z0-9-@{}.#&!()]+)+(\s[a-zA-Z-@.#&!()]+)?$",
      caseSensitive: false,
    ).hasMatch(company);
  }

  bool isAmountValid(String amount) {
    return RegExp(r'^[0-9]*$').hasMatch(amount);
  }

  bool isEmpIdValid(String empId) {
    return RegExp(r'^[A-Z0-9]*$').hasMatch(empId);
  }

  bool isPhNoValid(String phNo) {
    return RegExp(r'^(?:[+0]9)?[0-9]{10,12}$').hasMatch(phNo);
  }

  bool isPfNoValid(String pfNo) {
    return RegExp(r'^[A-Z0-9]*$').hasMatch(pfNo);
  }

  bool isAddressValid(String address) {
    return RegExp(r'^[A-Za-z0-9.,;\s]+$').hasMatch(address);
  }

  bool isPanNoValid(String panNo) {
    return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(panNo);
  }

  bool isIfscValid(String ifsc) {
    return RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(ifsc);
  }

  bool isAccNumberValid(String acNo) {
    return RegExp(r'^\d{8,18}$').hasMatch(acNo);
  }
}
