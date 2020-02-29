require "yaml"


def load_library fp
  translator = {'get_meaning' => {}, 'get_emoticon' => {}}
  lib =  YAML.load_file(fp)
  lib.each do |k, (english, japanese)|
    translator['get_meaning'][japanese] = k
    translator['get_emoticon'][english] = japanese
  end
  return translator
end

def get_japanese_emoticon fp, emoticon
  translator = load_library(fp)
  return translator['get_emoticon'][emoticon]
end

def get_english_meaning fp, emoticon
  translator = load_library(fp)
  return translator['get_meaning'][emoticon]
end
