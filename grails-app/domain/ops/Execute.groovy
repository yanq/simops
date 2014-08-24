package ops

import ops.command.Command
import ops.command.ExeCommand
import ops.command.FileCommand
import org.apache.tools.ant.DefaultLogger
import com.jcraft.jsch.UserInfo
import org.apache.tools.ant.taskdefs.optional.ssh.SSHUserInfo

class Execute {

    Command command
    Server server
    Date createAt = new Date()

    static hasMany = [exeResults:ExeResult]

    static constraints = {
        command()
        server()
        createAt()
    }

    static mapping = {
        exeResults sort: 'id',order: 'asc'
    }

    //before this ,must saved
    ExeResult exe(){
        return exe(this.command)
    }

    ExeResult exe(Command com){
        AntBuilder ant = new AntBuilder()
        ant.project.buildListeners.firstElement().setMessageOutputLevel(0)

        if (com instanceof ExeCommand){
            ant.sshexec(trust:true,
                    host:server.address,
                    username:server.userName,
                    password:server.password,
                    command:com.command,
                    outputproperty: 'result')
        }else if (com instanceof FileCommand){
            //todo filecommand
        }else {
            throw new Exception("unknown object $com")
        }

        ExeResult result = new ExeResult()
        result.execute = this
        result.result = ant.project.properties.'result'

        return result
    }
}
