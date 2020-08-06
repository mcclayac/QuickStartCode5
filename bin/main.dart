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
  code5_3();
  code5_4();



  

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
