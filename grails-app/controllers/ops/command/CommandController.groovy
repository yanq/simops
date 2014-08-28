package ops.command

class CommandController {

    def show(Command com) {
        if (com instanceof ExeCommand){
            redirect(controller: 'exeCommand',action: 'show',id:com.id)
        }else if (com instanceof FileCommand){
            redirect(controller: 'fileCommand',action: 'show',id:com.id)
        }else {
            throw new Exception('unknown command')
        }
    }
}
