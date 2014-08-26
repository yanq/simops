import account.Account
import ops.Server
import ops.command.Command
import ops.command.ExeCommand
import ops.command.FileCommand
import ops.project.Project
import ops.project.Task

class BootStrap {

    def init = { servletContext ->
        //init db
        if (Account.list().size()==0){

            def a = new Account(nickName: 'admin',password: 'admin')
            if (!a.save(flush: true)) {
                log.error(a.errors)
            }

            new Project(title: 'myProject',description: 'my project for example')
                    .addToTasks(new Task(title: 'check momery').addToCommands(new ExeCommand(title: 'free',command: 'free')))
                    .save(flush: true)

            new Server(title: 'vm', address: '192.168.1.102',userName: 'yan',password: 'yan').save(flush: true)
            new ExeCommand(title: 'ps',command: 'ps -A').save(flush: true)
            new ExeCommand(title: 'top',command: 'top -bn 1').save(flush: true)
            new FileCommand(title: 'download a file',direction: 'download',file: 'afile',toDir: 'd:/temp').save(flush: true)
        }
    }
    def destroy = {
    }
}
