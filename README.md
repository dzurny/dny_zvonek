# dny_zvonek

A lightweight FiveM script that adds **doorbell targets** (using ox_target) at police stations or any other location.  
When a player rings the bell, a **dispatch call** is sent to defined jobs through **cd_dispatch**.  

---

## ⚙️ Configuration

All settings are managed in **`config.lua`**.

### General
- `Dny.Cooldown` → Cooldown between rings (in seconds)  
- `Dny.Radius` → Target radius for all locations  
- `Dny.Dispatch` → Dispatch system (keep as `cd_dispatch`)  
- `Dny.Debug` → Enable/disable debug prints  

### Police Dispatch
- `Dny.Police.Jobs` → Jobs that will receive the dispatch (e.g. police, sheriff, fib, etc.)  
- `Dny.Police.Locations` → Add the coordinates where players can ring the bell  
- `Dny.Police.Dispatch` → Notification settings (title, message, blip style, sound, etc.)  

### Translations
- `Dny.Locale` → Texts shown to players (e.g. prompts, cooldown message, unavailable message)  

---

## 📦 Requirements
- [es_extended](https://github.com/esx-framework/esx_core)  
- [ox_lib](https://overextended.dev/ox_lib)  
- [ox_target](https://overextended.dev/ox_target)  
- [cd_dispatch](https://codesign.pro/scripts/free-scripts/23-cd-dispatch)  

---

## 🚀 Installation
1. Download or clone this repository into your `resources` folder  
2. Add `ensure dny_zvonek` to your `server.cfg`  
3. Configure **`config.lua`** (jobs, locations, cooldown, etc.)  
4. Restart your server  
