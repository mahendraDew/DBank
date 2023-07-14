import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue:Float = 300;
  currentValue :=300;
  let id = 23413451345135;
  Debug.print(debug_show(id));

  stable var startingTime = Time.now();
  startingTime := Time.now();
  //private fun as this is only accessible from this actor only
  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount : Float){
    let tempValue : Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("amount too large, currentValue is not sufficient");
    }
  };

  public query func checkBalance(): async Float{
      return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startingTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue + (1.01 ** Float.fromInt(timeElapsedS));
  }


  // topUp();
}