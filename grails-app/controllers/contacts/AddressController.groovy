package contacts

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.rest.RestfulController
//import grails.plugin.springsecurity.annotation.Secured

//@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class AddressController extends RestfulController {
    
    static responseFormats = ['html', 'json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static layout = "main"
    
    AddressController() {
        super(Address)
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Address.list(params), model:[addressInstanceCount: Address.count()]
    }

    def show(Address addressInstance) {
        respond addressInstance
    }

    def create() {
        respond new Address(params)
    }

    // curl -i -X POST -H "Content-Type: application/json" -d '{"address1":"635 Tree St", "city": "Athens", "state": "GA", "zip": "49834", "country": "USA", "person": {"id": "14"}}' localhost:8080/Contacts/address/save.json --user me:password
    @Transactional
    def save(Address addressInstance) {
        if (addressInstance == null) {
            notFound()
            return
        }

        if (addressInstance.hasErrors()) {
            respond addressInstance.errors, view:'create'
            return
        }

        addressInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'addressInstance.label', default: 'Address'), addressInstance.id])
                redirect addressInstance
            }
            '*' { respond addressInstance, [status: CREATED] }
        }
    }

    def edit(Address addressInstance) {
        respond addressInstance
    }

    @Transactional
    def update(Address addressInstance) {
        if (addressInstance == null) {
            notFound()
            return
        }

        if (addressInstance.hasErrors()) {
            respond addressInstance.errors, view:'edit'
            return
        }

        addressInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Address.label', default: 'Address'), addressInstance.id])
                redirect addressInstance
            }
            '*'{ respond addressInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Address addressInstance) {

        if (addressInstance == null) {
            notFound()
            return
        }

        addressInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Address.label', default: 'Address'), addressInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'addressInstance.label', default: 'Address'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
