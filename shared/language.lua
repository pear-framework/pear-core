Languages = {}

Translate = function(language, text)

    if Languages[language] then
        return Languages[language][text]
    else
        return "[Language] - " .. language .. " does not exist."
    end
end