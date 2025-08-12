Config = {}

-- Seleção do sistema de voz: "pma-voice" ou "saltychat".
Config.VoiceSystem = "pma-voice"

-- Usar um sistema de notificação personalizado (true) ou o padrão (false).
Config.UseCustomNotify = false

-- Nome do item do rádio.
Config.RadioItem = "radio"

-- Canais restritos para profissões.
Config.RestrictedChannels = {
    [1] = { 'Admin' },
    [190] = { 'Police' },
    -- [FREQ] = { 'permissao para essa radio' },
}

-- Valor máximo de frequência permitido no sistema de comunicação por rádio do jogo.
Config.MaxFrequency = 999

-- Idioma/país padrão para o conteúdo textual do jogo (inglês).
Config.Locale = 'br'

-- ! Configurações do PMA Voice
-- Efeitos de comunicação por rádio e configurações de animação.
-- Ativar submix de rádio (a voz soa como em um rádio real).
Config.RadioEffect = true
-- Ativar animação ao falar no rádio.
Config.RadioAnimation = true
-- Tecla padrão para falar no rádio (CAPS).
Config.RadioKey = 'CAPS'


-- xINSANOUx#1359
-- Modificado e otimizado, Foi removido o Jammer.
-- Convertido para Creative nao 100%, mais funciona tudo.