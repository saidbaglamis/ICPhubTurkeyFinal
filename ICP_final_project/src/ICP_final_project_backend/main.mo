import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Debug "mo:base/Debug";


/*   class RealEstate {
    public init(value1 : Text, value2 : Text) : RealEstate {
    return RealEstate { id = value1; name = value2 };
  }
  let  id: Text;
  let  name: Text;
  let  img: Text;
  let  price: Text;
}; */


actor {

  type  RealEstate= {
    id: Text;
    name: Text;
    img: Text;
    price: Text;
  };

/*   object EstateObject = {
    var id = "";
    var name = "";
    var img = "";
    var price = "";
  }; */

  let RealEstateMap = HashMap.HashMap<Text, RealEstate>(0, Text.equal, Text.hash);
  //let Favories = HashMap.HashMap<Text, RealEstate>(0, Text.equal, Text.hash);
  
  public func add_estate(id: Text, name: Text, img: Text, price: Text) : async Bool {
    let realEstate : RealEstate = {
      id = id;
      name = name;
      img =  img;
      price =  price;
    };

    RealEstateMap.put(realEstate.id, realEstate);
    return true;
  };

  public func update_estate(id: Text, name: Text, img: Text, price: Text) : async Bool {
    let realEstate : RealEstate = {
      id = id;
      name = name;
      img =  img;
      price =  price;
    };
    
    RealEstateMap.put(realEstate.id, realEstate);
    return true;
  };

  public func delete_estate(id: Text) : async Bool {
    
    RealEstateMap.delete(id);
    return true;
  };

  public query func get_estate(id: Text) : async ?RealEstate {
      let realEstate : ?RealEstate = RealEstateMap.get(id);
      return realEstate;
  };

  /* public query func siraliEmlakListesi(emlaklar: HashMap<Text, RealEstate>) : Array<RealEstate> {
    // Hashmap'teki anahtarları bir diziye kopyala
    let isimler = HashMap.keys(emlaklar);

    // Anahtarları alfabetik olarak sırala
    let siraliIsimler = Array.sort(isimler, Text.compare);

    // Sıralanmış isimler listesini kullanarak Emlak nesnelerini al
    let siraliEmlaklar = Array.map((isim) => {
      let emlak = emlaklar.[isim];
      return emlak;
    }, siraliIsimler);

    return siraliEmlaklar;
  }; */
};