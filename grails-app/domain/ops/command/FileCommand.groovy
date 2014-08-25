package ops.command

class FileCommand extends Command{

    String direction
    String file
    String toDir

    static constraints = {
        direction inList: ['upload','download']
        file blank: false,size: 1..200
        toDir blank: false,size: 1..200
    }
}
