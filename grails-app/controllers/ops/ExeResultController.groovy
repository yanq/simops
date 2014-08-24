package ops


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExeResultController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ExeResult.list(params), model: [exeResultInstanceCount: ExeResult.count()]
    }

    def show(ExeResult exeResultInstance) {
        respond exeResultInstance
    }

    def create() {
        respond new ExeResult(params)
    }

    @Transactional
    def save(ExeResult exeResultInstance) {
        if (exeResultInstance == null) {
            notFound()
            return
        }

        if (exeResultInstance.hasErrors()) {
            respond exeResultInstance.errors, view: 'create'
            return
        }

        exeResultInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'exeResult.label', default: 'ExeResult'), exeResultInstance.id])
                redirect exeResultInstance
            }
            '*' { respond exeResultInstance, [status: CREATED] }
        }
    }

    def edit(ExeResult exeResultInstance) {
        respond exeResultInstance
    }

    @Transactional
    def update(ExeResult exeResultInstance) {
        if (exeResultInstance == null) {
            notFound()
            return
        }

        if (exeResultInstance.hasErrors()) {
            respond exeResultInstance.errors, view: 'edit'
            return
        }

        exeResultInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ExeResult.label', default: 'ExeResult'), exeResultInstance.id])
                redirect exeResultInstance
            }
            '*' { respond exeResultInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ExeResult exeResultInstance) {

        if (exeResultInstance == null) {
            notFound()
            return
        }

        exeResultInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ExeResult.label', default: 'ExeResult'), exeResultInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'exeResult.label', default: 'ExeResult'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
