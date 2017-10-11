package contacts

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.rest.RestfulController
//import grails.plugin.springsecurity.annotation.Secured

//@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class PersonController extends RestfulController {
    
    static responseFormats = ['html', 'json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static layout = "main"
    
    PersonController() {
        super(Person)
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params), model:[personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def create() {
        respond new Person(params)
    }

    // curl -i -X POST -H "Content-Type: application/json" -d '{"firstName":"Adam", "lastName":"Saladino"}' localhost:8080/Contacts/person/save.json --user me:password
    @Transactional
    def save(Person personInstance) {
        println personInstance
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'create'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personInstance.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        respond personInstance
    }

    // curl -i -X PUT -H "Content-Type: application/json" -d '{"firstName":"Adam", "middleName": "Awesome", "lastName":"Saladino"}' localhost:8080/Contacts/person/update/14.json --user me:password
    @Transactional
    def update(Person person) {
        if (person == null) {
            notFound()
            return
        }

        if (person.hasErrors()) {
            respond person.errors, view:'edit'
            return
        }

        if (person.id == null) {
            respond "id can't be null", view:'edit'
            return
        }
        
        person.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), person.id])
                redirect person
            }
            '*'{ respond person, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInstance.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
