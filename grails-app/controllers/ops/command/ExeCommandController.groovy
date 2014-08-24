package ops.command



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExeCommandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ExeCommand.list(params), model:[exeCommandInstanceCount: ExeCommand.count()]
    }

    def show(ExeCommand exeCommandInstance) {
        respond exeCommandInstance
    }

    def create() {
        respond new ExeCommand(params)
    }

    @Transactional
    def save(ExeCommand exeCommandInstance) {
        if (exeCommandInstance == null) {
            notFound()
            return
        }

        if (exeCommandInstance.hasErrors()) {
            respond exeCommandInstance.errors, view:'create'
            return
        }

        exeCommandInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'exeCommand.label', default: 'ExeCommand'), exeCommandInstance.id])
                redirect exeCommandInstance
            }
            '*' { respond exeCommandInstance, [status: CREATED] }
        }
    }

    def edit(ExeCommand exeCommandInstance) {
        respond exeCommandInstance
    }

    @Transactional
    def update(ExeCommand exeCommandInstance) {
        if (exeCommandInstance == null) {
            notFound()
            return
        }

        if (exeCommandInstance.hasErrors()) {
            respond exeCommandInstance.errors, view:'edit'
            return
        }

        exeCommandInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ExeCommand.label', default: 'ExeCommand'), exeCommandInstance.id])
                redirect exeCommandInstance
            }
            '*'{ respond exeCommandInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ExeCommand exeCommandInstance) {

        if (exeCommandInstance == null) {
            notFound()
            return
        }

        exeCommandInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ExeCommand.label', default: 'ExeCommand'), exeCommandInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'exeCommand.label', default: 'ExeCommand'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
