# Bondi for Omarchy

The candy iMac era, distilled. Deep smoke-graphite (Power Mac G4 graphite)
with candy accents — Bondi blue, tangerine, grape, lime, strawberry, blueberry.

Not a pixel clone of Mac OS 9. The *vibe* — the fun and beauty of it — rebuilt
for a modern tiling desktop. Dark theme; high-contrast text throughout.

![Bondi preview](preview.png)

## Install

```bash
omarchy theme install https://github.com/garrisonr/omarchy-bondi-theme.git
omarchy theme set bondi
```

## Wallpapers

- `backgrounds/bondi.jpg` — translucent Bondi-blue candy waves (default)
- `backgrounds/bondi-graphite.jpg` — smoke-graphite with a Bondi ribbon

Cycle them: `omarchy theme bg next` or `Super + Ctrl + Space`.

## Sounds

`sounds/` holds the **Bondi sound theme**: authentic Mac OS 8/9 alert sounds
(Quack, Sosumi, Wild Eep, Droplet, Indigo) plus the surviving classic alerts
and a G3 startup chime, mapped to freedesktop sound events.

Install:

```bash
mkdir -p ~/.local/share/sounds
cp -r sounds/bondi ~/.local/share/sounds/
```

Enable event sounds for GTK apps (`~/.config/gtk-3.0/settings.ini` and
`~/.config/gtk-4.0/settings.ini`):

```ini
[Settings]
gtk-sound-theme-name = bondi
gtk-enable-event-sounds = true
gtk-enable-input-feedback-sounds = true
```

Play the login chime on session start (Hyprland `exec-once`):

```ini
exec-once = canberra-gtk-play -f ~/.local/share/sounds/bondi/stereo/desktop-login.ogg
```

**Soundboard** — click through every sound like the old Sound control panel:

```bash
./sounds/bondi-soundboard.sh
```

Sound sources: classic alert sounds via archive.org (macos8_error_sounds),
modern survivors via extratone/macOSsystemsounds, G3 startup chime via
myinstants. All short clips used for nostalgic desktop theming.

## License

MIT. Wallpapers generated for this theme.
