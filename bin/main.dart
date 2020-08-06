void main(List<String> arguments) {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print('Dart Quick Start Chapter 5');
  print('5. Entity Relationships: Abstract Classes, Interfaces, and Exception Handling');
  //https://learning.oreilly.com/library/view/quick-start-guide/9781484255629/A490744_1_En_5_Chapter.html

  // Abstract Classes
  code5_1();
  code5_2();
  // Advantages of Interfaces
  code5_3();
  code5_4();
  code5_6();

  // Static Variables and Methods
  code5_8();
  // Exception Handling
  code5_9();
  code5_10();


}


//----------------------------------------------
//----------------------------------------------

//code 5.10
class InputException2 implements Exception {
  String customException() {
    return "The input of negative number is not valid.";
  }
}


void code5_10() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.10");
  //code 5.10

  // ON Clause is used when the exception is known
  try {
  var res = 4 ~/ 0;
  print("The result: $res");
  } on IntegerDivisionByZeroException {
  print("You cannot divide by zero, the value is undefined");
  }
  // CATCH Clause is used when exception is unknown
  try {
  var res = 3 ~/ 0;
  print("The result is $res");
  } catch (e) {
  print("The exception thrown is $e");
  }
  // STACK TRACE is used to know the steps of the events
  // these events took place before the actual Exception was thrown
  try {
  int res = 10 ~/ 0;
  print("The result is $res");
  } catch (e, s) {
  print("The exception: $e");
  print("Stack trace is \n $s");
  }
  // FINALLY Clause is always Executed
  // whether exception is thrown or not
  try {
  int res = 9 ~/ 0;
  print("The result: $res");
  } catch (e) {
  print("The exception: $e");
  } finally {
  print("The finally clause is always executed.");
  }
  // we can make our Custom Exception by creating a class
  try {
  inputValue(-14);
  } catch (e) {
  print(e.customException());
  } finally {
  print("The finally clause is always executed");
  }
  }
  void inputValue(int inputNumber) {
  if (inputNumber < 0) {
  var inputException2 = InputException2();
  throw inputException2;
  }
}


//----------------------------------------------
//----------------------------------------------


void code5_9() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.9");
  print("");
  try{
    int result = 10 ~/ 0;
    print("The result is $result");
  } on IntegerDivisionByZeroException{
    print("We cannot divide by zero");
  }
  try{
    int result = 10 ~/ 0;
    print("The result is $result");
  } catch(e){
    print(e);
  }
  try{
    int result = 10 ~/ 0;
    print("The result is $result");
  } catch(e){
    print("The exception is : $e");
  } finally{
    print("This is finally and it always is executed.");
  }
  print("Try on XXXX");
  try{
    int result = 10 ~/ 0;
    print("The result is $result");
  } on IntegerDivisionByZeroException{
    print("We cannot divide by zero");
  }
}


//----------------------------------------------
//----------------------------------------------

//code 5.8
// static variables and methods consume less memory
// they are lazily initialized
class Circle{
  static const pi = 3.14;
  static void drawACircle(){
    //from static method you cannot call a normal function
    print(pi);
  }
  void aNonStaticFunction(){
    //from a normal function or method you can call a static meethod
    Circle.drawACircle();
    print("This is normal function.");
  }
}


void code5_8() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.8");
  print("");
  var circle = Circle();
  circle.aNonStaticFunction();
  Circle.drawACircle();
}

//----------------------------------------------
//----------------------------------------------

//code 5.6
class OrderDetails2 {
  //int age;
  /*
  void anyNormalFunction(int age){
    print("This is a normal function to know the $age.");
  }
  */
  void UpdateCustomers(){
  }
  void TakeOrder(){
  }
}
abstract class CustomerDetails2 {
  void Customers(){
    print("A list of customers.");
  }
}
class ItemDetails2 extends CustomerDetails2 implements OrderDetails2 {
  void anyNormalFunction(int age){
    print("This is a normal function to know the age: $age.");
  }
  void UpdateCustomers(){
    //implementing interface members
    print("Updating customers.");
  }
  void TakeOrder(){
  }
}

void code5_6() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.6");
  print("");
  var book = ItemDetails2();
  //book.TakeOrder();
  book.UpdateCustomers();
  book.anyNormalFunction(12);
  book.Customers();
}
//----------------------------------------------
//----------------------------------------------
class OrderDetails {
  void UpdateCustomers(){
  }
  void TakeOrder(){
  }
}
class ItemDetails implements OrderDetails{
  void UpdateCustomers(){
    //implementing interface members
    print("Updating customers.");
  }
  void TakeOrder(){
    //implementing interface members
    print("Taking orders from customers.");
  }
}

void code5_4() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.4");
  print("");
  var book = ItemDetails();
  book.TakeOrder();
  book.UpdateCustomers();
}
//----------------------------------------------
//----------------------------------------------
//code 5.3
// interface in Dart is a class, but we don't extend,
// we implement it
class Vehicle {
  void steerTheVehicle() {
    print("The vehicle is moving.");
  }
}
class Engine {
  //in the interface
  final _name; // final means single assignment and it must have an initializer as I use here
  //not in the interface, since it is a constructor
  Engine(this._name);
  String lessOilConsumption(){
    return "It consumes less oil.";
  }
}

class Car implements Vehicle, Engine{
  var _name;
  void steerTheVehicle() {
    print("The car is moving.");
  }
  String lessOilConsumption(){
    print("This model of car consumes less oil.");
  }
  void ridingExperience() => print("This car gives good ride, because it is an ${this._name}");
}

void code5_3() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.3");
  print("");

  var car = Car();
  car._name = "Opel";
  print("Car name: ${car._name}");
  car.steerTheVehicle();
  car.lessOilConsumption();
  car.ridingExperience();
}
//----------------------------------------------
//----------------------------------------------
//code 5.2
abstract class Mammal {
  void run();
  void walk();
  void sound(){
    print("Mammals make sound");
  }
}
class Human implements Mammal {
  @override
  void run(){
    print("I am running.");
  }
  @override
  void walk(){
    print("I am walking");
  }

  void sound() {

    print("Humans make sound");
  }
}
void code5_2() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.2");

  var John = Human();
  print("John says: ");
  John.run();
  print("John says: ");
  John.walk();
  print("John makes no sound.");
  John.sound();
}
//----------------------------------------------
//----------------------------------------------

//code 5.1
//we cannot instantiate any abstract class
abstract class volume{
  //we can declare instance variable
  int age;
  void increase();
  void decrease();
  // a normal function
  void anyNormalFunction(int age){
    print("This is a normal function to know the $age.");
  }
}

class soundSystem extends volume{
  void increase(){
    print("Sound is up.");
  }
  void decrease(){
    print("Sound is down.");
  }
  //it is optional to override the normal function
  void anyNormalFunction(int age){
    print("This is a normal function to know how old the sound system is: $age.");
  }
}

void code5_1() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 5.1");

  var newSystem = soundSystem();
  newSystem.increase();
  newSystem.decrease();
  newSystem.anyNormalFunction(10);
}
