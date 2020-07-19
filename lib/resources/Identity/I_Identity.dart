// To make Interfaces start with I_
// abstract class as no object can be initialized from this
// abstract method needs to be overridden in the child class, normal methods are not compulsary

abstract class I_Identity {
  void login(String e, String p);
  Future<bool> signUp(String e, String p);
  void refresh();
  void logout();
}
