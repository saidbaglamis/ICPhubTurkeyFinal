![internet-computer-icp-dfinity1484](https://github.com/saidbaglamis/ICPhubTurkeyFinal/assets/103155119/3ec8e857-6820-42ae-ab61-f65bbaa87cbd)

# ICPhubTurkey Web3 Real Estate Project
## This repository contains the backend code for an ICP Web3 project focused on managing real estate properties. The backend is implemented using Motoko, a programming language for the Internet Computer Protocol (ICP) platform.

### Overview

The backend provides functionalities to manage real estate properties including adding, updating, deleting, and retrieving property information. It utilizes a HashMap data structure to store and manage the properties.

Motoko Code Structure
The Motoko code consists of an actor type representing RealEstate and various functions to perform CRUD operations on real estate properties.

RealEstate Type
motoko
Copy code
type RealEstate= {
  id: Text;
  name: Text;
  img: Text;
  price: Text;
};
The RealEstate type defines the structure of a real estate property with fields for ID, name, image URL, and price.

Functions
add_estate
motoko

public func add_estate(id: Text, name: Text, img: Text, price: Text) : async Bool {
  // Creates a RealEstate object
  let realEstate : RealEstate = {
    id = id;
    name = name;
    img =  img;
    price =  price;
  };

  // Adds the real estate to the HashMap
  RealEstateMap.put(realEstate.id, realEstate);
  return true;
};
This function adds a new real estate property to the HashMap.

update_estate
motoko

public func update_estate(id: Text, name: Text, img: Text, price: Text) : async Bool {
  // Creates a RealEstate object
  let realEstate : RealEstate = {
    id = id;
    name = name;
    img =  img;
    price =  price;
  };
  
  // Updates the real estate in the HashMap
  RealEstateMap.put(realEstate.id, realEstate);
  return true;
};
This function updates an existing real estate property in the HashMap.

delete_estate
motoko

public func delete_estate(id: Text) : async Bool {
  // Deletes the real estate from the HashMap
  RealEstateMap.delete(id);
  return true;
};
This function deletes a real estate property from the HashMap.

get_estate
motoko

public query func get_estate(id: Text) : async ?RealEstate {
  // Retrieves a real estate property from the HashMap
  let realEstate : ?RealEstate = RealEstateMap.get(id);
  return realEstate;
};
This function retrieves a real estate property based on its ID from the HashMap.

Usage
To use the backend functionalities, integrate the provided functions into your application logic. Ensure to handle asynchronous calls appropriately as the functions return promises.

Contributions
Contributions to this project are welcome. Feel free to submit issues or pull requests for any enhancements or fixes.
