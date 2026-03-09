import telebot

TOKEN = "8566172678:AAFh0mEZPEGsRQ4yCRCidBuNNSA1z3VsaQM"

bot = telebot.TeleBot(TOKEN)

def latin_to_cyrillic(text):
    mapping = {
        "a":"а","b":"б","d":"д","e":"е","f":"ф","g":"г","h":"ҳ","i":"и","j":"ж",
        "k":"к","l":"л","m":"м","n":"н","o":"о","p":"п","q":"қ","r":"р","s":"с",
        "t":"т","u":"у","v":"в","x":"х","y":"й","z":"з"
    }
    result = ""
    for i in text.lower():
        result += mapping.get(i, i)
    return result

@bot.message_handler(commands=['start'])
def start(message):
    bot.reply_to(message, "Salom!\nMatn yuboring men uni translit qilaman.")

@bot.message_handler(func=lambda message: True)
def translit(message):
    text = message.text
    result = latin_to_cyrillic(text)
    bot.reply_to(message, result)

print("Bot ishlayapti...")
bot.infinity_polling()