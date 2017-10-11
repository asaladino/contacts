package contacts

class Phone {
    
    String number
    Person person
    
    static belongsTo = [person: Person]

    static constraints = {
    }
    
    String toString() {
        number
    }
}
