WorkerScript.onMessage = function(message) {
    if (message.n  < 0 && message.n > 30){
        WorkerScript.sendMessage({"reply": "Неверный ввод!"})
    }
    else {
        WorkerScript.sendMessage({"reply": fib(message.n - 1).toString()})
    }
}

function fib(n){
    if (n===0) return 1
    if (n===1) return 1
    return fib(n - 1) + fib(n - 2)
}