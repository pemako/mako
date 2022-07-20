# Usage

asciinema is composed of multiple commands, similar to `git`, `apt-get` or `brew`.

When you run `asciinema` with no arguments help message is displayed, listing all available commands with their options.

## `rec [filename]`

**Record terminal session.**

By running `asciinema rec [filename]` you start a new recording session. The command (process) that is recorded can be specified with `-c` option (see below), and defaults to `$SHELL` which is what you want in most cases.

Recording finishes when you exit the shell (hit Ctrl+D or type `exit`). If the recorded process is not a shell then recording finishes when the process exits.

If the `filename` argument is omitted then (after asking for confirmation) the resulting asciicast is uploaded to [asciinema-server](https://github.com/asciinema/asciinema-server) (by default to asciinema.org), where it can be watched and shared.

If the `filename` argument is given then the resulting recording (called [asciicast](https://github.com/asciinema/asciinema/blob/master/doc/asciicast-v2.md)) is saved to a local file. It can later be replayed with `asciinema play <filename>` and/or uploaded to asciinema server with `asciinema upload <filename>`.

`ASCIINEMA_REC=1` is added to recorded process environment variables. This can be used by your shell’s config file (`.bashrc`, `.zshrc`) to alter the prompt or play a sound when the shell is being recorded.

Available options:

- `--stdin` - Enable stdin (keyboard) recording (see below)
- `--append` - Append to existing recording
- `--raw` - Save raw STDOUT output, without timing information or other metadata
- `--overwrite` - Overwrite the recording if it already exists
- `-c, --command=<command>` - Specify command to record, defaults to $SHELL
- `-e, --env=<var-names>` - List of environment variables to capture, defaults to `SHELL,TERM`
- `-t, --title=<title>` - Specify the title of the asciicast
- `-i, --idle-time-limit=<sec>` - Limit recorded terminal inactivity to max `<sec>` seconds
- `-y, --yes` - Answer “yes” to all prompts (e.g. upload confirmation)
- `-q, --quiet` - Be quiet, suppress all notices/warnings (implies -y)

Stdin recording allows for capturing of all characters typed in by the user in the currently recorded shell. This may be used by a player (e.g. [asciinema-player](https://github.com/asciinema/asciinema-player)) to display pressed keys. Because it’s basically a key-logging (scoped to a single shell instance), it’s disabled by default, and has to be explicitly enabled via `--stdin` option.

## `play <filename>`

**Replay recorded asciicast in a terminal.**

This command replays given asciicast (as recorded by `rec` command) directly in your terminal.

Following keyboard shortcuts are available:

- Space - toggle pause,
- . - step through a recording a frame at a time (when paused),
- Ctrl+C - exit.

Playing from a local file:

```
asciinema play /path/to/asciicast.cast
```

Playing from HTTP(S) URL:

```
asciinema play https://asciinema.org/a/22124.cast
asciinema play http://example.com/demo.cast
```

Playing from asciicast page URL (requires `<link rel="alternate" type="application/x-asciicast" href="/my/ascii.cast">` in page’s HTML):

```
asciinema play https://asciinema.org/a/22124
asciinema play http://example.com/blog/post.html
```

Playing from stdin:

```
cat /path/to/asciicast.cast | asciinema play -
ssh user@host cat asciicast.cast | asciinema play -
```

Playing from IPFS:

```
asciinema play dweb:/ipfs/QmNe7FsYaHc9SaDEAEXbaagAzNw9cH7YbzN4xV7jV1MCzK/ascii.cast
```

Available options:

- `-i, --idle-time-limit=<sec>` - Limit replayed terminal inactivity to max `<sec>` seconds
- `-s, --speed=<factor>` - Playback speed (can be fractional)

> For the best playback experience it is recommended to run `asciinema play` in a terminal of dimensions not smaller than the one used for recording, as there’s no “transcoding” of control sequences for new terminal size.

## `cat <filename>`

**Print full output of recorded asciicast to a terminal.**

While `asciinema play <filename>` replays the recorded session using timing information saved in the asciicast, `asciinema cat <filename>` dumps the full output (including all escape sequences) to a terminal immediately.

`asciinema cat existing.cast >output.txt` gives the same result as recording via `asciinema rec --raw output.txt`.

## `upload <filename>`

**Upload recorded asciicast to asciinema.org site.**

This command uploads given asciicast (recorded by `rec` command) to asciinema.org, where it can be watched and shared.

`asciinema rec demo.cast` + `asciinema play demo.cast` + `asciinema upload demo.cast` is a nice combo if you want to review an asciicast before publishing it on asciinema.org.

## `auth`

**Link your install ID with your asciinema.org user account.**

If you want to manage your recordings (change title/theme, delete) at asciinema.org you need to link your “install ID” with asciinema.org user account.

This command displays the URL to open in a web browser to do that. You may be asked to log in first.

Install ID is a random ID ([UUID v4](https://en.wikipedia.org/wiki/Universally_unique_identifier)) generated locally when you run asciinema for the first time, and saved at `$HOME/.config/asciinema/install-id`. It’s purpose is to connect local machine with uploaded recordings, so they can later be associated with asciinema.org account. This way we decouple uploading from account creation, allowing them to happen in any order.

> A new install ID is generated on each machine and system user account you use asciinema on, so in order to keep all recordings under a single asciinema.org account you need to run `asciinema auth` on all of those machines.

> asciinema versions prior to 2.0 confusingly referred to install ID as “API token”.



------------------

# Configuration file

You can configure asciinema by creating config file at `$HOME/.config/asciinema/config`.

Configuration is split into sections (`[api]`, `[record]`, `[play]`). Here’s a list of all available options for each section:

```
[api]

; API server URL, default: https://asciinema.org
; If you run your own instance of asciinema-server then set its address here
; It can also be overriden by setting ASCIINEMA_API_URL environment variable
url = https://asciinema.example.com

[record]

; Command to record, default: $SHELL
command = /bin/bash -l

; Enable stdin (keyboard) recording, default: no
stdin = yes

; List of environment variables to capture, default: SHELL,TERM
env = SHELL,TERM,USER

; Limit recorded terminal inactivity to max n seconds, default: off
idle_time_limit = 2

; Answer "yes" to all interactive prompts, default: no
yes = true

; Be quiet, suppress all notices/warnings, default: no
quiet = true

[play]

; Playback speed (can be fractional), default: 1
speed = 2

; Limit replayed terminal inactivity to max n seconds, default: off
idle_time_limit = 1
```

A very minimal config file could look like that:

```
[record]
idle_time_limit = 2
```

Config directory location can be changed by setting `$ASCIINEMA_CONFIG_HOME` environment variable.

If `$XDG_CONFIG_HOME` is set on Linux then asciinema uses `$XDG_CONFIG_HOME/asciinema` instead of `$HOME/.config/asciinema`.

> asciinema versions prior to 1.1 used `$HOME/.asciinema`. If you have it there you should `mv $HOME/.asciinema $HOME/.config/asciinema`.

- [Contributing](https://asciinema.org/contributing)

- [Terms of Service](https://asciinema.org/tos)

- [Privacy Policy](https://asciinema.org/privacy)

- [Contact](https://asciinema.org/contact)

  

---------------

# Sharing & embedding

You can share any recording by copying its URL and sending it to a friend or posting it on a social network. asciinema.org supports oEmbed/Open Graph/Twitter Card protocols, displaying a nice thumbnail where possible.

You can also easily embed an asciicast on any HTML page. If you want to put a recording in a blog post, a project’s documentation or in a conference talk’s slides, you can do it by copy-pasting one of the embed scripts.

## Sharing a link

You can get the share link for a specific asciicast by clicking on “Share” link on asciicast page.

Any of the options listed in “Customizing the playback” section below can be appended to the asciicast URL as the query params, e.g.:

```
https://asciinema.org/a/14?t=25&speed=2&theme=solarized-dark
```

Visiting this link will start the playback at 25s and play at double speed, using Solarized Dark terminal theme.

## Embedding image link

Embedding as an image link is useful in places where scripts are not allowed, e.g. in a project’s README file.

You can get the embed snippets for a specific asciicast by clicking on “Share” link on asciicast page.

This is how they look for asciicast 14:

HTML:

```
<a href="https://asciinema.org/a/14"><img src="https://asciinema.org/a/14.png" width="836"/></a>
```

Markdown:

```
[![asciicast](https://asciinema.org/a/14.png)](https://asciinema.org/a/14)
```

You can pass extra options (listed in “Customizing the playback” below) to the linked URL as query params. For example, to start the playback automatically when opening linked asciicast page append `?autoplay=1` to the asciicast URL in `href` attribute:

```
<a href="https://asciinema.org/a/14?autoplay=1"><img src="https://asciinema.org/a/14.png" width="836"/></a>
```

## Embedding the player

If you’re embedding on your own page or on a site which permits script tags, you can use the full player widget.

You can get the widget script for a specific asciicast by clicking on “Embed” link on asciicast page.

It looks like this:

```
<script src="https://asciinema.org/a/14.js" id="asciicast-14" async></script>
```

The player shows up right at the place where the script is pasted. Let’s look at the following markup:

```
<p>This is some text.</p>
<script src="https://asciinema.org/a/14.js" id="asciicast-14" async></script>
<p>This is some other text.</p>
```

The player is displayed between the two paragraphs, as a `div` element with “asciicast” class.

The embed script supports all customization options (see the section below). An option can be specified by adding it as a `data-*option-name*=”*value*”` attribute to the script tag.

For example, to make the embedded player autostart playback when loaded and use big font, use the following script:

```
<script src="https://asciinema.org/a/14.js" id="asciicast-14" async data-autoplay="true" data-size="big"></script>
```

## Customizing the playback

The player supports several options that control the behavior and look of it. Append them to the URL (`?speed=2&theme=tango`) or set them as data attributes on embed script (`data-speed="2" data-theme="tango"`).

### **startAt** / **t**

The `startAt` (or `t`) option specifies the time at which the playback should start. The default is `startAt=0` (play from the beginning).

Accepted formats: `ss`, `mm:ss`, `hh:mm:ss`.

NOTE: when `startAt` is specified then `autoplay=1` is implied. To prevent the player from starting automatically when `startAt` option is set you have to explicitly set `autoplay=0`.

### **autoplay**

The `autoplay` option controls whether the playback should automatically start when the player loads. Accepted values:

- 0 / false - do not start playback automatically (default)
- 1 / true - start playback automatically

### **preload**

The `preload` option controls whether the player should immediately start fetching the recording.

- 0 / false - do not preload the recording, wait for user action
- 1 / true - preload the recording

Defaults to 1 for asciinema.org URLs, to 0 for embed script.

### **loop**

The `loop` option allows for looping the playback. This option is usually combined with `autoplay` option. Accepted values:

- 0 / false - disable looping (default)
- 1 / true - enable looping

### **speed**

The `speed` option alters the playback speed. The default speed is 1 which means it plays at the unaltered, original speed.

### **idleTimeLimit** / **i**

The `idleTimeLimit` (or `i`) option allows reducing terminal inactivity periods to a given number of seconds.

For example, when set to 2 any inactivity longer than 2 seconds will be “compressed” to 2 seconds.

When not specified it defaults to (first non-blank):

- the “Idle time limit” value set on asciicast’s settings page,
- `idle_time_limit` value from asciicast header (saved when passing `-i <sec>` to `asciinema rec`),
- no limit, when it was not specified at the time of recording.

### **theme**

The `theme` option allows overriding a theme used for the terminal. It defaults to a theme set by the asciicast author (or to “asciinema” if not set by the author). The available themes are:

- asciinema
- tango
- solarized-dark
- solarized-light
- monokai

### **cols**

The `cols` option allows overriding width (in characters) of the emulated terminal. By default the recorded terminal’s width is used.

### **rows**

The `rows` option allows overriding height (in lines) of the emulated terminal. By default the recorded terminal’s height is used.

## oEmbed / Open Graph / Twitter Card

asciinema supports [oEmbed](https://oembed.com/), [Open Graph](http://ogp.me/) and [Twitter Card](https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/getting-started) APIs. When you share an asciicast on Twitter, Slack, Facebook, Google+ or any other site which supports one of these APIs, the asciicast is presented in a rich form (usually with a title, author, description and a thumbnail image), linking to your recording on asciinema.org.