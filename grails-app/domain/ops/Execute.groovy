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
        ExeResult result = new ExeResult(execute: this)

        AntBuilder ant = new AntBuilder()
        ant.project.buildListeners.firstElement().setMessageOutputLevel(0)

        if (com instanceof ExeCommand){
            ant.sshexec(trust:true,
                    host:server.address,
                    username:server.userName,
                    password:server.password,
                    command:com.command,
                    outputproperty: 'result'
            )

            result.command = "$server.address : $com.command"
        }else if (com instanceof FileCommand){
            def file,toDir
            if(com.direction=='upload'){
                toDir = "$server.userName:$server.password@$server.address:$com.toDir"
                file = com.file
            }else{
                file = "$server.userName:$server.password@$server.address:$com.file"
                toDir = com.toDir
            }
            ant.scp(trust:true,
                    file:file,
                    toDir:toDir
            )

            result.command = "$server.address : $com.direction $com.file to $com.toDir"
        }else {
            throw new Exception("unknown object $com")
        }

        result.result = ant.project.properties.'result'

        return result
    }
}
