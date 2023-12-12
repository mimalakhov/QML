from googletrans import Translator
translator = Translator()
translation = translator.translate("Wie gehts ?", src="de")
print(translation.extra_data['possible-translations'][0][2])