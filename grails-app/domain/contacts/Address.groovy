package contacts

class Address {
    
    String address1
    String address2
    String city
    String state
    String country
    String zip
    
    Person person
    
    static belongsTo = [person: Person]

    static constraints = {
        address2 nullable: true
    }
    
    String toString() {
        address1 + ' ' + city + ', ' + state + ' ' + zip
    }
}
