package ops

import ops.project.Project

class OpsController {

    def index() {
        render "hi"
    }

    def project(){
        def projects = Project.list()
        def projectInstance

        if(params.id){
            projectInstance = Project.get(params.id)
        }
        if(projects.size()>0 && projectInstance == null){
            projectInstance = projects[0]
        }

        render view: 'project', model: [projects:projects,projectInstance:projectInstance]
    }

    def server(){
        render "hi"
    }

    def exe(Execute execute){

        execute.account = session.user
        if (!execute.save(flush: true)) {
            log.error(execute.errors)
            render "errors"
        }

        def rs = execute.exe()
        log.info("exe result $rs")
        rs.each {
            if (!it.save(flush: true)){
                log.error(it.errors)
            }
        }

        //render "<textarea>${execute.refresh().exeResults[0].result}</textarea>"
        render template: 'exeResult',model: [execute:execute.refresh()]
    }

    def history(){
        render 'hi'
    }
}
