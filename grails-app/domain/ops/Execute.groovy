package ops

import account.Account
import ops.command.Command
import ops.command.ExeCommand
import ops.command.FileCommand
import ops.project.Task

class Execute {

    Account account
    Task task
    Command command
    Server server
    Date createAt = new Date()

    static hasMany = [exeResults:ExeResult]

    static constraints = {
        account()
        task nullable: true
        command nullable: true,validator: {val,obj->
            return val!=null || obj.task!=null
        }
        server()
        createAt()
    }

    static mapping = {
        exeResults sort: 'id',order: 'asc'
    }

    //before this ,must saved
    def exe(){
        if(task){
            return exeTask(this.task)
        }else{
            return exe(this.command)
        }
    }

    def exeTask(Task t){
        t.commands.each {
            exe(it)
        }
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

        String r = ant.project.properties.'result'
        if (r){
            r = r.size()>10000 ? r.substring(0,10000) : r
        }else {
            r = ''
        }
        result.result = r

        //save
        result.save(flush: true)

        return result
    }
}
