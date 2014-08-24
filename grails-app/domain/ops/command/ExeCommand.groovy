package ops.command

class ExeCommand extends Command{

    String command

    static constraints = {
        command blank: false,size: 1..2000
    }
}
