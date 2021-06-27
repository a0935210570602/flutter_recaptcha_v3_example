var SITE_KEY = "6LdW_d8aAAAAAKVYPB15ParsKxgqQ-UCooWHaWdq";
var SECRET_KEY = "6LdW_d8aAAAAADnYVjJauw-63oQsnzTus90fUW9N";
var score = -1;

async function check() {
    var promise = new Promise((reslove)=>{
        grecaptcha.ready(async function() {
            grecaptcha.execute(SITE_KEY, {action: 'verify'}).then(async function(token) {
                var URL = 'https://www.google.com/recaptcha/api/siteverify';
                URL = URL + "?secret=" + SECRET_KEY;
                URL = URL + "&response=" + token;
                var xhr = new XMLHttpRequest();
                xhr.open("POST", URL, true);
                xhr.send(JSON.stringify({
                    secret: SECRET_KEY,
                    response:token
                }));
                xhr.onload = async function(){
                    let response = xhr.responseText;
                    //顯示respnse結果封包
                    console.log(response);
                    let obj = JSON.parse(response);
                    score =  obj.score
                    //釋放promise
                    reslove();
                }
            });
        });
    })
    await promise
    return score;
}