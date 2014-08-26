package account

class UserController {

    def index() {
        redirect(action: 'login')
    }

    def login(){
        if(!params.nickName) return

        Account account = Account.findWhere(nickName: params.nickName)
        if (!account){
            flash.message = "your name is not exist,please ask administrator"
            return
        }
        if (!account.checkPassword(params.password)){
            flash.message = "password is not correct,try again"
            return
        }

        session.user = account

        if(session.backUri){
            redirect(uri:session.backUri)
        } else{
            redirect(uri:'/')
        }
    }

    def modify(){
        if (!params.password) return

        if (!session.user){
            redirect(action: 'login')
        }else{
            Account accountInstance = Account.get(session.user.id)
            accountInstance.password = accountInstance.saltPassword(params.password)

            if (!accountInstance.save(flush: true)){
                render model: [accountInstance:accountInstance]
            }else{
                session.invalidate()
                redirect(uri:'/')
            }
        }
    }
}
