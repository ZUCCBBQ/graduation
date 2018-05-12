(function(w,d,u){
    var loginForm = util.get('loginForm');
    if(!loginForm){
        return;
    }
    var userName = loginForm['name_users'];
    var password = loginForm['password_users'];
    var role = loginForm['role_users'];
    var isSubmiting = false;
    var loading = new Loading();
    var page = {
        init:function(){
            loginForm.addEventListener('submit',function(e){
                if(!isSubmiting && this.check()){
                    var value1 = userName.value;
                    var value2 = password.value;
                    var value3 = role.value;
                    isSubmiting = true;
                    loading.show();
                    ajax({
                        data:{userName:value1,password:value2,role:value3},
                        url:'/api/login',
                        success:function(result){
                            loading.hide();
                            location.href = 'index';
                        },
                        error:function(message){
                            loading.result(message||'用户名或密码错误');
                            isSubmiting = false;
                        }
                    });
                }
            }.bind(this),false);
            [userName,password].forEach(function(item){
                item.addEventListener('input',function(e){
                    item.classList.remove('z-err');
                }.bind(this),false);
            }.bind(this));
        },
        check:function(){
            var result = true;
            [
                [userName,function(value){return value === ''}],
                [password,function(value){return value === ''}],
                [role,function(value){return value === ''}],
            ].forEach(function(item){
                var value = item[0].value.trim();
                if(item[1](value)){
                    item[0].classList.add('z-err');
                    result = false;
                }
                item[0].value = value;
            });
            return result;
        }
    };
    page.init();
})(window,document);