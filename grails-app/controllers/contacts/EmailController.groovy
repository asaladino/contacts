package contacts

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.rest.RestfulController
//import grails.plugin.springsecurity.annotation.Secured

//@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class EmailController extends RestfulController {
    
    static responseFormats = ['html', 'json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static layout = "main"
    
    EmailController() {
        super(Email)
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Email.list(params), model:[emailInstanceCount: Email.count()]
    }

    def show(Email emailInstance) {
        respond emailInstance
    }

    def create() {
        respond new Email(params)
    }
    
    // Referer	http://localhost:8080/Contacts/email/create?person.id=14

    // curl -i -X POST -H "Content-Type: application/json" -d '{"address":"happy.pony@ellucian.com", "person": {"id": "14"}}' localhost:8080/Contacts/email/save.json --user me:password
    @Transactional
    def save(Email emailInstance) {
        if (emailInstance == null) {
            notFound()
            return
        }

        if (emailInstance.hasErrors()) {
            respond emailInstance.errors, view:'create'
            return
        }

        emailInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'emailInstance.label', default: 'Email'), emailInstance.id])
                redirect emailInstance
            }
            '*' { respond emailInstance, [status: CREATED] }
        }
    }

    def edit(Email emailInstance) {
        respond emailInstance
    }

    @Transactional
    def update(Email emailInstance) {
        
        if (emailInstance == null) {
            notFound()
            return
        }

        if (emailInstance.hasErrors()) {
            respond emailInstance.errors, view:'edit'
            return
        }

        emailInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Email.label', default: 'Email'), emailInstance.id])
                redirect emailInstance
            }
            '*'{ respond emailInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Email emailInstance) {

        if (emailInstance == null) {
            notFound()
            return
        }

        emailInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Email.label', default: 'Email'), emailInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailInstance.label', default: 'Email'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
