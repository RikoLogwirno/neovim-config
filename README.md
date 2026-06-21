# README
This is configuration for my neovim editor need including some plugins I choose

## INFO
Don't forget to put this folder under `.config/nvim/` and restart vim if running

## Additional config
### `vim ~/.local/share/nvim/lazy/minuet-ai.nvim/lua/minuet/backends/openai_base.lua`
function M.openai_get_text_fn_no_stream(json)
    return json.choices[1].message.content
end
-- Change to 
function M.openai_get_text_fn_no_stream(json)
    local msg = json.choices[1].message

    if msg.content and msg.content ~= "" then
        return msg.content
    end

    return msg.reasoning_content
end

