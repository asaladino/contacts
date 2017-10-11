package contacts

class Email {

    String address
    
    Person person
    
    static belongsTo = [person: Person]
    
    static constraints = {
        address email: true, blank: false
    }
    
    String toString() {
        address
    }
}
