class Singleton {
  // Private constructor
  Singleton._privateConstructor();

  // The single instance of the class
  static final Singleton _instance = Singleton._privateConstructor();

  // Factory constructor to return the same instance
  factory Singleton() {
    return _instance;
  }

  // Example method
  void exampleMethod() {
    print('This is a singleton class');
  }
}