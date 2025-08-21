Dny = {}

-- General Config --
Dny.Cooldown = 300 -- 5 min cooldown (300 seconds)
Dny.Radius = 2.0 -- target radius (all locations)
Dny.Dispatch = 'cd_dispatch' -- (don't change)
Dny.Debug = false -- Enable Prints (true = enable, false = disable)

-- Police Dispatch Config --
Dny.Police = {
-- Police Jobs --
    Jobs = {
        'police',
        'sheriff', 
        'sast',
        'sasp',
        'roxsheriff',
        'gov',
        'fib'
    },          
    
-- Locations --
    Locations = {
        { coords = vector3(0, 0, 0) },
        { coords = vector3(0, 0, 0) },
        { coords = vector3(0, 0, 0) }
    },
    
-- Dispatch Config --
    Dispatch = {
        title = 'Přivolat zaměstnance',
        message = '%s Zazvonil(a) na zvonek.',
        
        Blip = {
            sprite = 161,
            scale = 0.5,
            colour = 3,
            flashes = false,
            text = '911 - Osoba si žádá zaměstnance',
            time = 2,
            radius = 0,
        },
        
        flash = 0,
        sound = 1
    }
}

-- Translations --
Dny.Locale = {
    title = 'Zvonek',
    zvonek = 'Zazvonit',
    pruvodce = 'Přivolat si zaměstnance',
    cekej = 'Počkej prosím...',
    zazvonil = 'Zazvonil si!',
    ovladani = 'left-right',
    cooldown = 'Musíš počkat %s sekund před dalším zazvoněním',
    nedostupny = 'Zvonek je momentálně nedostupný'
}