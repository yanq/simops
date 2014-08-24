package ops


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExecuteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Execute.list(params), model: [executeInstanceCount: Execute.count()]
    }

    def show(Execute executeInstance) {
        respond executeInstance
    }

    def create() {
        respond new Execute(params)
    }

    @Transactional
    def save(Execute executeInstance) {
        if (executeInstance == null) {
            notFound()
            return
        }

        if (executeInstance.hasErrors()) {
            respond executeInstance.errors, view: 'create'
            return
        }

        executeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'execute.label', default: 'Execute'), executeInstance.id])
                redirect executeInstance
            }
            '*' { respond executeInstance, [status: CREATED] }
        }
    }

    def edit(Execute executeInstance) {
        respond executeInstance
    }

    @Transactional
    def update(Execute executeInstance) {
        if (executeInstance == null) {
            notFound()
            return
        }

        if (executeInstance.hasErrors()) {
            respond executeInstance.errors, view: 'edit'
            return
        }

        executeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Execute.label', default: 'Execute'), executeInstance.id])
                redirect executeInstance
            }
            '*' { respond executeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Execute executeInstance) {

        if (executeInstance == null) {
            notFound()
            return
        }

        executeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Execute.label', default: 'Execute'), executeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'execute.label', default: 'Execute'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
