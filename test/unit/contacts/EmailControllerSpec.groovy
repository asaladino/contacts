package contacts



import grails.test.mixin.*
import spock.lang.*

@TestFor(EmailController)
@Mock(Email)
class EmailControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.emailInstanceList
            model.emailInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.emailInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def email = new Email()
            email.validate()
            controller.save(email)

        then:"The create view is rendered again with the correct model"
            model.emailInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            email = new Email(params)

            controller.save(email)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/email/show/1'
            controller.flash.message != null
            Email.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def email = new Email(params)
            controller.show(email)

        then:"A model is populated containing the domain instance"
            model.emailInstance == email
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def email = new Email(params)
            controller.edit(email)

        then:"A model is populated containing the domain instance"
            model.emailInstance == email
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/email/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def email = new Email()
            email.validate()
            controller.update(email)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.emailInstance == email

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            email = new Email(params).save(flush: true)
            controller.update(email)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/email/show/$email.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/email/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def email = new Email(params).save(flush: true)

        then:"It exists"
            Email.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(email)

        then:"The instance is deleted"
            Email.count() == 0
            response.redirectedUrl == '/email/index'
            flash.message != null
    }
}
