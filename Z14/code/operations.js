function checkLanguage(text, index) {
    if (index === 0 && /^([а-яА-ЯёЁ ,.!?]+)$/.test(text)) return true
    if (index === 1 && /^([a-zA-Z ,.!?]+)$/.test(text)) return true
    return false
}

function checkWord(text) {
    if (/^([a-zA-ZА-Яа-яёЁ]+)$/.test(text)) return true
    else return false
} 