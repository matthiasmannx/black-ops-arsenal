# Black Ops Arsenal — BO1 & BO2 Loadouts

Lokale site die de beste wapens + community-aangeraden attachments/loadouts voor
Call of Duty: Black Ops 1 & 2 (multiplayer) bijhoudt. Twee tabs, elk met een eigen
game-thema (BO1 = donker/oranje Cold War-terminal, BO2 = koud cyaan Strike Force HUD).

## Openen

**Snelste manier:** dubbelklik `index.html` → opent in je browser. Alles werkt lokaal
(filteren, zoeken, drag-and-drop loadout-builder, opslaan in je browser).

**Als lokale server** (nodig zodra we online gaan / voor nette image-caching):

```bash
cd "/Volumes/T7/AI Projects/Black Ops 1 & 2"
python3 -m http.server 8000
# open daarna http://localhost:8000
```

## Wapenfoto's toevoegen

Elk wapen zoekt automatisch naar een afbeelding op:

```
assets/weapons/<game>/<slug>.png
```

- `<game>` = `bo1` of `bo2`
- `<slug>` = wapennaam in kleine letters, spaties/tekens → `-`

Voorbeelden:
- Galil (BO1)       → `assets/weapons/bo1/galil.png`
- AK-47 (BO1)       → `assets/weapons/bo1/ak-47.png`
- MP5K (BO1)        → `assets/weapons/bo1/mp5k.png`
- R-870 MCS (BO2)   → `assets/weapons/bo2/r-870-mcs.png`
- Skorpion EVO (BO2)→ `assets/weapons/bo2/skorpion-evo.png`

Zolang er nog geen foto is, toont de kaart een gestileerd silhouet per wapentype.
`.png` werkt; wil je `.jpg` gebruiken, pas dan `imgPath()` in `index.html` aan.

## Features

- **Twee game-thema's** met eigen kleuren, fonts, texturen en kaartvormen.
- **Filteren** op categorie + **live zoeken** op wapen/attachment/perk.
- **Tier-rating** (S/A/B/C) op basis van community-consensus.
- **Bewerk loadout**: sleep (of tik) attachments op een wapen; Warlord (BO1) /
  Gunfighter (BO2) wildcard voor een extra slot. Eigen loadouts worden in je
  browser opgeslagen (localStorage) en tonen een `EIGEN`-badge.

## Data aanpassen

Alle wapendata staat in de `WEAPONS`-array bovenaan het `<script>` in `index.html`.
Elk item: `{g, name, cat, tier, att:[...], perks:[...], why}`. Attachment-keuzes in
de builder komen uit `POOL` (per game).

## Online zetten (later)

De site is volledig statisch → te hosten op GitHub Pages, Netlify, Vercel of je
eigen webruimte. Gewoon de map uploaden. Dan geven we het onze eigen draai qua
huisstijl, echte foto's en eventueel extra secties (Zombies-loadouts, TTK-stats,
wapen-vergelijker).
