package contacts

class Person {
    
    String firstName
    String middleName
    String lastName
    
    static hasMany = [
        addresses: Address,
        emails: Email,
        phones: Phone
    ]

    static constraints = {
        firstName nullable: true
        middleName nullable: true
        lastName validator: { val, obj ->
                'blah' == val
            }
    }
    
    String toString() {
        firstName + " " + lastName
    }
}
