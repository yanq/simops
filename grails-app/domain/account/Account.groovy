package account

class Account {
    String nickName
    String password
    Date dateCreated
    Date lastUpdated


    static constraints = {
        nickName blank: false,minSize: 2,maxSize: 50,unique: true
        password blank: false,minSize: 5,maxSize: 32
        dateCreated()
        lastUpdated()
    }

    //salt
    def saltPassword(String ps){
        return (ps+"ops86").encodeAsMD5()
    }
    //before
    def beforeInsert(){
        password = saltPassword(password)
    }

    //check password
    def checkPassword(String ps){
        if(password == saltPassword(ps)) return true
        return false
    }

    String toString(){
        nickName
    }
}
