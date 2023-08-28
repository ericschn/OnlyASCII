OnlyASCII_ChatFrame_OnEvent = ChatFrame_OnEvent

function ChatFrame_OnEvent(event)
  local chatMsg = arg1

  if (event == "CHAT_MSG_CHANNEL" or
        event == "CHAT_MSG_YELL" or
        event == "CHAT_MSG_SAY" or
        event == "CHAT_MSG_GUILD" or
        event == "CHAT_MSG_WHISPER") and arg2 and arg1 then
    for i = 1, string.len(chatMsg) do
      local byte = string.byte(string.sub(chatMsg, i, i))
      if byte > 126 then
        return false
      end
    end
  end

  OnlyASCII_ChatFrame_OnEvent(event)
end
