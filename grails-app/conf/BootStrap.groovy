import ops.Server
import ops.command.ExeCommand
import ops.command.FileCommand

class BootStrap {

    def init = { servletContext ->
        //init db
        if (Server.list().size()==0){
            new Server(title: 'vm', address: '192.168.1.102',userName: 'yan',password: 'yan').save(flush: true)
            new ExeCommand(title: 'ps',command: 'ps -A').save(flush: true)
            new ExeCommand(title: 'top',command: 'top -bn 1').save(flush: true)
            new FileCommand(title: 'download a file',direction: 'download',file: 'afile',toDir: 'd:/temp').save(flush: true)
        }
    }
    def destroy = {
    }
}
