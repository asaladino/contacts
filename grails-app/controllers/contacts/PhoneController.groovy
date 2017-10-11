package contacts

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.rest.RestfulController
//import grails.plugin.springsecurity.annotation.Secured

//@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class PhoneController extends RestfulController {
    
    static responseFormats = ['html', 'json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static layout = "main"
    
    PhoneController() {
        super(Phone)
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Phone.list(params), model:[phoneInstanceCount: Phone.count()]
    }

    def show(Phone phoneInstance) {
        respond phoneInstance
    }

    def create() {
        respond new Phone(params)
    }

    // curl -i -X POST -H "Content-Type: application/json" -d '{"number":"(888) 444-7777", "person": {"id": "14"}}' localhost:8080/Contacts/phone/save.json --user me:password
    @Transactional
    def save(Phone phoneInstance) {
        println(phoneInstance)
        if (phoneInstance == null) {
            notFound()
            return
        }

        if (phoneInstance.hasErrors()) {
            respond phoneInstance.errors, view:'create'
            return
        }

        phoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'phoneInstance.label', default: 'Phone'), phoneInstance.id])
                redirect phoneInstance
            }
            '*' { respond phoneInstance, [status: CREATED] }
        }
    }

    def edit(Phone phoneInstance) {
        respond phoneInstance
    }

    @Transactional
    def update(Phone phoneInstance) {
        if (phoneInstance == null) {
            notFound()
            return
        }

        if (phoneInstance.hasErrors()) {
            respond phoneInstance.errors, view:'edit'
            return
        }

        phoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Phone.label', default: 'Phone'), phoneInstance.id])
                redirect phoneInstance
            }
            '*'{ respond phoneInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Phone phoneInstance) {

        if (phoneInstance == null) {
            notFound()
            return
        }

        phoneInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Phone.label', default: 'Phone'), phoneInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'phoneInstance.label', default: 'Phone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
